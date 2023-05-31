az login --service-principal -u $ID  -p  $PASSWORD   --tenant  $TENANT
echo "!!! Current dir"
pwd
az -v