# 🧹 Azure Orphan Resources Cleaner (PowerShell)

## 🧠 Descripción

Este proyecto automatiza la detección y limpieza de recursos huérfanos en Azure, ayudando a reducir costes innecesarios y mejorar la gobernanza de entornos cloud.

Está enfocado en prácticas de **FinOps** y mantenimiento de infraestructura en entornos reales.

---

## 💸 Problema que resuelve

En Azure es habitual que, tras eliminar máquinas virtuales u otros recursos, queden elementos sin uso que siguen generando costes:

* Discos gestionados sin asociar
* Interfaces de red sin uso
* IPs públicas no asignadas

Este script detecta y elimina automáticamente estos recursos.

---

## 🔍 Recursos gestionados

* Discos sin VM (`ManagedBy = null`)
* NICs sin VM asociada
* IPs públicas sin configuración

---

## ⚙️ Características técnicas

* Script parametrizado
* Modo simulación (**DryRun**) sin eliminación real
* Logging detallado en fichero
* Manejo de errores con `try/catch`
* Validación de Resource Group
* Uso de Azure PowerShell (Az module)

---

## ▶️ Uso

```powershell
Connect-AzAccount

# Simulación (recomendado)
.\clean-orphans.ps1 -ResourceGroup "RG-Demo" -DryRun

# Ejecución real
.\clean-orphans.ps1 -ResourceGroup "RG-Demo"
```

---

## 📊 Output

```
🟡 [SIMULACIÓN] Disco huérfano detectado: disk01
🗑️ IP eliminada: ip-demo
🗑️ NIC eliminada: nic-demo

✅ Proceso completado
```

Además, se genera un fichero de log (`cleanup.log`) con el detalle de ejecución.

---

## ⚠️ Consideraciones

* Ejecutar primero en modo **DryRun**
* Requiere permisos adecuados en Azure
* Uso recomendado en entornos controlados o con validación previa

---

## 🚀 Mejoras futuras

* Integración con Azure Automation (Runbooks)
* Programación automática (tareas recurrentes)
* Alertas previas a eliminación
* Integración con Azure Monitor / Log Analytics
* Soporte multi-Resource Group
