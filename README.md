# DataAnalytics-Assessment
Cowrywise Assessment

This project contains solutions to an SQL proficiency assessment using a relational database with customer, savings, and investment data.


Question Breakdown

Q1: High-Value Customers
Identifies customers who have both savings and investment products. I used joins to find users with both and calculated total deposits in naira.

Q2: Transaction Frequency
Grouped users into frequency categories (High, Medium, Low) based on their average monthly transactions. The result helps segment customer activity levels.

Q3: Inactivity Alert
Flagged accounts (savings and investments) with no inflows in the last 365 days. Used latest transaction dates and calculated inactivity days.

Q4: CLV Estimation
Estimated customer lifetime value using tenure in months, number of transactions, and average profit per transaction (0.1%). Combined historical activity and account age to project CLV.


Challenges Faced

Some expected fields (like is_a_fund and is_regular_savings) were missing, so I adjusted the queries accordingly.

I faced server disconnection issues during query runs; resolved by limiting result sets and optimizing joins.

I reviewed table structures manually to avoid referencing non-existent columns.


Notes

All monetary values were originally in kobo and converted to naira by dividing by 100.

Queries were written in MySQL and kept clean and readable.
