import gleam/dict
import gleam/erlang/process.{type Subject, call, send}
import gleam/otp/actor
import types.{
  type ApiError, type CacheMessage, type CacheState, type GitHubRepo,
  type GitHubStats, ApiError, CacheEntry, CacheState, GetRepos, GetStats,
  SetRepos, SetStats,
}

const ttl_seconds = 3600

pub fn new() {
  actor.start(CacheState(dict.new(), dict.new()), handle_message)
}

pub fn get_stats(cache: Subject(CacheMessage)) -> Result(GitHubStats, ApiError) {
  call(cache, GetStats, 5000)
}

pub fn set_stats(cache: Subject(CacheMessage), stats: GitHubStats) {
  send(cache, SetStats(stats))
}

pub fn get_repos(
  cache: Subject(CacheMessage),
) -> Result(List(GitHubRepo), ApiError) {
  call(cache, GetRepos, 5000)
}

pub fn set_repos(cache: Subject(CacheMessage), repos: List(GitHubRepo)) {
  send(cache, SetRepos(repos))
}

fn handle_message(message: CacheMessage, state: CacheState) {
  case message {
    GetStats(reply) -> {
      let now = get_timestamp()
      case dict.get(state.stats, "github") {
        Ok(CacheEntry(value, expires_at)) if expires_at > now -> {
          send(reply, Ok(value))
          actor.continue(state)
        }
        _ -> {
          send(reply, Error(ApiError("Cache miss")))
          actor.continue(state)
        }
      }
    }

    SetStats(stats) -> {
      let expires_at = get_timestamp() + ttl_seconds
      let new_stats =
        dict.insert(state.stats, "github", CacheEntry(stats, expires_at))
      actor.continue(CacheState(..state, stats: new_stats))
    }

    GetRepos(reply) -> {
      let now = get_timestamp()
      case dict.get(state.repos, "github") {
        Ok(CacheEntry(value, expires_at)) if expires_at > now -> {
          send(reply, Ok(value))
          actor.continue(state)
        }
        _ -> {
          send(reply, Error(ApiError("Cache miss")))
          actor.continue(state)
        }
      }
    }

    SetRepos(repos) -> {
      let expires_at = get_timestamp() + ttl_seconds
      let new_repos =
        dict.insert(state.repos, "github", CacheEntry(repos, expires_at))
      actor.continue(CacheState(..state, repos: new_repos))
    }
  }
}

fn get_timestamp() -> Int {
  let now = erlang_now()
  now
}

@external(erlang, "erlang", "system_time")
fn erlang_now() -> Int
