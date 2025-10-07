# SQL Helpdesk Analytics — Local SQLite Lab

This beginner-friendly lab runs **locally** with SQLite (no server install). You’ll create a helpdesk database from CSVs, then run analytics queries for tickets, SLAs, agents, and customers.

## What’s inside
```
SQL_Helpdesk_Analytics_Lab/
├─ setup.sql              # Builds tables and imports CSVs
├─ queries.sql            # Analytics queries to run after setup
├─ data/
│  ├─ agents.csv
│  ├─ customers.csv
│  ├─ sla_policies.csv
│  ├─ tickets.csv
│  └─ ticket_updates.csv
├─ setup_lab.bat          # (Windows) One-click build
├─ run_queries.bat        # (Windows) Run queries.sql
├─ setup_lab.ps1          # (PowerShell) One-click build
└─ run_queries.ps1        # (PowerShell) Run queries.sql
```
# SQL Helpdesk Analytics — SQLite Local Lab

## 🎯 Objective
Hands-on lab demonstrating SQL analytics skills using a realistic helpdesk database.  
Focus: ticket volume, SLA compliance, agent workload, and customer insights.

## 🧰 Tools
- SQLite 3
- Windows Command Prompt
- CSV datasets (imported locally)

## 🧩 Database Overview
Tables:
- `agents` – helpdesk agents and teams
- `customers` – client information
- `sla_policies` – SLA response targets
- `tickets` – main incident records
- `ticket_updates` – activity logs

## 🧮 Queries Run
1. Ticket volume by priority  
2. Average resolution time  
3. SLA compliance by priority  
4. Agent workload  
5. Top customers by volume  
6. Open ticket age analysis

## 🧾 Evidence

---

# 📸 Project Evidence & Results

## Objective
Hands-on lab demonstrating SQL analytics skills using a realistic helpdesk database.

## Evidence
| Step | Description | Screenshot |
|------|--------------|-------------|
| 1 | Database created successfully | ![Setup Tables](media/01_Setup_Tables.png) |
| 2 | Ticket volume by priority | ![Ticket Volume](media/03_Ticket_Volume.png) |
| 3 | SLA compliance analysis | ![SLA Compliance](media/05_SLA_Compliance.png) |

## Takeaways
- Practiced SQL joins and aggregates
- Built SLA metrics using CTEs
- Created realistic helpdesk analytics

---

**Created by:** Kamal Bush  
[GitHub Profile](https://github.com/kbush2)  
[LinkedIn Profile](https://www.linkedin.com/in/kamal-bush/)

