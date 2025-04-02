perms="ACCESS_COARSE_LOCATION ACCESS_FINE_LOCATION ACCESS_BACKGROUND_LOCATION READ_EXTERNAL_STORAGE WRITE_EXTERNAL_STORAGE GET_ACCOUNTS POST_NOTIFICATIONS READ_PHONE_STATE RECEIVE_SMS SYSTEM_ALERT_WINDOW"

echo "[P] Checking microG Services permissions..."
echo "-------------------------------------------"
echo "PERMISSION                           STATUS"
echo "-------------------------------------------"

warn=""

for perm in $perms; do
	if dumpsys package com.google.android.gms | grep -q "android.permission.$perm: granted=true"; then
		printf "%-35s %s\n" "[I] $perm" "GRANTED"
	else
		printf "%-31s %s\n" "[W] $perm" "NOT GRANTED"
		echo "|-[P] Granting..."
		pm grant com.google.android.gms "android.permission.$perm"
		if [ $? -eq 0 ]; then
			printf "|-%-33s %s\n" "[I] $perm" "GRANTED"
		else
			printf "|-%-29s %s\n" "[E] $perm" "NOT GRANTED"
			echo "|-[E] Cannot grant, do it from microG app."
			warn="1"
		fi
	fi
done

echo "-------------------------------------------"
echo "[P] Checking microG Services permissions done."
echo

if [ "$warn" ]; then
	echo "[W] Some permissions were not granted."
	echo "[W] You can grant them from the microG app."
else
	echo "[I] All permissions granted!"
fi