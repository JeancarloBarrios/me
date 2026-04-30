# jeancarlo.info

personal site & blog of jeancarlo barrios. single-page static html/css/js.

## files

```
index.html             — the page
colors_and_type.css    — design tokens (catppuccin + jetbrains mono)
assets/favicon.svg     — the jcb❯ tab mark
```

## run locally

open `index.html` directly in a browser, or serve the directory:

```sh
python3 -m http.server 8765
# then open http://localhost:8765
```

## deploy

flat static. drop the repo into any static host — github pages, vercel, netlify, cloudflare pages — and point at the root. no build step.

## brand

ghostty + catppuccin terminal aesthetic. jetbrains mono everywhere. mocha (dark) is the default theme; latte (light) is reachable via the `[mocha]` toggle in the header. the choice persists in `localStorage` under `jcb-theme`.

design tokens and the source design system live separately under `jeancarlo-barrios-personal-design-system`. don't introduce a second font, gradients, box shadows, or icon libraries — see the design system readme for the full list of don'ts.

## contact

jc@ybird.xyz
