az vm run-command invoke -g $resourcegroup -n $vmname --command-id RunPowerShellScript --scripts "Install-WindowsFeature -name Web-Server -IncludeManagementTools"
az vm open-port --port 80 --resource-group $resourcegroup --name $vmname