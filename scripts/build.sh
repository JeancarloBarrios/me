#!/usr/bin/env sh
# builds the site with zola. if zola isn't on PATH (cloudflare workers
# builds' image doesn't ship it), fetch the pinned release binary first.
set -eu

ZOLA_VERSION="0.23.2"

if command -v zola >/dev/null 2>&1; then
  ZOLA="zola"
else
  ZOLA=".zola-bin/zola"
  if [ ! -x "$ZOLA" ]; then
    mkdir -p .zola-bin
    case "$(uname -s)-$(uname -m)" in
      Linux-x86_64)  TARGET="x86_64-unknown-linux-gnu" ;;
      Linux-aarch64) TARGET="aarch64-unknown-linux-gnu" ;;
      Darwin-arm64)  TARGET="aarch64-apple-darwin" ;;
      Darwin-x86_64) TARGET="x86_64-apple-darwin" ;;
      *) echo "unsupported platform: $(uname -s)-$(uname -m)" >&2; exit 1 ;;
    esac
    URL="https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-${TARGET}.tar.gz"
    echo "fetching zola v${ZOLA_VERSION} (${TARGET})..."
    curl -fsSL "$URL" | tar xz -C .zola-bin
  fi
fi

"$ZOLA" --version
"$ZOLA" build
