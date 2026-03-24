# Limpieza de recursos huérfanos en Azure
# Discos sin VM, IPs sin NIC, NICs sin VM

Connect-AzAccount

$rg = "RG-Demo"

# Discos huérfanos
$disks = Get-AzDisk -ResourceGroupName $rg | Where-Object { $_.ManagedBy -eq $null }
foreach ($disk in $disks) {
    Write-Host "Eliminando disco huérfano: $($disk.Name)"
    Remove-AzDisk -ResourceGroupName $rg -DiskName $disk.Name -Force
}

# IPs públicas huérfanas
$ips = Get-AzPublicIpAddress -ResourceGroupName $rg | Where-Object { $_.IpConfiguration -eq $null }
foreach ($ip in $ips) {
    Write-Host "Eliminando IP huérfana: $($ip.Name)"
    Remove-AzPublicIpAddress -Name $ip.Name -ResourceGroupName $rg -Force
}

# NICs huérfanas
$nics = Get-AzNetworkInterface -ResourceGroupName $rg | Where-Object { $_.VirtualMachine -eq $null }
foreach ($nic in $nics) {
    Write-Host "Eliminando NIC huérfana: $($nic.Name)"
    Remove-AzNetworkInterface -Name $nic.Name -ResourceGroupName $rg -Force
}
