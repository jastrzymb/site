import lustre/attribute
import gleam/int
import gleam/list
import lustre/element.{type Element}
import lustre/element/html

// Terminal Card Component
pub fn terminal_card(title: String, content: List(Element(a))) -> Element(a) {
  html.div([attribute.class("terminal-card")], [
    html.div([attribute.class("terminal-header")], [
      html.text(title),
    ]),
    html.div([attribute.class("terminal-body")], content),
  ])
}

// Button Components
pub fn btn_primary(href: String, text: String) -> Element(a) {
  html.a(
    [
      attribute.href(href),
      attribute.class("btn btn-primary"),
    ],
    [html.text(text)],
  )
}

pub fn btn_secondary(href: String, text: String) -> Element(a) {
  html.a(
    [
      attribute.href(href),
      attribute.class("btn btn-secondary"),
    ],
    [html.text(text)],
  )
}

// Project Card Component
pub fn project_card(
  name: String,
  description: String,
  language: String,
  language_color: String,
  stars: Int,
  forks: Int,
  url: String,
) -> Element(a) {
  html.a(
    [
      attribute.href(url),
      attribute.attribute("target", "_blank"),
      attribute.attribute("rel", "noopener noreferrer"),
      attribute.class("project-card"),
    ],
    [
      html.div([attribute.class("project-header")], [
        html.span([attribute.class("project-title")], [
          html.span([attribute.class("project-folder")], [html.text("📁")]),
          html.text(" " <> name),
        ]),
        html.span([attribute.class("project-git")], [html.text(".git")]),
      ]),
      html.div([attribute.class("project-body")], [
        html.p([attribute.class("project-description")], [
          html.text(description),
        ]),
        html.div([attribute.class("project-footer")], [
          case language {
            "" -> html.div([], [])
            _ ->
              html.div([attribute.class("project-language")], [
                html.span(
                  [
                    attribute.class("language-dot"),
                    attribute.style([#("background-color", language_color)]),
                  ],
                  [],
                ),
                html.text(language),
              ])
          },
          html.div([attribute.class("project-stats")], [
            case stars {
              0 -> html.text("")
              n ->
                html.span([attribute.class("project-stat")], [
                  html.text("⭐ " <> int.to_string(n)),
                ])
            },
            case forks {
              0 -> html.text("")
              n ->
                html.span([attribute.class("project-stat")], [
                  html.text("🍴 " <> int.to_string(n)),
                ])
            },
          ]),
        ]),
      ]),
    ],
  )
}

// Contact Link Component
pub fn contact_link(
  icon: String,
  label: String,
  value: String,
  href: String,
) -> Element(a) {
  html.a([attribute.href(href), attribute.class("contact-link")], [
    html.div([attribute.class("contact-icon")], [html.text(icon)]),
    html.div([], [
      html.div([attribute.class("contact-label")], [html.text(label)]),
      html.div([attribute.class("contact-value")], [html.text(value)]),
    ]),
  ])
}

// Organization Card Component
pub fn org_card(
  name: String,
  description: String,
  icon: String,
  status: String,
  languages: List(#(String, String)),
  url: String,
) -> Element(a) {
  html.a(
    [
      attribute.href(url),
      attribute.attribute("target", "_blank"),
      attribute.attribute("rel", "noopener noreferrer"),
      attribute.class("project-card"),
    ],
    [
      html.div([attribute.class("project-header")], [
        html.span([attribute.class("project-title")], [
          html.span([attribute.class("project-folder")], [html.text(icon)]),
          html.text(" " <> name),
        ]),
        html.span([attribute.class("project-git")], [html.text(status)]),
      ]),
      html.div([attribute.class("project-body")], [
        html.p([attribute.class("project-description")], [
          html.text(description),
        ]),
        html.div([attribute.class("project-footer")], [
          html.div(
            [attribute.class("project-language")],
            list.map(languages, fn(lang) {
              html.span([], [
                html.span(
                  [
                    attribute.class("language-dot"),
                    attribute.style([#("background-color", lang.1)]),
                  ],
                  [],
                ),
                html.text(lang.0),
              ])
            }),
          ),
        ]),
      ]),
    ],
  )
}

// Stat Box Component
pub fn stat_box(value: String, label: String, suffix: String) -> Element(a) {
  html.div([attribute.class("stat-box")], [
    html.div([attribute.class("stat-value")], [html.text(value)]),
    html.div([attribute.class("stat-label")], [html.text(label)]),
    html.div([attribute.class("stat-suffix")], [html.text(suffix)]),
  ])
}

// Tag Component
pub fn tag(text: String) -> Element(a) {
  html.span([attribute.class("tag")], [html.text(text)])
}

// Language Bar Component
pub fn language_bar(
  name: String,
  percent: Int,
  filled: String,
  empty: String,
) -> Element(a) {
  html.div([attribute.class("language-item")], [
    html.div([attribute.class("language-header")], [
      html.span([attribute.class("language-name")], [html.text(name)]),
      html.span([attribute.class("language-percent")], [
        html.text(int.to_string(percent) <> "%"),
      ]),
    ]),
    html.div([attribute.class("language-bar")], [
      html.span([attribute.class("language-filled")], [html.text(filled)]),
      html.span([attribute.class("language-empty")], [html.text(empty)]),
    ]),
  ])
}

// Info Grid Item Component
pub fn info_item(label: String, value: String) -> Element(a) {
  html.div([], [
    html.div([attribute.class("info-label")], [html.text(label)]),
    html.div([attribute.class("info-value")], [html.text(value)]),
  ])
}
