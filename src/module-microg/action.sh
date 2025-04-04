source ./common.sh

echo "[P] Module self-check..."

echo
echo "[W] microG APKs will be restored to original versions."

echo
remove_package_updates google

echo
echo
grant_microg_permissions

echo
echo
echo "[I] Done fixing module."