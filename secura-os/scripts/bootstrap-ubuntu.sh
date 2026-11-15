#!/usr/bin/env bash
set -euo pipefail
if [[ "$(id -u)" -eq 0 ]]; then
  echo "Run as a normal user with sudo privileges." >&2
  exit 1
fi
sudo apt-get update
sudo apt-get install -y git git-lfs curl ca-certificates python3 unzip zip rsync   build-essential bc bison flex gperf libssl-dev libxml2-utils xsltproc   zlib1g-dev libncurses-dev liblz4-tool libelf-dev libcap-dev   libncurses5-dev lib32z1-dev lib32ncurses-dev libc6-dev-i386   openjdk-17-jdk repo
git lfs install
echo "Dependencies installed. Next: bash secura-os/scripts/sync-and-build.sh"
