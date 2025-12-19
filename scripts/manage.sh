#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<USAGE
Usage: $(basename "$0") <action>

Actions:
  install    Install dependencies (npm install)
  dev        Start development server
  build      Generate static build (dist/)
  preview    Serve the build locally
  deploy     Alias for build
USAGE
}

ensure_npm() {
  command -v npm >/dev/null || { echo "npm not found"; exit 1; }
}

case "${1:-}" in
  install)
    ensure_npm
    pushd "$DIR" >/dev/null
    if [[ -f package-lock.json ]]; then npm ci; else npm install; fi
    popd >/dev/null
    ;;
  dev)
    ensure_npm
    pushd "$DIR" >/dev/null
    npm run dev
    popd >/dev/null
    ;;
  build)
    ensure_npm
    pushd "$DIR" >/dev/null
    npm run build
    popd >/dev/null
    ;;
  preview)
    ensure_npm
    pushd "$DIR" >/dev/null
    npm run preview
    popd >/dev/null
    ;;
  deploy)
    ensure_npm
    pushd "$DIR" >/dev/null
    npm run build
    popd >/dev/null
    ;;
  *) usage; exit 1 ;;
esac
