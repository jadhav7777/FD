$password = ConvertTo-SecureString $Pwd -AsPlainText -Force
$CredVM = New-Object System.Management.Automation.PSCredential ($UserName, $password)

New-AzVm -ResourceGroupName $ResourceGroupName -Name $VMName -Location $location -Credential $CredVM

Disconnect-AzAccount