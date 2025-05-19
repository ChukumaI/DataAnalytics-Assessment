Q2: Categorize customers by how frequently they transact per month

SELECT
  CASE
    WHEN avg_monthly_txns >= 10 THEN 'High Frequency'
    WHEN avg_monthly_txns BETWEEN 3 AND 9 THEN 'Medium Frequency'
    ELSE 'Low Frequency'
  END AS frequency_category,
  COUNT(*) AS customer_count,
  ROUND(AVG(avg_monthly_txns), 1) AS avg_transactions_per_month
FROM (
  SELECT 
    owner_id,
    COUNT(*) AS total_txns,
    TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1 AS active_months,
    COUNT(*) / (TIMESTAMPDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1) AS avg_monthly_txns
  FROM savings_savingsaccount
  GROUP BY owner_id
) AS customer_txn_stats
GROUP BY frequency_category
ORDER BY FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');

