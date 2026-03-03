import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn base(title: String, content: List(Element(a))) -> Element(a) {
  html.html([attribute.attribute("lang", "en")], [
    html.head([], [
      html.meta([attribute.attribute("charset", "UTF-8")]),
      html.meta([
        attribute.name("viewport"),
        attribute.attribute("content", "width=device-width, initial-scale=1.0"),
      ]),
      html.meta([
        attribute.name("description"),
        attribute.attribute(
          "content",
          "Michal S. (Jastrzymb) - Functional programming enthusiast and developer. Rust, Gleam, Python.",
        ),
      ]),
      html.meta([
        attribute.name("robots"),
        attribute.attribute("content", "index, follow"),
      ]),
      html.link([
        attribute.rel("canonical"),
        attribute.href("https://mchal.lol/"),
      ]),
      html.meta([
        attribute.attribute("property", "og:title"),
        attribute.attribute("content", title),
      ]),
      html.meta([
        attribute.attribute("property", "og:description"),
        attribute.attribute(
          "content",
          "Michal S. (Jastrzymb) - Functional programming enthusiast and developer.",
        ),
      ]),
      html.meta([
        attribute.attribute("property", "og:type"),
        attribute.attribute("content", "website"),
      ]),
      html.meta([
        attribute.attribute("property", "og:url"),
        attribute.attribute("content", "https://mchal.lol/"),
      ]),
      html.meta([
        attribute.attribute("property", "og:image"),
        attribute.attribute("content", "https://mchal.lol/goshawk_bg.png"),
      ]),
      html.meta([
        attribute.attribute("name", "twitter:card"),
        attribute.attribute("content", "summary_large_image"),
      ]),
      html.meta([
        attribute.attribute("name", "twitter:title"),
        attribute.attribute("content", title),
      ]),
      html.meta([
        attribute.attribute("name", "twitter:description"),
        attribute.attribute(
          "content",
          "Michal S. (Jastrzymb) - Functional programming enthusiast and developer.",
        ),
      ]),
      html.meta([
        attribute.attribute("name", "twitter:image"),
        attribute.attribute("content", "https://mchal.lol/goshawk_bg.png"),
      ]),
      html.script(
        [attribute.attribute("type", "application/ld+json")],
        "{\"@context\":\"https://schema.org\",\"@type\":\"Person\",\"name\":\"Michal S.\",\"alternateName\":\"Jastrzymb\",\"jobTitle\":\"Developer and Project Lead\",\"url\":\"https://mchal.lol/\",\"sameAs\":[\"https://github.com/jastrzymb\",\"mailto:me@mchal.lol\"],\"knowsAbout\":[\"Functional Programming\",\"Rust\",\"Gleam\",\"Python\",\"Type Systems\"]}",
      ),
      html.title([], title),
      html.link([
        attribute.rel("preconnect"),
        attribute.href("https://fonts.googleapis.com"),
      ]),
      html.link([
        attribute.rel("preconnect"),
        attribute.href("https://fonts.gstatic.com"),
        attribute.attribute("crossorigin", ""),
      ]),
      html.link([
        attribute.rel("stylesheet"),
        attribute.href(
          "https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600;700&family=Space+Mono:wght@400;700&display=swap",
        ),
      ]),
      html.link([
        attribute.rel("icon"),
        attribute.attribute("type", "image/svg+xml"),
        attribute.href(
          "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Ccircle cx='16' cy='16' r='16' fill='%23f5f2e8'/%3E%3Ctext x='50%25' y='50%25' dominant-baseline='central' text-anchor='middle' font-family='Space Mono, monospace' font-weight='700' font-size='32' fill='%233e2723'%3EJ%3C/text%3E%3C/svg%3E",
        ),
      ]),
      html.style(
        [],
        ":root {
  --bg-cream: #f5f2e8;
  --bg-cream-dark: #ebe5d5;
  --bg-brown: #3e2723;
  --text-brown: #3e2723;
  --text-brown-medium: #5d4037;
  --text-brown-light: #8d6e63;
  --text-cream: #f5f2e8;
  --accent-rust: #a0522d;
  --accent-gold: #d4a574;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
html {
  scroll-behavior: smooth;
}
body {
  font-family: 'IBM Plex Mono', 'Courier New', monospace;
  background-color: var(--bg-cream);
  color: var(--text-brown);
  line-height: 1.7;
  -webkit-font-smoothing: antialiased;
}
::selection {
  background-color: var(--text-brown);
  color: var(--bg-cream);
}
nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 50;
  background-color: transparent;
  transition: all 0.3s ease;
}
nav.scrolled {
  background-color: var(--bg-cream);
  border-bottom: 2px solid var(--text-brown);
}
.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 1rem 1.5rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.logo {
  font-family: 'Space Mono', monospace;
  font-weight: 700;
  font-size: 1.125rem;
  color: var(--text-brown);
  text-decoration: none;
}
.nav-links {
  display: none;
  align-items: center;
  gap: 0.25rem;
}
@media (min-width: 768px) {
  .nav-links {
    display: flex;
  }
}
.nav-links a {
  padding: 0.5rem 1rem;
  font-size: 0.875rem;
  font-weight: 500;
  color: var(--text-brown);
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  transition: color 0.2s ease;
}
.nav-links a:hover {
  color: var(--accent-rust);
}
.nav-separator {
  color: var(--text-brown-light);
}
.github-link {
  font-size: 0.875rem;
  color: var(--text-brown);
  text-decoration: none;
}
.github-link:hover {
  color: var(--accent-rust);
}
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  background-color: var(--bg-cream);
  padding-top: 5rem;
}
.hero-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 5rem 1.5rem;
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
  align-items: center;
}
@media (min-width: 1024px) {
  .hero-container {
    grid-template-columns: 1fr 1fr;
  }
}
.hero-image {
  order: 2;
  max-width: 100%;
  height: auto;
  object-fit: contain;
}
@media (min-width: 1024px) {
  .hero-image {
    order: 1;
  }
}
.hero-content {
  order: 1;
}
.hero-content > * + * {
  margin-top: 1.5rem;
}
@media (min-width: 1024px) {
  .hero-content {
    order: 2;
  }
}
.hero-label {
  font-size: 0.875rem;
  color: var(--text-brown-light);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  margin-bottom: 0.5rem;
}
.hero-title {
  font-family: 'Space Mono', monospace;
  font-size: clamp(3rem, 8vw, 4.5rem);
  font-weight: 700;
  color: var(--text-brown);
  line-height: 1.2;
  margin-bottom: 0.5rem;
}
.hero-pronunciation {
  font-size: 1.125rem;
  color: var(--text-brown-medium);
  margin-bottom: 1.5rem;
}
.hero-tagline {
  border-left: 4px solid var(--accent-rust);
  padding-left: 1.5rem;
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
  margin-bottom: 1.5rem;
}
.hero-tagline p:first-child {
  font-size: 1.25rem;
  font-weight: 500;
  color: var(--text-brown);
  margin-bottom: 0.25rem;
}
.hero-tagline p:last-child {
  font-size: 1.125rem;
  color: var(--text-brown-medium);
}
.hero-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  margin-bottom: 2rem;
}
.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  font-family: 'Space Mono', monospace;
  font-weight: 600;
  font-size: 0.875rem;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.2s ease;
  border: 2px solid var(--text-brown);
}
.btn-primary {
  background-color: var(--text-brown);
  color: var(--text-cream);
  box-shadow: 4px 4px 0 var(--text-brown-medium);
}
.btn-primary:hover {
  background-color: var(--text-brown-medium);
  transform: translate(-2px, -2px);
  box-shadow: 6px 6px 0 var(--text-brown);
}
.btn-secondary {
  background-color: transparent;
  color: var(--text-brown);
}
.btn-secondary:hover {
  background-color: var(--text-brown);
  color: var(--text-cream);
}
.hero-stats {
  display: flex;
  gap: 2rem;
}
.hero-stat {
  text-align: center;
}
.hero-stat-value {
  font-family: 'Space Mono', monospace;
  font-size: 1.875rem;
  font-weight: 700;
  color: var(--text-brown);
}
.hero-stat-label {
  font-size: 0.875rem;
  color: var(--text-brown-light);
}
.scroll-indicator {
  position: absolute;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
  color: var(--text-brown-light);
  font-size: 0.875rem;
  animation: bounce 2s infinite;
}
@keyframes bounce {
  0%, 20%, 50%, 80%, 100% { transform: translateX(-50%) translateY(0); }
  40% { transform: translateX(-50%) translateY(-10px); }
  60% { transform: translateX(-50%) translateY(-5px); }
}
@media (max-width: 1023px) {
  .scroll-indicator {
    display: none;
  }
}
section {
  padding: 6rem 0;
}
.section-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1.5rem;
}
.section-label {
  font-size: 0.875rem;
  color: var(--text-brown-light);
  text-transform: uppercase;
  letter-spacing: 0.15em;
  margin-bottom: 0.5rem;
}
.section-title {
  font-family: 'Space Mono', monospace;
  font-size: 2.25rem;
  font-weight: 700;
  color: var(--text-brown);
  margin-bottom: 1rem;
}
.section-description {
  color: var(--text-brown-medium);
  max-width: 42rem;
  margin-bottom: 2rem;
}
.terminal-card {
  background-color: var(--bg-cream-dark);
  border: 2px solid var(--text-brown);
  box-shadow: 4px 4px 0 var(--text-brown);
  transition: all 0.2s ease;
}
.terminal-card:hover {
  transform: translate(-4px, -4px);
  box-shadow: 8px 8px 0 var(--text-brown);
}
.terminal-header {
  background-color: var(--text-brown);
  color: var(--text-cream);
  padding: 0.5rem 1rem;
  font-size: 0.875rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.terminal-header::before {
  content: '● ● ●';
  letter-spacing: 0.25rem;
  opacity: 0.5;
}
.terminal-body {
  padding: 1.5rem;
}
#about {
  background-color: var(--bg-brown);
}
#about .section-label,
#about .section-title {
  color: var(--text-cream);
}
#about .terminal-card {
  background-color: var(--text-brown);
  border-color: var(--text-cream);
}
#about .terminal-header {
  background-color: var(--text-cream);
  color: var(--text-brown);
}
#about .terminal-body {
  color: var(--text-cream);
}
#about .about-text p,
#about .about-text strong {
  color: var(--text-cream);
}
#about .about-quote {
  color: var(--text-cream);
  border-color: var(--accent-gold);
}
#about .language-name {
  color: var(--text-cream);
}
#about .language-percent {
  color: var(--accent-gold);
}
#about .info-label {
  color: var(--accent-gold);
}
#about .info-value {
  color: var(--text-cream);
}
#about .tag {
  border-color: var(--text-cream);
  color: var(--text-cream);
}
#about .language-filled {
  color: var(--accent-gold);
}
#about .language-empty {
  color: var(--text-cream);
  opacity: 0.4;
}
#about a {
  color: var(--accent-gold);
}
#about a:hover {
  color: var(--text-cream);
}
#about .highlight {
  color: var(--accent-gold);
}
.about-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
}
@media (min-width: 1024px) {
  .about-grid {
    grid-template-columns: 1fr 1fr;
  }
}
.about-text p {
  margin-bottom: 1rem;
  color: var(--text-brown);
}
.about-text strong {
  color: var(--text-brown);
}
.about-text .highlight {
  color: var(--accent-rust);
}
.about-quote {
  border-left: 4px solid var(--accent-rust);
  padding-left: 1rem;
  margin-top: 1.5rem;
  font-style: italic;
  color: var(--text-brown);
}
.language-item {
  margin-bottom: 1rem;
}
.language-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 0.25rem;
  font-size: 0.875rem;
}
.language-name {
  color: var(--text-brown);
}
.language-percent {
  color: var(--text-brown-light);
}
.language-bar {
  font-family: 'Courier New', monospace;
  font-size: 0.875rem;
  line-height: 1.2;
}
.language-filled {
  color: var(--accent-rust);
}
.language-empty {
  color: var(--text-brown-light);
  opacity: 0.3;
}
.tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}
.tag {
  padding: 0.25rem 0.75rem;
  border: 2px solid var(--text-brown);
  font-size: 0.875rem;
  color: var(--text-brown);
}
.info-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
  font-size: 0.875rem;
}
.info-label {
  color: var(--text-brown-light);
}
.info-value {
  color: var(--text-brown);
}
.projects-section {
  background-color: var(--bg-cream-dark);
}
.projects-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
}
@media (min-width: 640px) {
  .projects-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 1024px) {
  .projects-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
.project-card {
  display: block;
  background-color: var(--bg-cream-dark);
  border: 2px solid var(--text-brown);
  box-shadow: 4px 4px 0 var(--text-brown);
  text-decoration: none;
  transition: all 0.2s ease;
}
.project-card:hover {
  transform: translate(-4px, -4px);
  box-shadow: 8px 8px 0 var(--text-brown);
}
.project-header {
  background-color: var(--text-brown);
  color: var(--text-cream);
  padding: 0.5rem 1rem;
  font-size: 0.875rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.project-title {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.project-folder {
  color: var(--accent-gold);
}
.project-git {
  opacity: 0.6;
  font-size: 0.75rem;
}
.project-body {
  padding: 1.5rem;
  min-height: 120px;
  display: flex;
  flex-direction: column;
}
.project-description {
  color: var(--text-brown-medium);
  font-size: 0.875rem;
  flex-grow: 1;
  margin-bottom: 1rem;
}
.project-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 1rem;
  border-top: 1px solid #d4c4a8;
}
.project-language {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.75rem;
  color: var(--text-brown-light);
}
.language-dot {
  width: 0.75rem;
  height: 0.75rem;
  border-radius: 50%;
}
.project-stats {
  display: flex;
  gap: 1rem;
  font-size: 0.75rem;
  color: var(--text-brown-light);
}
.project-stat {
  display: flex;
  align-items: center;
  gap: 0.25rem;
}
.loading {
  opacity: 0.6;
  animation: pulse 1.5s ease-in-out infinite;
}
@keyframes pulse {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}
.loading-text::after {
  content: '...';
  animation: dots 1.5s steps(4, end) infinite;
}
@keyframes dots {
  0%, 20% { content: ''; }
  40% { content: '.'; }
  60% { content: '..'; }
  80%, 100% { content: '...'; }
}
.stats-section {
  background-color: var(--bg-brown);
}
.stats-section .section-label,
.stats-section .section-title {
  color: var(--text-cream);
}
.stats-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1.5rem;
  margin-bottom: 3rem;
}
@media (min-width: 768px) {
  .stats-grid {
    grid-template-columns: repeat(4, 1fr);
  }
}
.stat-box {
  border: 2px solid var(--text-cream);
  padding: 1.5rem;
  text-align: center;
}
.stat-value {
  font-family: 'Space Mono', monospace;
  font-size: 2.25rem;
  font-weight: 700;
  color: var(--text-cream);
}
.stat-label {
  color: var(--accent-gold);
  font-size: 0.875rem;
  margin-top: 0.25rem;
}
.stat-suffix {
  color: var(--text-brown-light);
  font-size: 0.75rem;
}
.contact-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
}
@media (min-width: 1024px) {
  .contact-grid {
    grid-template-columns: 1fr 1fr;
  }
}
.contact-links {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
.contact-link {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
  background-color: var(--bg-cream-dark);
  border: 2px solid var(--text-brown);
  box-shadow: 4px 4px 0 var(--text-brown);
  text-decoration: none;
  transition: all 0.2s ease;
}
.contact-link:hover {
  transform: translate(-4px, -4px);
  box-shadow: 8px 8px 0 var(--text-brown);
}
.contact-icon {
  width: 3rem;
  height: 3rem;
  background-color: var(--text-brown);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--text-cream);
}
.contact-label {
  font-size: 0.75rem;
  color: var(--text-brown-light);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}
.contact-value {
  color: var(--text-brown);
  font-weight: 500;
}
.terminal-message {
  background-color: var(--bg-cream-dark);
  border: 2px solid var(--text-brown);
  box-shadow: 4px 4px 0 var(--text-brown);
}
.terminal-message .terminal-body {
  font-size: 0.875rem;
}
.terminal-prompt {
  color: var(--accent-rust);
}
.terminal-output {
  color: var(--text-brown-medium);
  margin: 0.5rem 0;
}
.terminal-list {
  list-style: none;
  padding-left: 1rem;
  margin: 0.5rem 0;
}
.terminal-list li {
  color: var(--text-brown-medium);
  margin-bottom: 0.25rem;
}
.terminal-list li::before {
  content: '• ';
  color: var(--accent-rust);
}
.cursor-blink {
  display: inline-block;
  width: 0.5rem;
  height: 1rem;
  background-color: var(--text-brown);
  animation: blink 1s step-end infinite;
}
@keyframes blink {
  50% { opacity: 0; }
}
footer {
  background-color: var(--bg-brown);
  border-top: 2px solid var(--text-brown-medium);
  padding: 2rem 0;
}
.footer-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1.5rem;
}
.footer-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
}
@media (min-width: 768px) {
  .footer-content {
    flex-direction: row;
    justify-content: space-between;
  }
}
.footer-copyleft {
  color: var(--text-cream);
  font-size: 0.875rem;
  text-align: center;
}
.footer-copyleft .copyleft-symbol {
  color: var(--accent-gold);
}
.footer-copyleft .muted {
  color: var(--text-brown-light);
}
.footer-links {
  display: flex;
  gap: 1.5rem;
}
.footer-links a {
  color: var(--text-cream);
  text-decoration: none;
  font-size: 0.875rem;
}
.footer-links a:hover {
  color: var(--accent-gold);
}
.footer-bottom {
  text-align: center;
  padding-top: 1.5rem;
  border-top: 1px solid var(--text-brown-medium);
  color: var(--text-brown-light);
  font-size: 0.75rem;
}
.heart {
  color: var(--accent-rust);
}
.reveal {
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.6s ease;
}
.reveal.visible {
  opacity: 1;
  transform: translateY(0);
}
.api-warning-container {
  position: fixed;
  top: 5.5rem;
  right: 1rem;
  left: auto;
  z-index: 60;
  pointer-events: none;
  max-width: 400px;
}
.api-warning {
  display: none;
  background-color: #fef3cd;
  border: 2px solid #ffc107;
  color: #856404;
  padding: 0.75rem 1rem;
  border-radius: 4px;
  font-size: 0.8rem;
  align-items: flex-start;
  gap: 0.5rem;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  pointer-events: auto;
}
.api-warning.visible {
  display: flex;
}
.api-warning-icon {
  font-size: 1rem;
  flex-shrink: 0;
  margin-top: 0.1rem;
}
.api-warning-content {
  flex: 1;
}
.api-warning-title {
  font-weight: 600;
  margin-bottom: 0.15rem;
  font-size: 0.85rem;
}
.api-warning-text {
  opacity: 0.9;
  line-height: 1.4;
}
@media (max-width: 640px) {
  .api-warning-container {
    top: 3.5rem;
    right: 0.5rem;
    left: 0.5rem;
    max-width: none;
  }
  .api-warning {
    font-size: 0.75rem;
    padding: 0.5rem 0.75rem;
  }
}",
      ),
    ]),
    html.body([], [navigation(), ..content]),
  ])
}

fn navigation() -> Element(a) {
  html.nav([attribute.id("navbar"), attribute.class("nav")], [
    html.div([attribute.class("nav-container")], [
      html.a([attribute.href("#"), attribute.class("logo")], [
        html.text("┌Jastrzymb┐"),
      ]),
      html.div([attribute.class("nav-links")], [
        html.a([attribute.href("#about")], [html.text("About")]),
        html.span([attribute.class("nav-separator")], [html.text("|")]),
        html.a([attribute.href("#projects")], [html.text("Projects")]),
        html.span([attribute.class("nav-separator")], [html.text("|")]),
        html.a([attribute.href("#orgs")], [html.text("Orgs")]),
        html.span([attribute.class("nav-separator")], [html.text("|")]),
        html.a([attribute.href("#stats")], [html.text("Stats")]),
        html.span([attribute.class("nav-separator")], [html.text("|")]),
        html.a([attribute.href("#contact")], [html.text("Contact")]),
      ]),
      html.a(
        [
          attribute.href("https://github.com/jastrzymb"),
          attribute.attribute("target", "_blank"),
          attribute.attribute("rel", "noopener noreferrer"),
          attribute.class("github-link"),
        ],
        [html.text("[github]")],
      ),
    ]),
  ])
}
