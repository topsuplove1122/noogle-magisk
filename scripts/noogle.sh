#!/bin/sh

module_version="$(grep '^version=' src/module-microg/module.prop | cut -d'=' -f2)"

./build-noogle-microg.sh # -s '' -d system
echo -n 'Install?'
read
adb push dist/noogle-microg-v$module_version.zip /sdcard/
adb shell su -c "magisk --install-module /sdcard/noogle-microg-v$module_version.zip"
echo -n 'Reboot?'
read
adb reboot