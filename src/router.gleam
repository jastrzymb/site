import api/github as github_api
import cache/github as cache
import gleam/http/response
import lustre/element
import types.{GitHubStats}
import views/home
import views/layout
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: types.AppContext) -> Response {
  wisp.serve_static(req, under: "/", from: "priv/static", next: fn() {
    case wisp.path_segments(req) {
      [] -> handle_home(ctx)
      _ -> wisp.not_found()
    }
  })
}

fn handle_home(ctx: types.AppContext) -> Response {
  let #(stats, repos, api_error) = case cache.get_stats(ctx.cache) {
    Ok(stats) -> {
      case cache.get_repos(ctx.cache) {
        Ok(repos) -> #(stats, repos, False)
        Error(_) -> #(stats, [], False)
      }
    }
    Error(_) -> {
      case github_api.fetch_user_stats(ctx.github_username) {
        Ok(user_stats) -> {
          case github_api.fetch_repos(ctx.github_username) {
            Ok(repos) -> {
              let total_stars = github_api.calculate_total_stars(repos)
              let languages = github_api.count_languages(repos)
              let full_stats =
                GitHubStats(
                  ..user_stats,
                  stars: total_stars,
                  languages: languages,
                )
              cache.set_stats(ctx.cache, full_stats)
              cache.set_repos(ctx.cache, repos)
              #(full_stats, repos, False)
            }
            Error(_) -> {
              let fallback_stats =
                GitHubStats(
                  repos: 0,
                  followers: 0,
                  following: 0,
                  stars: 0,
                  languages: 0,
                )
              #(fallback_stats, [], True)
            }
          }
        }
        Error(_) -> {
          let fallback_stats =
            GitHubStats(
              repos: 0,
              followers: 0,
              following: 0,
              stars: 0,
              languages: 0,
            )
          #(fallback_stats, [], True)
        }
      }
    }
  }

  let html_content =
    home.page(stats, repos, api_error)
    |> layout.base("Jastrzymb - Functional Programming Enthusiast", _)
    |> element.to_document_string_builder()

  response.new(200)
  |> response.set_body(wisp.Text(html_content))
  |> response.set_header("content-type", "text/html; charset=utf-8")
  |> response.set_header("cache-control", "public, max-age=300")
}
