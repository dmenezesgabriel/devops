#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-/workspace}"

find "$ROOT" -type d -name ".terraform" -prune -exec rm -rf {} +
find "$ROOT" -type f \( -name "terraform.tfstate" -o -name "terraform.tfstate.backup" \) -delete
