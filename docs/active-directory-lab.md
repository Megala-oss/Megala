# Active Directory Administration Lab

## 🎯 Objective

This lab demonstrates basic Active Directory administration concepts in a Windows Server test environment.

## 🖥️ Lab Components

* Windows Server Domain Controller
* Windows Client
* Active Directory Domain Services (AD DS)
* DNS
* Group Policy

## 🔧 Tasks Covered

### 1. Domain Controller

* Install AD DS role
* Promote Windows Server as Domain Controller
* Configure a test domain

### 2. Organizational Units

* Create Organizational Units
* Organize users and computers

### 3. User Management

* Create domain users
* Reset user passwords
* Enable / disable user accounts
* Manage group membership

### 4. Groups

* Create security groups
* Add and remove members
* Manage group permissions

### 5. Group Policy

* Create and link a GPO
* Configure basic security policies
* Apply policies to users and computers

### 6. DNS

* Verify DNS configuration
* Test name resolution
* Troubleshoot DNS connectivity

## 🧪 Example Commands

```powershell
Get-ADUser -Filter *
Get-ADGroup -Filter *
Get-ADComputer -Filter *
```

## 📌 Learning Outcome

This lab provides hands-on practice with common Active Directory administration and troubleshooting activities in a controlled test environment.
