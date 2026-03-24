# ✅ **6. azure-clean-orphans — README.md**

```md
# 🧹 Azure Orphan Resources Cleaner (PowerShell)

Este script detecta y elimina recursos huérfanos que generan costes innecesarios:

✅ Discos sin VM  
✅ NICs sin VM  
✅ IPs públicas sin NIC  

## ✅ ¿Por qué es útil?

Los recursos huérfanos son uno de los mayores culpables de costes ocultos en Azure.
Este script ayuda a mantener entornos limpios y económicos.

## ▶️ Uso

```powershell
Connect-AzAccount
./clean-orphans.ps1
