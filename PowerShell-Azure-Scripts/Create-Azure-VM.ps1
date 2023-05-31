$ClientId = "1c6c4064-0ec1-439e-8f08-5f82e845f0e8"
$ClientSecret = "DYA8Q~cuVA4O1Wyxa7762UAZWE5TZSx3bzulubeD"
$SubscriptionId = "01bc8c42-614c-4d8c-a7c2-608d22e8407b"
$TenantId = "62968c10-0ab4-4eb8-9ba0-df1240a626eb"
$creds = [System.Management.Automation.PSCredential]::new($ClientId, (ConvertTo-SecureString $ClientSecret -AsPlainText -Force))
$ResourceGroupName = "Abhishek_REsource_Group"  
$location = "EastUS"  
$VMName = "Nginx-VM"
$ImageName = "acr0510.azurecr.io/abhishekjadhav/test_acr:latest"

Connect-AzAccount -Tenant $TenantId -Subscription $SubscriptionId -Credential $creds -ServicePrincipal | Out-Null
Write-Information "Connected to Azure..."

$password = ConvertTo-SecureString "FD@123azure" -AsPlainText -Force
$CredVM = New-Object System.Management.Automation.PSCredential ("abhishek", $password)

New-AzVm -ResourceGroupName $ResourceGroupName -Name $VMName -Location $location -Credential $CredVM

Disconnect-AzAccount