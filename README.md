### 🧾 README.md
```md
# Limpieza de Recursos Huérfanos en Azure

Este script elimina:

✅ Discos sin VM  
✅ IPs públicas sin NIC  
✅ NICs sin VM  

Ideal para control de costes y mantenimiento cloud.

## Uso
```powershell
Connect-AzAccount
./clean-orphans.ps1
