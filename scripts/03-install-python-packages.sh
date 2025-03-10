#!/usr/bin/env bash
set -eo pipefail

source ./scripts/common.sh

print_padded_title "pipx - Install Additional Software"
declare -a PIPX_PACKAGES
declare -a PIPX_HARLEQUIN_PACKAGES
PIPX_PACKAGES=("harlequin" "cqlsh" "rexi" "passhole")
PIPX_HARLEQUIN_PACKAGES=("boto3" "harlequin-postgres" "harlequin-mysql" "harlequin-odbc")
pipx install "${PIPX_PACKAGES[@]}"
for HARLEQUIN_PACKAGE in "${PIPX_HARLEQUIN_PACKAGES[@]}"; do
    pipx inject harlequin "${HARLEQUIN_PACKAGE}"
done
pipx upgrade-all --include-injected
