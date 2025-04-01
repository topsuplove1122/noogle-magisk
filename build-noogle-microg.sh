#!/bin/sh

apk_dir=apk

echo "[P] Building module noogle-microg..."

for apk in "com.google.android.gms" "com.android.vending" "com.google.android.gsf"; do
	if ls "$apk_dir/$apk"* 1> /dev/null 2>&1; then
		echo "[I] $apk: PRESENT"
	else
		echo "[W] $apk: MISSING"
	fi
done

apk_count=$(ls "$apk_dir/com.google.android.gms"* "$apk_dir/com.android.vending"* "$apk_dir/com.google.android.gsf"* 2>/dev/null | wc -l)
if [ "$apk_count" -lt 3 ]; then
	echo "[E] Missing one or more required APKs in $apk_dir/, use ./pull-latest-microg.sh to download them or do it manually"
	exit 1
elif [ "$apk_count" -gt 3 ]; then
	echo "[E] Too many APKs, the $apk_dir/ directory must contain exactly 3 APK files"
	exit 1
fi

echo "[P] Copying APKs to module directory..."
cp apk/com.google.android.gms* module/system/product/priv-app/GmsCoreMicroG/GmsCore.apk
cp apk/com.android.vending* module/system/product/priv-app/PhoneskyMicroG/Phonesky.apk
cp apk/com.google.android.gsf* module/system/product/priv-app/GoogleServicesFrameworkMicroG/GoogleServicesFramework.apk

module_version="$(jq -r '.version' update-microg.json)"
echo "[I] Module version: $module_version"
module_filename="noogle-microg-v$module_version.zip"

echo "[P] Compressing module archive..."
mkdir -p dist
rm -f "dist/$module_filename"
cd module
zip -q -r ../dist/$module_filename . -x **/.gitkeep
cd -

echo "[I] Module noogle-microg built successfully!"