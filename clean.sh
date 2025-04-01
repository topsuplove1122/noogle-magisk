#!/bin/sh

# NOTE: This script is creating .replace files for removing GApps.
# Next release of Magisk will support removing files using REMOVE variable,
# so this script will not be needed anymore.

echo "[P] Removing old .replace files..."
find module -name ".replace" -type f -exec rm -f {} +
echo "[P] Done removing old .replace files."