#!/bin/sh

echo "[P] Building module noogle-microg..."

if [ ! -f apk/GmsCore.apk ] || [ ! -f apk/Phonesky.apk ]; then
	echo "[W] microG APKs not found, pulling latest..."
	./pull-latest-microg.sh
	if [ $? -ne 0 ]; then
		exit 1
	fi
fi

cp apk/GmsCore.apk module/system/product/priv-app/GmsCoreMicroG/GmsCore.apk
cp apk/Phonesky.apk module/system/product/priv-app/PhoneskyMicroG/Phonesky.apk

echo "[P] Compressing module archive..."
mkdir -p dist
rm -f dist/noogle-microg.zip
cd module
zip -q -r ../dist/noogle-microg.zip . -x **/.gitkeep
cd -

echo "[I] Module noogle-microg built successfully!"