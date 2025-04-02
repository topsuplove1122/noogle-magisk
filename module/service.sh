# Wait for system to be ready
resetprop -w sys.boot_completed 0

# Reinstall microG APKs as user updates for various compatibility reasons
pm install -r /system/product/priv-app/GmsCoreMicroG/GmsCore.apk
pm install -r /system/product/priv-app/PhoneskyMicroG/Phonesky.apk

# Grant permissions to microG Services
perms="ACCESS_COARSE_LOCATION ACCESS_FINE_LOCATION ACCESS_BACKGROUND_LOCATION READ_EXTERNAL_STORAGE WRITE_EXTERNAL_STORAGE GET_ACCOUNTS POST_NOTIFICATIONS READ_PHONE_STATE RECEIVE_SMS SYSTEM_ALERT_WINDOW"
for perm in $perms; do
	pm grant com.google.android.gms "android.permission.$perm"
done