# jeancarlo.info

personal site & blog of jeancarlo barrios. built with [zola](https://www.getzola.org/).

## layout

```
config.toml                    — zola config (base_url, feed, extra.*)
content/_index.md              — home page stub (markup lives in the template)
content/writing/               — blog posts as markdown
templates/base.html            — shell: head, header/nav, footer, theme toggle
templates/index.html           — home page (hero, projects, research, writing, about)
templates/writing.html         — /writing/ post index
templates/writing-page.html    — individual post
static/colors_and_type.css     — design tokens (catppuccin + jetbrains mono)
static/site.css                — layout + component styles
static/assets/favicon.svg      — the jcb❯ tab mark
```

## run locally

```sh
zola serve
# then open http://127.0.0.1:1111
```

## writing a post

```sh
cat > content/writing/my-post.md <<'EOF'
+++
title = "my post"
date = 2026-08-11
description = "one-line summary for meta + feed"
+++

body in markdown.
EOF
```

posts show up at `/writing/my-post/`, on the home page (latest 5), and in the atom feed at `/atom.xml`.

## deploy

cloudflare workers static assets. `wrangler deploy` runs `scripts/build.sh` (see `build.command` in `wrangler.jsonc`) and uploads `public/`. the script uses zola from PATH when available and otherwise downloads the pinned release binary into `.zola-bin/` — so it works both locally and on cloudflare workers builds, whose image doesn't ship zola.

## brand

ghostty + catppuccin terminal aesthetic. jetbrains mono everywhere. mocha (dark) is the default theme; latte (light) is reachable via the `[mocha]` toggle in the header. the choice persists in `localStorage` under `jcb-theme`.

design tokens and the source design system live separately under `jeancarlo-barrios-personal-design-system`. don't introduce a second font, gradients, box shadows, or icon libraries — see the design system readme for the full list of don'ts.

## contact

jc@ybird.xyz
