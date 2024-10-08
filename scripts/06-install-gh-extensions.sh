#!/usr/bin/env bash
set -eo pipefail

source ./scripts/common.sh

print_padded_title "gh - Install GitHub CLI Extensions"
if [ -f /usr/bin/gh ]; then
    gh extension install --force yusukebe/gh-markdown-preview || true
    gh extension install --force dlvhdr/gh-dash || true
fi
