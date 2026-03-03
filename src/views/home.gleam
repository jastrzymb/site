import gleam/int
import gleam/list
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import types.{type GitHubRepo, type GitHubStats}
import views/components

pub fn page(
  stats: GitHubStats,
  repos: List(GitHubRepo),
  api_error: Bool,
) -> List(Element(a)) {
  [
    api_warning_banner(api_error),
    hero_section(stats),
    about_section(),
    projects_section(repos),
    orgs_section(),
    stats_section(stats),
    contact_section(),
    footer(),
    inline_scripts(),
  ]
}

fn api_warning_banner(show: Bool) -> Element(a) {
  case show {
    True ->
      html.div([attribute.class("api-warning-container")], [
        html.div(
          [attribute.id("api-warning"), attribute.class("api-warning visible")],
          [
            html.span([attribute.class("api-warning-icon")], [html.text("⚠️")]),
            html.div([attribute.class("api-warning-content")], [
              html.div([attribute.class("api-warning-title")], [
                html.text("API Connection Issue"),
              ]),
              html.div([attribute.class("api-warning-text")], [
                html.text(
                  "Failed to fetch latest GitHub stats. Data displayed may be stale or fallback values.",
                ),
              ]),
            ]),
          ],
        ),
      ])
    False ->
      html.div([attribute.class("api-warning-container")], [
        html.div(
          [attribute.id("api-warning"), attribute.class("api-warning")],
          [],
        ),
      ])
  }
}

fn hero_section(stats: GitHubStats) -> Element(a) {
  html.section([attribute.class("hero")], [
    html.div([attribute.class("hero-container")], [
      html.img([
        attribute.class("hero-image"),
        attribute.src("/goshawk_nobg.png"),
        attribute.alt("Goshawk"),
      ]),
      html.div([attribute.class("hero-content")], [
        html.p([attribute.class("hero-label")], [html.text("┌─ developer ─┐")]),
        html.h1([attribute.class("hero-title"), attribute.id("typewriter")], [
          html.text("Jastrzymb"),
        ]),
        html.p([attribute.class("hero-pronunciation")], [
          html.text("/ˈjas.tʂɘmp/ ─ Eurasian Goshawk"),
        ]),
        html.div([attribute.class("hero-tagline")], [
          html.p([], [html.text("Functional programming enthusiast.")]),
          html.p([], [
            html.text("I write code that tries hard not to have side effects."),
          ]),
        ]),
        html.div([attribute.class("hero-buttons")], [
          components.btn_primary("#projects", "View Projects →"),
          components.btn_secondary("#contact", "Get in Touch"),
        ]),
        html.div([attribute.class("hero-stats")], [
          html.div([attribute.class("hero-stat")], [
            html.div(
              [attribute.class("hero-stat-value"), attribute.id("hero-repos")],
              [
                html.text(int.to_string(stats.repos)),
              ],
            ),
            html.div([attribute.class("hero-stat-label")], [
              html.text("repositories"),
            ]),
          ]),
          html.div([attribute.class("hero-stat")], [
            html.div(
              [
                attribute.class("hero-stat-value"),
                attribute.id("hero-followers"),
              ],
              [
                html.text(int.to_string(stats.followers)),
              ],
            ),
            html.div([attribute.class("hero-stat-label")], [
              html.text("followers"),
            ]),
          ]),
          html.div([attribute.class("hero-stat")], [
            html.div(
              [
                attribute.class("hero-stat-value"),
                attribute.id("hero-languages"),
              ],
              [
                html.text(int.to_string(stats.languages)),
              ],
            ),
            html.div([attribute.class("hero-stat-label")], [
              html.text("languages"),
            ]),
          ]),
        ]),
      ]),
    ]),
    html.div([attribute.class("scroll-indicator")], [html.text("↓ scroll")]),
  ])
}

fn about_section() -> Element(a) {
  html.section([attribute.id("about"), attribute.class("reveal")], [
    html.div([attribute.class("section-container")], [
      html.p([attribute.class("section-label")], [html.text("┌─ who am i ─┐")]),
      html.h2([attribute.class("section-title")], [html.text("About")]),
      html.div([attribute.class("about-grid")], [
        components.terminal_card("about.md", [
          html.p([], [
            html.text("Hi, I'm "),
            html.strong([], [html.text("Michal S.")]),
            html.text(" (also known as "),
            html.span([attribute.class("highlight")], [html.text("Jastrzymb")]),
            html.text(
              "), a Rust/Python/Gleam developer & Project Lead with almost a decade of experience.",
            ),
          ]),
          html.p([], [
            html.text(
              "I've worked on countless projects, ranging from software engineering, to project management, game modding, and devops.",
            ),
          ]),
          html.p([], [
            html.text(
              "I'm very opinionated about Software, The world, and Everything in between.",
            ),
          ]),
          html.p([], [
            html.text(
              "In my free time, I enjoy playing Guitar, making software no one ends up using, and being ",
            ),
            html.a(
              [
                attribute.href(
                  "https://en.wikipedia.org/wiki/Color_blindness#Tritanopia",
                ),
                attribute.attribute("target", "_blank"),
                attribute.attribute("rel", "noopener noreferrer"),
              ],
              [html.text("colourblind")],
            ),
            html.text("."),
          ]),
          html.div([attribute.class("about-quote")], [
            html.text("Make illegal states unrepresentable."),
          ]),
        ]),
        html.div([], [
          components.terminal_card("languages.sh", [
            components.language_bar("Rust", 90, "██████████████████", "░░"),
            components.language_bar("Python", 80, "████████████████", "░░░░"),
            components.language_bar("Gleam", 60, "████████████", "░░░░░░░░"),
            components.language_bar("OCaml", 40, "████████", "░░░░░░░░░░░░"),
          ]),
          html.div([attribute.style([#("margin-bottom", "1.5rem")])], []),
          components.terminal_card("interests.txt", [
            html.div([attribute.class("tags")], [
              components.tag("Immutability"),
              components.tag("Algebraic data types"),
              components.tag("Pure functions"),
              components.tag("Type systems"),
              components.tag("Functional programming"),
            ]),
          ]),
          html.div([attribute.style([#("margin-bottom", "1.5rem")])], []),
          components.terminal_card("info.json", [
            html.div([attribute.class("info-grid")], [
              components.info_item("Location:", "Europe"),
              components.info_item("Pronouns:", "He/They"),
              components.info_item("Editor:", "Vi/Vim"),
              components.info_item("Languages:", "EN/PL"),
            ]),
          ]),
        ]),
      ]),
    ]),
  ])
}

fn projects_section(repos: List(GitHubRepo)) -> Element(a) {
  let project_cards = case repos {
    [] -> default_projects()
    repos ->
      list.map(list.take(repos, 6), fn(repo: GitHubRepo) {
        components.project_card(
          repo.name,
          repo.description,
          repo.language,
          language_color(repo.language),
          repo.stars,
          repo.forks,
          repo.url,
        )
      })
  }

  html.section(
    [attribute.id("projects"), attribute.class("projects-section reveal")],
    [
      html.div([attribute.class("section-container")], [
        html.p([attribute.class("section-label")], [html.text("┌─ my work ─┐")]),
        html.h2([attribute.class("section-title")], [html.text("Projects")]),
        html.p([attribute.class("section-description")], [
          html.text(
            "A selection of my open-source projects. I build tools that solve problems I encounter, mostly in functional programming languages.",
          ),
        ]),
        html.div(
          [attribute.class("projects-grid"), attribute.id("projects-grid")],
          project_cards,
        ),
        html.div(
          [
            attribute.style([#("text-align", "center"), #("margin-top", "3rem")]),
          ],
          [
            components.btn_secondary(
              "https://github.com/jastrzymb?tab=repositories",
              "View All Repositories →",
            ),
          ],
        ),
      ]),
    ],
  )
}

fn orgs_section() -> Element(a) {
  html.section(
    [
      attribute.id("orgs"),
      attribute.class("reveal"),
      attribute.style([#("background-color", "#f5f2e8"), #("padding", "6rem 0")]),
    ],
    [
      html.div([attribute.class("section-container")], [
        html.p([attribute.class("section-label")], [
          html.text("┌─ collaborations ─┐"),
        ]),
        html.h2([attribute.class("section-title")], [html.text("Organizations")]),
        html.p([attribute.class("section-description")], [
          html.text("Major projects I'm currently working on."),
        ]),
        html.div([attribute.class("projects-grid"), attribute.id("orgs-grid")], [
          components.org_card(
            "Ad Astra",
            "A multimedia adventure based on Homestuck, spanning both a webcomic and visual novel game.",
            "🌟",
            "active",
            [
              #("Gleam", "#ffaff3"),
              #("Rust", "#dea584"),
              #("Python", "#3572A5"),
            ],
            "https://github.com/ad-astra-hs",
          ),
          components.org_card(
            "Distrust",
            "A privacy-centric 'swiss army web' of decentralised places to store your data.",
            "🔒",
            "active",
            [#("Nix", "#7e7eff")],
            "https://github.com/jastrzymb/distrust",
          ),
          components.org_card(
            "u64.co.uk",
            "An unforgiving deep dive into selfhostable services on some of the most low-power devices available to consumers.",
            "🖥️",
            "early",
            [#("Coming soon...", "#8d6e63")],
            "https://u64.co.uk",
          ),
        ]),
      ]),
    ],
  )
}

fn stats_section(stats: GitHubStats) -> Element(a) {
  html.section(
    [attribute.id("stats"), attribute.class("stats-section reveal")],
    [
      html.div([attribute.class("section-container")], [
        html.p([attribute.class("section-label")], [
          html.text("┌─ by the numbers ─┐"),
        ]),
        html.h2([attribute.class("section-title")], [html.text("GitHub Stats")]),
        html.div([attribute.class("stats-grid")], [
          components.stat_box(
            int.to_string(stats.repos),
            "Repositories",
            "public",
          ),
          components.stat_box(
            int.to_string(stats.followers),
            "Followers",
            "on GitHub",
          ),
          components.stat_box(
            int.to_string(stats.following),
            "Following",
            "developers",
          ),
          components.stat_box(
            int.to_string(stats.stars),
            "Total Stars",
            "earned",
          ),
        ]),
      ]),
    ],
  )
}

fn contact_section() -> Element(a) {
  html.section([attribute.id("contact"), attribute.class("reveal")], [
    html.div([attribute.class("section-container")], [
      html.p([attribute.class("section-label")], [html.text("┌─ let's talk ─┐")]),
      html.h2([attribute.class("section-title")], [html.text("Get in Touch")]),
      html.p([attribute.class("section-description")], [
        html.text(
          "Interested in working together or have a question about one of my projects? Feel free to reach out.",
        ),
      ]),
      html.div([attribute.class("contact-grid")], [
        html.div([attribute.class("contact-links")], [
          components.contact_link(
            "✉",
            "Email",
            "me@mchal.lol",
            "mailto:me@mchal.lol",
          ),
          components.contact_link(
            "⚡",
            "GitHub",
            "@jastrzymb",
            "https://github.com/jastrzymb",
          ),
          html.div(
            [
              attribute.class("contact-link"),
              attribute.style([#("cursor", "default")]),
            ],
            [
              html.div([attribute.class("contact-icon")], [html.text("💬")]),
              html.div([], [
                html.div([attribute.class("contact-label")], [
                  html.text("Discord"),
                ]),
                html.div([attribute.class("contact-value")], [
                  html.text("@mchal_"),
                ]),
              ]),
            ],
          ),
          html.div(
            [
              attribute.class("contact-link"),
              attribute.style([#("cursor", "default")]),
            ],
            [
              html.div([attribute.class("contact-icon")], [html.text("📍")]),
              html.div([], [
                html.div([attribute.class("contact-label")], [
                  html.text("Location"),
                ]),
                html.div([attribute.class("contact-value")], [
                  html.text("Europe"),
                ]),
              ]),
            ],
          ),
        ]),
        html.div([attribute.class("terminal-message")], [
          html.div([attribute.class("terminal-header")], [
            html.text("message.txt"),
          ]),
          html.div([attribute.class("terminal-body")], [
            html.div([], [
              html.span([attribute.class("terminal-prompt")], [html.text("$")]),
              html.text(" cat availability.md"),
            ]),
            html.div([attribute.class("terminal-output")], [
              html.text("I'm currently open to:"),
            ]),
            html.ul([attribute.class("terminal-list")], [
              html.li([], [html.text("Freelance projects")]),
              html.li([], [html.text("Open source collaborations")]),
              html.li([], [html.text("Consulting on FP/Type systems")]),
              html.li([], [html.text("Interesting conversations")]),
            ]),
            html.div([], [
              html.span([attribute.class("terminal-prompt")], [html.text("$")]),
              html.text(" echo \"Looking forward to hearing from you!\""),
            ]),
            html.div([attribute.class("terminal-output")], [
              html.text("Looking forward to hearing from you!"),
            ]),
            html.div([], [
              html.span([attribute.class("terminal-prompt")], [html.text("$")]),
              html.text(" "),
              html.span([attribute.class("cursor-blink")], []),
            ]),
          ]),
        ]),
      ]),
    ]),
  ])
}

fn footer() -> Element(a) {
  html.footer([], [
    html.div([attribute.class("footer-container")], [
      html.div([attribute.class("footer-content")], [
        html.div([attribute.class("footer-copyleft")], [
          html.span([attribute.class("copyleft-symbol")], [
            html.text("Copyleft 🄯"),
          ]),
          html.text(" Nobody; "),
          html.span([attribute.class("muted")], [
            html.text("Nothing is original and everything is derivative."),
          ]),
        ]),
        html.div([attribute.class("footer-links")], [
          html.a(
            [
              attribute.href("https://github.com/jastrzymb"),
              attribute.attribute("target", "_blank"),
              attribute.attribute("rel", "noopener noreferrer"),
            ],
            [html.text("GitHub")],
          ),
          html.a([attribute.href("mailto:me@mchal.lol")], [html.text("Email")]),
        ]),
      ]),
      html.div([attribute.class("footer-bottom")], [
        html.text("Made with "),
        html.span([attribute.class("heart")], [html.text("♥")]),
        html.text(" (and Gleam, Wisp/Mist, and Lustre too.)"),
      ]),
    ]),
  ])
}

fn inline_scripts() -> Element(a) {
  html.script(
    [],
    "
    // Navigation scroll effect
    const navbar = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    });

    // Scroll reveal animation
    const reveals = document.querySelectorAll('.reveal');
    
    const revealOnScroll = () => {
      reveals.forEach(element => {
        const elementTop = element.getBoundingClientRect().top;
        const windowHeight = window.innerHeight;
        
        if (elementTop < windowHeight - 100) {
          element.classList.add('visible');
        }
      });
    };

    window.addEventListener('scroll', revealOnScroll);
    revealOnScroll(); // Initial check
  ",
  )
}

fn language_color(language: String) -> String {
  case language {
    "Rust" -> "#dea584"
    "Python" -> "#3572A5"
    "Gleam" -> "#ffaff3"
    "OCaml" -> "#ef7a08"
    "Nix" -> "#7e7eff"
    "Shell" -> "#89e051"
    "HTML" -> "#e34c26"
    "Ruby" -> "#701516"
    "JavaScript" -> "#f1e05a"
    "TypeScript" -> "#2b7489"
    "Go" -> "#00ADD8"
    "C" -> "#555555"
    "C++" -> "#f34b7d"
    "Java" -> "#b07219"
    _ -> "#8d6e63"
  }
}

fn default_projects() -> List(Element(a)) {
  [
    components.project_card(
      "clip",
      "A clipboard manager for the terminal",
      "OCaml",
      "#ef7a08",
      0,
      0,
      "https://github.com/jastrzymb/clip",
    ),
    components.project_card(
      "the-haiku-license",
      "A license in full / Do right and attribute well / Say more using less",
      "Nix",
      "#7e7eff",
      0,
      0,
      "https://github.com/jastrzymb/the-haiku-license",
    ),
    components.project_card(
      "pronounce",
      "A pronunciation guide utility",
      "Python",
      "#3572A5",
      4,
      0,
      "https://github.com/jastrzymb/pronounce",
    ),
    components.project_card(
      "rpass",
      "A simple password manager in Rust",
      "Rust",
      "#dea584",
      0,
      0,
      "https://github.com/jastrzymb/rpass",
    ),
    components.project_card(
      "nofetch",
      "platform agnostic simple fetch tool",
      "Shell",
      "#89e051",
      8,
      4,
      "https://github.com/jastrzymb/nofetch",
    ),
    components.project_card(
      "nolicense",
      "truly free guidelines for distribution and licensing of code",
      "",
      "#8d6e63",
      3,
      0,
      "https://github.com/jastrzymb/nolicense",
    ),
  ]
}
