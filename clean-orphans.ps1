param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroup,

    [switch]$DryRun
)

# =========================
# CONFIG
# =========================
$logFile = "cleanup.log"

function Log {
    param([string]$message)

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp - $message"

    Write-Host $entry
    $entry | Out-File -FilePath $logFile -Append
}

# =========================
# LOGIN
# =========================
Log "🔐 Conectando a Azure..."
Connect-AzAccount -ErrorAction Stop

# =========================
# VALIDACIÓN RG
# =========================
$rgExists = Get-AzResourceGroup -Name $ResourceGroup -ErrorAction SilentlyContinue

if (-not $rgExists) {
    Log "❌ Resource Group no existe: $ResourceGroup"
    exit
}

Log "📦 Analizando recursos en: $ResourceGroup"

# =========================
# DISKS
# =========================
$disks = Get-AzDisk -ResourceGroupName $ResourceGroup | Where-Object { $_.ManagedBy -eq $null }

foreach ($disk in $disks) {
    if ($DryRun) {
        Log "🟡 [SIMULACIÓN] Disco huérfano detectado: $($disk.Name)"
    } else {
        try {
            Remove-AzDisk -ResourceGroupName $ResourceGroup -DiskName $disk.Name -Force -ErrorAction Stop
            Log "🗑️ Disco eliminado: $($disk.Name)"
        } catch {
            Log "❌ Error eliminando disco: $($disk.Name)"
        }
    }
}

# =========================
# PUBLIC IPs
# =========================
$ips = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroup | Where-Object { $_.IpConfiguration -eq $null }

foreach ($ip in $ips) {
    if ($DryRun) {
        Log "🟡 [SIMULACIÓN] IP huérfana detectada: $($ip.Name)"
    } else {
        try {
            Remove-AzPublicIpAddress -Name $ip.Name -ResourceGroupName $ResourceGroup -Force -ErrorAction Stop
            Log "🗑️ IP eliminada: $($ip.Name)"
        } catch {
            Log "❌ Error eliminando IP: $($ip.Name)"
        }
    }
}

# =========================
# NICs
# =========================
$nics = Get-AzNetworkInterface -ResourceGroupName $ResourceGroup | Where-Object { $_.VirtualMachine -eq $null }

foreach ($nic in $nics) {
    if ($DryRun) {
        Log "🟡 [SIMULACIÓN] NIC huérfana detectada: $($nic.Name)"
    } else {
        try {
            Remove-AzNetworkInterface -Name $nic.Name -ResourceGroupName $ResourceGroup -Force -ErrorAction Stop
            Log "🗑️ NIC eliminada: $($nic.Name)"
        } catch {
            Log "❌ Error eliminando NIC: $($nic.Name)"
        }
    }
}

Log "✅ Proceso completado"
