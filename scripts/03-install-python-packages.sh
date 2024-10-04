#!/usr/bin/env bash
set -eo pipefail

source ./scripts/common.sh

print_padded_title "Brew pipx - Install Additional Software"
declare -a PIPX_PACKAGES
declare -a PIPX_HARLEQUIN_PACKAGES
PIPX_PACKAGES=("harlequin" "cqlsh" "rexi")
PIPX_HARLEQUIN_PACKAGES=("catppuccin[pygments]" "boto3" "harlequin-postgres" "harlequin-mysql" "harlequin-odbc" "harlequin-cassandra" "git+https://github.com/ThomAub/harlequin-clickhouse")
pipx install "${PIPX_PACKAGES[@]}"
for HARLEQUIN_PACKAGE in "${PIPX_HARLEQUIN_PACKAGES[@]}"; do
    pipx inject harlequin "${HARLEQUIN_PACKAGE}"
done
pipx upgrade-all --include-injected
