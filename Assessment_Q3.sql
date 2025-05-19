Q3: List savings and investment accounts with no inflows in over a year

SELECT 
  s.id AS plan_id,
  s.owner_id,
  'Savings' AS type,
  MAX(s.transaction_date) AS last_transaction_date,
  DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM savings_savingsaccount s
GROUP BY s.id, s.owner_id
HAVING inactivit
