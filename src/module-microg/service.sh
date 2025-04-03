log_path=/data/adb/noogle-microg.log
echo "[I] Starting noogle-microg boot script." > "$log_path"

# Wait for system to be ready
resetprop -w sys.boot_completed 0

MODDIR=${0%/*}
source "$MODDIR/common.sh"

# Ensure Google updates are not installed
remove_package_updates google >> "$log_path" 2>&1

# Doesn't work for some reason, needs manual interaction
# grant_microg_permissions >> "$log_path" 2>&1

echo "[I] Finished noogle-microg boot script." >> "$log_path" 2>&1