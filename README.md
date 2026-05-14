# 💳 Credit Card Spend Analysis — India (2013-2015)

### Analyzing ₹407Cr worth of transactions across 986 Indian cities

---

## 📌 Problem Statement
A financial services company wants to understand credit card spending 
patterns across Indian cities — to identify high-value markets, popular 
expense categories, and gender-based spending behavior for targeted 
product offerings.

---

## 🎯 Key Business Insights

- 🏙️ **Mumbai leads** with ₹577M spend — followed closely by Bengaluru 
  (₹572M) and Ahmedabad (₹568M)
- 🧾 **Bills is #1 category** — ₹907M total, highest avg transaction of ₹1.79L
- 👩 **Female customers spend more** — ₹2,205M (54%) vs Male ₹1,870M (46%)
- 💳 **Silver card dominates** — ₹1,070M across 6,840 transactions
- 📈 **2014 was peak year** — highest spend at ₹544M in single months
- ✈️ **Travel is untapped** — only ₹109M vs Bills ₹907M — huge growth opportunity
- 🏙️ **Delhi leads in Bills** — ₹140M, highest single city-category combination

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **Python** (pandas) | Data cleaning — removed ", India" suffix, fixed date formats |
| **PostgreSQL** | Data import, aggregation queries, spend analysis |
| **Power BI** | Interactive 2-page dashboard with slicers |

---

## 📊 Dashboard Preview

### Page 1 — Spend Overview
![Page 1](https://github.com/Simrannegi02/credit-card-spend-analysis-India/blob/main/credit_card_spend_overview.png)

### Page 2 — City & Category Deep Dive
![Page 2](https://github.com/Simrannegi02/credit-card-spend-analysis-India/blob/main/credit_card_city_category_dashboard.png)

---

## 🗃️ Dataset
- **Source:** [Kaggle — Credit Card Transactions India](https://www.kaggle.com/datasets/thedevastator/analyzing-credit-card-spending-habits-in-india)
- **Size:** 26,052 transactions | 7 columns | 2013–2015
- **Cities:** 986 unique cities across India
- **Categories:** Bills, Food, Fuel, Entertainment, Grocery, Travel

---

## 🧹 Data Cleaning (Python)

python
# Removed ", India" from city names
df['City'] = df['City'].str.replace(', India', '')

# Standardized city names
df['City'] = df['City'].str.replace('Greater Mumbai', 'Mumbai')

# Fixed date format
df['Date'] = pd.to_datetime(df['Date'], format='mixed')


---
## 🔍 SQL Analysis Highlights

sql
-- Top cities by spend
SELECT city, ROUND(SUM(amount)) AS total_spend
FROM credit_card_transcation
GROUP BY city
ORDER BY total_spend DESC
LIMIT 10;

-- Gender wise spend
SELECT gender, ROUND(SUM(amount)) AS total_spend,
COUNT(*) AS transactions
FROM credit_card_transcation
GROUP BY gender;

-- Category wise analysis
SELECT exp_type, ROUND(SUM(amount)) AS total_spend,
ROUND(AVG(amount)) AS avg_spend
FROM credit_card_transcation
GROUP BY exp_type
ORDER BY total_spend DESC;

## 💡 Business Recommendations

1. **Target Female Customers** — 54% spend share, design premium card offers 
   for women
2. **Bills Auto-pay Feature** — Bills = ₹907M, highest category — launch 
   auto-pay rewards
3. **Travel Category Growth** — Only ₹109M vs ₹907M Bills — launch travel 
   cashback cards
4. **Focus on Metro Cities** — Mumbai, Bengaluru, Ahmedabad, Delhi = 82% of 
   top city revenue
5. **Silver Card Loyalty** — Most popular card — introduce Silver Premium tier

---

## 📁 Project Structure
credit-card-spend-analysis/
├── README.md
├── sql/
│   └── credit_card_analysis.sql
├── notebooks/
│   └── credit_card_eda.ipynb
├── dashboard/
│   └── credit_card_dashboard.pbix
└── assets/
├── page1_overview.png
└── page2_deep_dive.png

---

## 👩‍💻 Author
**Simran Negi** — Aspiring Data Analyst
SQL • Python • Power BI • Excel
[LinkedIn](www.linkedin.com/in/simran-negi-b20407275)
