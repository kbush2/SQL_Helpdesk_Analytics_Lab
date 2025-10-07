-- queries.sql — practice analytics queries

-- 1) Ticket volume by priority
SELECT priority, COUNT(*) AS cnt
FROM tickets
GROUP BY priority
ORDER BY cnt DESC;

-- 2) Average resolution time (in hours) for resolved tickets
SELECT ROUND(AVG(
  (JULIANDAY(resolved_at) - JULIANDAY(created_at)) * 24
), 2) AS avg_resolution_hours
FROM tickets
WHERE resolved_at IS NOT NULL;

-- 3) First-response SLA check:
--   For each ticket, compute time to first update and compare to SLA.
WITH first_updates AS (
  SELECT t.ticket_id,
         MIN(u.updated_at) AS first_update_at
  FROM tickets t
  LEFT JOIN ticket_updates u ON u.ticket_id = t.ticket_id
  GROUP BY t.ticket_id
),
elapsed AS (
  SELECT t.ticket_id,
         t.priority,
         (JULIANDAY(f.first_update_at) - JULIANDAY(t.created_at)) * 24 * 60 AS mins_to_first_update
  FROM tickets t
  JOIN first_updates f ON f.ticket_id = t.ticket_id
),
with_sla AS (
  SELECT e.ticket_id,
         e.priority,
         e.mins_to_first_update,
         s.first_response_mins
  FROM elapsed e
  JOIN sla_policies s ON s.priority = e.priority
)
SELECT priority,
       SUM(CASE WHEN mins_to_first_update <= first_response_mins THEN 1 ELSE 0 END) AS met_sla,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN mins_to_first_update <= first_response_mins THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 1) AS pct_met
FROM with_sla
GROUP BY priority
ORDER BY pct_met DESC;

-- 4) Agent workload: open & in-progress tickets per agent
SELECT a.full_name,
       SUM(CASE WHEN t.status IN ('Open','In Progress') THEN 1 ELSE 0 END) AS active_tickets
FROM agents a
LEFT JOIN tickets t ON t.assigned_agent_id = a.agent_id
GROUP BY a.agent_id
ORDER BY active_tickets DESC, a.full_name;

-- 5) Top customers by ticket volume
SELECT c.company_name, COUNT(*) AS tickets_raised
FROM customers c
JOIN tickets t ON t.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY tickets_raised DESC, c.company_name;

-- 6) Ticket age (in hours) for tickets not yet resolved
SELECT t.ticket_id,
       ROUND((JULIANDAY('now') - JULIANDAY(t.created_at)) * 24, 1) AS age_hours,
       t.priority,
       t.status,
       a.full_name AS assigned_agent
FROM tickets t
LEFT JOIN agents a ON a.agent_id = t.assigned_agent_id
WHERE t.resolved_at IS NULL
ORDER BY age_hours DESC;
