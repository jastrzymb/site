import gleam/dict.{type Dict}
import gleam/erlang/process.{type Subject}

pub type CacheMessage {
  GetStats(reply: Subject(Result(GitHubStats, ApiError)))
  SetStats(GitHubStats)
  GetRepos(reply: Subject(Result(List(GitHubRepo), ApiError)))
  SetRepos(List(GitHubRepo))
}

pub type GitHubStats {
  GitHubStats(
    repos: Int,
    followers: Int,
    following: Int,
    stars: Int,
    languages: Int,
  )
}

pub type GitHubRepo {
  GitHubRepo(
    name: String,
    description: String,
    language: String,
    stars: Int,
    forks: Int,
    url: String,
  )
}

pub type CacheEntry(a) {
  CacheEntry(value: a, expires_at: Int)
}

pub type ApiError {
  ApiError(message: String)
}

pub type CacheState {
  CacheState(
    stats: Dict(String, CacheEntry(GitHubStats)),
    repos: Dict(String, CacheEntry(List(GitHubRepo))),
  )
}

pub type AppContext {
  AppContext(github_username: String, cache: Subject(CacheMessage))
}
