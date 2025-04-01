#!/bin/sh

echo "[P] Pulling latest microG APKs..."

repo_url=https://microg.org/fdroid/repo

rm -rf apk
mkdir apk

repo_index=$(curl -s $repo_url/index-v2.json)

latest_gms=$(echo "$repo_index" | jq -r '.packages["com.google.android.gms"].versions | to_entries | sort_by(.value.added) | last.value.file.name')

echo "[I] Latest GmsCore version: $latest_gms"

latest_vending=$(echo "$repo_index" | jq -r '.packages["com.android.vending"].versions | to_entries | sort_by(.value.added) | last.value.file.name')

echo "[I] Latest Phonesky version: $latest_vending"

curl -Ls $repo_url/$latest_gms -o apk/GmsCore.apk
curl -Ls $repo_url/$latest_vending -o apk/Phonesky.apk

if [ $? -ne 0 ]; then
	echo "[E] Failed to pull latest microG APKs"
	exit 1
fi
echo "[I] Pulled latest microG APKs"