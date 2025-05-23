Q4: Estimate CLV per customer using transaction history and tenure

SELECT 
  u.id AS customer_id,
  u.name,
  TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
  COUNT(s.id) AS total_transactions,
  ROUND((
    (COUNT(s.id) / NULLIF(TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()), 0)) * 12 *
    (0.001 * AVG(s.confirmed_amount / 100))
  ), 2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
GROUP BY u.id, u.name
ORDER BY estimated_clv DESC;
