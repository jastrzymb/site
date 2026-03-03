import gleam/dynamic
import gleam/http/request
import gleam/httpc
import gleam/int
import gleam/json
import gleam/list
import gleam/option
import gleam/string
import types.{
  type ApiError, type GitHubRepo, type GitHubStats, ApiError, GitHubRepo,
  GitHubStats,
}

pub fn fetch_user_stats(username: String) -> Result(GitHubStats, ApiError) {
  let url = "https://api.github.com/users/" <> username

  case make_github_request(url) {
    Ok(json_str) -> {
      case parse_user_json(json_str) {
        Ok(stats) -> Ok(stats)
        Error(e) -> Error(ApiError("Failed to parse user data: " <> e))
      }
    }
    Error(e) -> Error(e)
  }
}

pub fn fetch_repos(username: String) -> Result(List(GitHubRepo), ApiError) {
  let url =
    "https://api.github.com/users/"
    <> username
    <> "/repos?sort=updated&per_page=100"

  case make_github_request(url) {
    Ok(json_str) -> {
      case parse_repos_json(json_str) {
        Ok(repos) -> Ok(repos)
        Error(e) -> Error(ApiError("Failed to parse repos data: " <> e))
      }
    }
    Error(e) -> Error(e)
  }
}

fn make_github_request(url: String) -> Result(String, ApiError) {
  let req_result = request.to(url)

  case req_result {
    Error(_) -> Error(ApiError("Invalid URL: " <> url))
    Ok(req) -> {
      let req_with_headers =
        req
        |> request.set_header("Accept", "application/vnd.github.v3+json")
        |> request.set_header("User-Agent", "jastrzymb-site-gleam")

      case httpc.send(req_with_headers) {
        Ok(resp) -> {
          case resp.status {
            200 -> Ok(resp.body)
            404 -> Error(ApiError("GitHub user not found"))
            403 -> Error(ApiError("GitHub API rate limit exceeded"))
            status ->
              Error(ApiError("GitHub API error: HTTP " <> int.to_string(status)))
          }
        }
        Error(_) -> Error(ApiError("Failed to connect to GitHub API"))
      }
    }
  }
}

fn parse_user_json(json_str: String) -> Result(GitHubStats, String) {
  let decoder =
    dynamic.decode3(
      fn(public_repos, followers, following) {
        GitHubStats(
          repos: public_repos,
          followers: followers,
          following: following,
          stars: 0,
          languages: 0,
        )
      },
      dynamic.field("public_repos", dynamic.int),
      dynamic.field("followers", dynamic.int),
      dynamic.field("following", dynamic.int),
    )

  case json.decode(json_str, decoder) {
    Ok(stats) -> Ok(stats)
    Error(e) -> Error(string.inspect(e))
  }
}

fn parse_repos_json(json_str: String) -> Result(List(GitHubRepo), String) {
  let repo_decoder =
    dynamic.decode6(
      fn(name, description, language, stars, forks, url) {
        GitHubRepo(
          name: name,
          description: case description {
            option.Some("") | option.None -> "No description provided."
            option.Some(desc) -> desc
          },
          language: option.unwrap(language, ""),
          stars: stars,
          forks: forks,
          url: url,
        )
      },
      dynamic.field("name", dynamic.string),
      dynamic.field("description", dynamic.optional(dynamic.string)),
      dynamic.field("language", dynamic.optional(dynamic.string)),
      dynamic.field("stargazers_count", dynamic.int),
      dynamic.field("forks_count", dynamic.int),
      dynamic.field("html_url", dynamic.string),
    )

  let decoder = dynamic.list(repo_decoder)

  case json.decode(json_str, decoder) {
    Ok(repos) -> Ok(repos)
    Error(e) -> Error(string.inspect(e))
  }
}

pub fn calculate_total_stars(repos: List(GitHubRepo)) -> Int {
  list.fold(repos, 0, fn(acc, repo) { acc + repo.stars })
}

pub fn count_languages(repos: List(GitHubRepo)) -> Int {
  repos
  |> list.map(fn(r) { r.language })
  |> list.filter(fn(lang) { lang != "" })
  |> list.unique()
  |> list.length()
}
