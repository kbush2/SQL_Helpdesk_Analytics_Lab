# SQL Helpdesk Analytics — Local SQLite Lab

This beginner-friendly lab runs **locally** with SQLite (no server install). You’ll create a helpdesk database from CSVs, then run analytics queries for tickets, SLAs, agents, and customers.

## What’s inside
```
SQL_Helpdesk_Analytics_Lab/
├─ data/
├─ media/
│  ├─ 01_Setup_CMD_Path.png
│  ├─ 01_Setup_Import.png
│  ├─ 01_Setup_Tables.png
│  ├─ 01_Setup_Schema.png
│  ├─ 02_Data_Agents.png
│  ├─ 02_Ticket_Count.png
│  ├─ 03_Ticket_Volume.png
│  ├─ 04_Resolution_Time.png
│  ├─ 05_SLA_Compliance.png
│  ├─ 06_Agent_Workload.png
│  ├─ 07_Top_Customers.png
│  ├─ 08_Ticket_Age.png
│  ├─ 09_Lab_Structure.png
│  └─ 10_Helpdesk_DB.png
├─ setup.sql
├─ queries.sql
├─ README.md
└─ helpdesk.db

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

