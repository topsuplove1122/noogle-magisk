#!/bin/sh

module_version="$(grep '^version=' src/module-microg/module.prop | cut -d'=' -f2)"

skip_confirmations=false
if [ "$1" = "-y" ]; then
    skip_confirmations=true
fi

./build-noogle-microg.sh # -s '' -d system
if [ "$skip_confirmations" = false ]; then
    echo -n 'Install?'
    read
fi
adb push dist/noogle-microg-v$module_version.zip /sdcard/
adb shell su -c "magisk --install-module /sdcard/noogle-microg-v$module_version.zip"
if [ "$skip_confirmations" = false ]; then
    echo -n 'Reboot?'
    read
fi
adb reboot