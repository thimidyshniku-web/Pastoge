#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck disable=SC1091
source "$ROOT/config/aosp.env"
WORKSPACE="${SECURA_WORKSPACE:-$HOME/secura-build}"
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"
mkdir -p "$AOSP_DIR"
cd "$AOSP_DIR"
if [[ ! -d .repo ]]; then
  repo init -u "$AOSP_MANIFEST_URL" -b "$AOSP_TAG"
fi
repo sync -c -j "${SYNC_JOBS:-8}" --fail-fast
source build/envsetup.sh
# Validate the lunch target against the selected tag before a long build.
if ! lunch "$AOSP_LUNCH"; then
  echo "Lunch target unavailable for $AOSP_TAG. Consult the official AOSP release-specific target list." >&2
  exit 1
fi
m -j "$BUILD_JOBS"
echo "Build completed. Output: $PWD/out/target/product/"
