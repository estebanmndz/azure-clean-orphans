# 🧹 Azure Orphan Resources Cleaner (PowerShell)

![Azure](https://img.shields.io/badge/Azure-Cloud-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-blue)
![FinOps](https://img.shields.io/badge/FinOps-Cost%20Optimization-green)

> 💡 Reduce Azure costs by detecting and cleaning orphaned resources within a Resource Group

---

## 🧠 Overview

This project automates the detection and cleanup of orphaned resources in **Microsoft Azure Resource Groups**, helping reduce unnecessary costs and improve cloud governance.

It is designed with a practical **FinOps mindset**, simulating real-world operational tasks performed by Cloud/DevOps engineers.

**Technologies used:**

* Azure PowerShell (Az Module)
* PowerShell scripting
* Azure Resource Manager

---

## 💸 Problem Statement

In Azure environments, it is common that after deleting primary resources (such as Virtual Machines), associated resources remain and continue generating costs.

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

* Authenticates against Azure
* Scans a specific Resource Group
* Detects orphaned resources
* Supports a safe execution mode (**DryRun**)
* Deletes unused resources in a controlled manner
* Logs all actions for traceability

---

## 🔄 Execution Flow

```
[Azure Login]
        ↓
[Select Resource Group]
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

1. Authenticates against Azure using `Connect-AzAccount`
2. Validates the existence of the target Resource Group
3. Retrieves resources using Azure PowerShell (Az module)
4. Applies filtering logic to detect orphaned resources
5. Executes conditional logic (DryRun vs actual deletion)
6. Logs all actions and errors

---

## 🔐 Security & Safety

* **DryRun mode is strongly recommended before execution**
* Uses interactive authentication via `Connect-AzAccount`
* Requires appropriate Azure RBAC permissions
* Designed to minimize risk in production environments
* Can be extended to use **Managed Identity** or **Service Principal** for automation

---

## 🌍 Real-World Use Case

This script can be used by cloud teams to:

* Perform periodic cleanups in non-production environments
* Reduce unnecessary Azure costs
* Support FinOps strategies
* Maintain clean and controlled Resource Groups
* Serve as a base for automation (Azure Automation / Runbooks)

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
🗑️ IP deleted: ip-demo
🗑️ NIC deleted: nic-demo

✅ Process completed
```

A log file (`cleanup.log`) is also generated with full execution details.

---

## 🚀 Future Improvements

* Subscription-wide cleanup (multi-Resource Group)
* Authentication via Managed Identity / Service Principal
* Integration with Azure Automation (Runbooks)
* Scheduled execution (automation)
* Alerts before deletion
* Integration with Azure Monitor / Log Analytics

---

## 📌 Key Takeaways

This project demonstrates:

* Automation of operational tasks in Azure
* Cost optimization practices (**FinOps**)
* Safe scripting principles (logging, validation, error handling)
* Real-world cloud engineering mindset

---
