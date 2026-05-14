CREATE TABLE credit_card_transcation(
  idx INTEGER,
  city VARCHAR(100),
  transcation_date DATE,
  card_type VARCHAR(100),
  exp_type VARCHAR(50),
  amount NUMERIC(12,2),
  gender VARCHAR(5)
);
DROP TABLE credit_card_transcation;

CREATE TABLE credit_card_transcation (
    city VARCHAR(50),
    date DATE,
    index INTEGER,
    card_type VARCHAR(30),
    exp_type VARCHAR(30),
    gender VARCHAR(5),
    amount NUMERIC(12,2)
);
SELECT
   COUNT(*) AS total_rows,
    COUNT(DISTINCT city) AS total_cities,
    COUNT(DISTINCT card_type) AS card_types,
    COUNT(DISTINCT exp_type) AS expense_categories,
    MIN(date) AS start_date,
    MAX(date) AS end_date
FROM credit_card_transcation;

2-Total Spend by City:
SELECT 
    city,
    ROUND(SUM(amount)::numeric, 2) AS total_spend,
    COUNT(*) AS total_transactions,
    ROUND(AVG(amount)::numeric, 2) AS avg_spend
FROM credit_card_transcation
GROUP BY city
ORDER BY total_spend DESC
LIMIT 10;

3-Spend by Expense Category:

SELECT exp_type, ROUND(SUM(amount)::numeric,2)AS total_spend,
COUNT(*)AS total_transcation,
    ROUND(AVG(amount)::numeric, 2) AS avg_spend
FROM credit_card_transcation
GROUP BY exp_type
ORDER BY total_spend DESC;

4-Spend by Card type:

SELECT card_type, ROUND(SUM(amount)::numeric,2)AS total_spend,
COUNT(*)AS total_transcation,
ROUND(AVG(amount)::numeric,2)AS avg_spend
FROM credit_card_transcation
GROUP BY card_type
ORDER BY total_spend DESC;

5-Gender Wise spend:
SELECT
gender, ROUND(SUM(amount)::numeric,2)AS total_spend,
    COUNT(*) AS total_transactions,
    ROUND(AVG(amount)::numeric, 2) AS avg_spend
FROM credit_card_transcation
GROUP BY gender
ORDER BY total_spend DESC;

6-Monthly Spend Trend:
SELECT 
TO_CHAR(date, 'YYYY-MM')AS mONTH,
   ROUND(SUM(amount)::numeric, 2) AS total_spend,
    COUNT(*) AS total_transactions
FROM credit_card_transcation
GROUP BY TO_CHAR(date, 'YYYY-MM')
ORDER BY month ;