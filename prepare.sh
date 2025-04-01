#!/bin/sh

# NOTE: This script is creating .replace files for removing GApps.
# Next release of Magisk will support removing files using REMOVE variable,
# so this script will not be needed anymore.

source module/customize.sh

echo "[P] Removing old .replace files..."
find module -name ".replace" -type f -exec rm -f {} +
echo "[P] Done removing old .replace files."

echo "[P] Creating .replace (for removing files)..."
for dir in $REMOVE; do
	mkdir -p "module$dir"
	touch "module$dir/.replace"
	echo "[I] Created for: module$dir"
done
echo "[P] Done creating .replace files."