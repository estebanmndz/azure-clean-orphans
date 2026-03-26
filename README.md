# 🧹 Azure Orphan Resources Cleaner (PowerShell)

![Azure](https://img.shields.io/badge/Azure-Cloud-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Scripting-blue)
![FinOps](https://img.shields.io/badge/FinOps-Cost%20Optimization-green)

> 💡 Reduce Azure costs by automatically detecting and cleaning orphaned resources in seconds

---

## 🧠 Overview

This project automates the detection and cleanup of orphaned resources in Microsoft Azure, helping reduce unnecessary costs and improve cloud governance.

It is designed with a practical **FinOps mindset**, simulating real-world operational tasks performed by Cloud/DevOps engineers.

**Technologies used:**

* Azure PowerShell (Az Module)
* PowerShell scripting
* Azure Resource Manager

---

## 💸 Problem Statement

In real Azure environments, it is common that after deleting primary resources (such as Virtual Machines), associated resources remain and continue generating costs.

Typical orphaned resources include:

* Managed disks not attached to any VM
* Network interfaces (NICs) without association
* Unassigned public IP addresses

Without automation, these resources are often overlooked, leading to unnecessary cloud spending.

---

## 🎯 Why This Matters

Orphaned resources represent a hidden cost in cloud environments.

Automating their cleanup:

* Improves cost efficiency (**FinOps**)
* Reduces manual operational workload
* Enhances governance and resource hygiene

---

## 🏗️ Solution

This project provides a PowerShell script that:

* Identifies orphaned resources within a Resource Group
* Supports a safe execution mode (**DryRun**)
* Deletes unused resources in a controlled manner
* Logs all actions for traceability and auditing

---

## 🔄 Execution Flow

```
[Azure Resource Group]
        ↓
[Script Execution]
        ↓
[Discover Resources]
        ↓
[Filter Orphans]
        ↓
[DryRun] OR [Delete]
        ↓
[Log Results]
```

---

## 🔍 Managed Resources

The script currently handles:

* **Managed Disks** → `ManagedBy = null`
* **Network Interfaces (NICs)** → not attached to any VM
* **Public IPs** → not associated with any configuration

---

## ⚙️ Technical Highlights

* Parameterized script for reusability
* Safe execution mode (**DryRun**)
* Persistent logging (`cleanup.log`)
* Error handling using `try/catch`
* Resource Group validation
* Built using the official **Az module**

---

## 🧩 How It Works

The script performs the following steps:

1. Authenticates against Azure
2. Retrieves resources using Azure PowerShell (Az module)
3. Applies filtering logic to detect orphaned resources
4. Executes conditional logic (DryRun vs actual deletion)
5. Logs all actions and errors

---

## 🔐 Security & Safety

* **DryRun mode is strongly recommended before execution**
* No destructive actions without explicit user intent
* Requires appropriate Azure RBAC permissions
* Designed to minimize risk in production environments

---

## 🌍 Real-World Use Case

This script can be used by cloud teams to:

* Perform periodic cleanups in non-production environments
* Integrate into automation workflows (Azure Automation / Runbooks)
* Support FinOps strategies for cost optimization
* Maintain clean and controlled Azure environments

---

## ▶️ Usage

```powershell
Connect-AzAccount

# Simulation mode (recommended)
.\clean-orphans.ps1 -ResourceGroup "RG-Demo" -DryRun

# Real execution
.\clean-orphans.ps1 -ResourceGroup "RG-Demo"
```

---

## 📊 Example Output

```
🟡 [SIMULATION] Orphan disk detected: disk01
🗑️ Public IP deleted: ip-demo
🗑️ NIC deleted: nic-demo

✅ Process completed
```

A log file (`cleanup.log`) is also generated with full execution details.

---

## 🚀 Future Improvements

* Integration with Azure Automation (Runbooks)
* Scheduled execution (automation)
* Pre-deletion alerting system
* Integration with Azure Monitor / Log Analytics
* Multi-Resource Group / Subscription support

---

## 📌 Key Takeaways

This project demonstrates:

* Automation of operational tasks in Azure
* Cost optimization practices (**FinOps**)
* Safe scripting principles (logging, validation, error handling)
* Real-world cloud engineering mindset

---
