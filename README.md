# 🧹 Azure Orphan Resources Cleaner (PowerShell)

## 🧠 Overview

This project automates the detection and cleanup of orphaned resources in Microsoft Azure, helping reduce unnecessary costs and improve cloud governance.

It is designed with a practical **FinOps mindset**, simulating real-world operational tasks in cloud environments.

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

Without proper visibility or automation, these resources are often overlooked.

---

## 🏗️ Solution

This project provides a PowerShell script that:

* Identifies orphaned resources within a Resource Group
* Supports a safe execution mode (**DryRun**) to prevent accidental deletions
* Removes unused resources in a controlled way
* Logs all actions for traceability and auditing

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

## 🔐 Security & Safety

* **DryRun mode is strongly recommended before execution**
* No destructive actions without explicit user intent
* Requires appropriate Azure RBAC permissions
* Designed to minimize risk in production environments

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
