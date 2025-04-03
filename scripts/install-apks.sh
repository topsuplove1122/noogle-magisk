#!/bin/sh

for apk in $(ls -1 apk/*.apk); do
	adb install --user all "$apk"
done

echo -n 'Reboot?'
read
adb reboot