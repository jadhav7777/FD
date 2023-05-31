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