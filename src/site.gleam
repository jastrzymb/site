import cache/github as cache
import gleam/erlang/process
import gleam/int
import mist
import router
import types.{type AppContext, AppContext}
import wisp

const default_port = 8080

@external(erlang, "gleam_erlang_ffi", "get_env")
fn get_env(name: String) -> Result(String, Nil)

fn create_handler(ctx: AppContext) {
  fn(req: wisp.Request) -> wisp.Response { router.handle_request(req, ctx) }
}

pub fn main() {
  wisp.configure_logger()

  // Get port from environment or use default
  let port = case get_env("PORT") {
    Ok(port_str) -> {
      case int.parse(port_str) {
        Ok(p) -> p
        Error(_) -> default_port
      }
    }
    Error(_) -> default_port
  }

  // Get GitHub username from environment or use default
  let github_username = case get_env("GITHUB_USERNAME") {
    Ok(username) -> username
    Error(_) -> "jastrzymb"
  }

  // Initialize cache
  let assert Ok(cache_pid) = cache.new()

  let ctx = AppContext(github_username: github_username, cache: cache_pid)

  // Create handler with context
  let handler = create_handler(ctx)

  // Convert to mist handler and start server
  let mist_handler = wisp.mist_handler(handler, "unused-secret-key-base")

  let assert Ok(_) =
    mist.new(mist_handler)
    |> mist.port(port)
    |> mist.start_http()

  process.sleep_forever()
}
