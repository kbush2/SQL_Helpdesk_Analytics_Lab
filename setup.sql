-- setup.sql — build the Helpdesk lab database and import CSVs
-- Run with: sqlite3 helpdesk.db ".read setup.sql"

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS ticket_updates;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS sla_policies;
DROP TABLE IF EXISTS agents;
DROP TABLE IF EXISTS customers;

CREATE TABLE agents (
  agent_id INTEGER PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  team TEXT,
  hire_date DATE,
  is_active INTEGER DEFAULT 1 CHECK(is_active IN (0,1))
);

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  company_name TEXT NOT NULL,
  contact_name TEXT,
  contact_email TEXT,
  industry TEXT,
  tier TEXT CHECK(tier IN ('Platinum','Gold','Silver','Bronze'))
);

CREATE TABLE sla_policies (
  sla_id INTEGER PRIMARY KEY,
  sla_name TEXT NOT NULL,
  priority TEXT CHECK(priority IN ('Critical','High','Medium','Low')),
  first_response_mins INTEGER NOT NULL,
  resolve_mins INTEGER NOT NULL,
  business_hours INTEGER NOT NULL CHECK(business_hours IN (0,1))
);

CREATE TABLE tickets (
  ticket_id INTEGER PRIMARY KEY,
  created_at TEXT NOT NULL,
  resolved_at TEXT,
  priority TEXT CHECK(priority IN ('Critical','High','Medium','Low')),
  status TEXT CHECK(status IN ('Open','In Progress','Resolved','Closed')),
  subject TEXT,
  customer_id INTEGER REFERENCES customers(customer_id),
  assigned_agent_id INTEGER REFERENCES agents(agent_id)
);

CREATE TABLE ticket_updates (
  update_id INTEGER PRIMARY KEY,
  ticket_id INTEGER NOT NULL REFERENCES tickets(ticket_id),
  updated_at TEXT NOT NULL,
  update_type TEXT CHECK(update_type IN ('Public','Private')),
  notes TEXT,
  agent_id INTEGER REFERENCES agents(agent_id)
);

.mode csv
.import data/agents.csv agents
.import data/customers.csv customers
.import data/sla_policies.csv sla_policies
.import data/tickets.csv tickets
.import data/ticket_updates.csv ticket_updates

-- Quick sanity checks
.headers on
.width 6 24 18 12 12 8
SELECT * FROM agents LIMIT 5;
SELECT COUNT(*) AS tickets_loaded FROM tickets;
SELECT COUNT(*) AS updates_loaded FROM ticket_updates;
