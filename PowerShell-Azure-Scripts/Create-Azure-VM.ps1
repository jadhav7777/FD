Write-Host $Pwd
Write-Host $UserName
Write-Host $ResourceGroupName
$password = ConvertTo-SecureString $Pwd -AsPlainText -Force
$CredVM = New-Object System.Management.Automation.PSCredential ('$UserName', $password)

New-AzVm -ResourceGroupName $ResourceGroupName -Name $VMName -Location $location -Credential $CredVM

Disconnect-AzAccount