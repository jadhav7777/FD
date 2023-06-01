$ResourceGroupName = "Abhishek_REsource_Group"  
$location = "EastUS"  
$VMName = "Azure-VM"
$UserName = "FDAdmin"
$pwd = "FD@123azure"
$password = ConvertTo-SecureString $pwd -AsPlainText -Force
$CredVM = New-Object System.Management.Automation.PSCredential ('$UserName', $password)

New-AzVm -ResourceGroupName $ResourceGroupName -Name $VMName -Location $location -Credential $CredVM
