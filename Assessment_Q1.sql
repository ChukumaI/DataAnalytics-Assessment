Q1: Customers with both savings and investment plans
Show their total savings deposit and count of each product

SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(IFNULL(s.confirmed_amount, 0)) / 100, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON u.id = p.owner_id
GROUP BY u.id, u.name
ORDER BY total_deposits DESC;
