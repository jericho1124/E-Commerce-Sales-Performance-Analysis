# Olist E-Commerce Sales Performance Analysis

An end-to-end data analytics project analyzing 96,478 orders from a real Brazilian e-commerce platform using Excel, SQL, and Power BI.

---

## Tools Used
- **Excel** - data exploration and pivot table analysis
- **SQL (PostgreSQL / pgAdmin)** - data cleaning, joining 8 tables, and analytical queries
- **Power BI** - interactive 2-page dashboard

---

## Dataset
- Source: [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)
- 9 CSV files | 96,478 delivered orders | 2016-2018
- Tables: orders, order items, payments, reviews, customers, products, sellers, geolocation, category translation

---

## Business Questions Answered
1. What is the total revenue, orders, and average order value?
2. How does monthly revenue trend over time?
3. Which Brazilian states generate the most sales?
4. Which product categories perform best?
5. What payment methods do customers prefer?
6. Does delivery time affect customer satisfaction?
7. Who are the top sellers by revenue?
8. What is the year-over-year revenue growth?

---

## Key Findings

**Revenue**
- Total revenue: $13.2M across 96,478 delivered orders
- Average order value: $137.04
- Revenue grew 21.1% from 2017 to 2018 (note: 2018 data ends in August)
- November 2017 shows a significant spike, likely driven by Black Friday

**Geography**
- Sao Paulo accounts for 38% of total revenue
- SP, RJ, and MG together generate 63% of all revenue
- Sao Paulo has the fastest average delivery at ~9 days

**Categories**
- Health & Beauty is the top revenue category at $1.23M
- Watches & Gifts and Bed, Bath & Table follow closely
- Technology products do not dominate, which is unusual for e-commerce

**Payments**
- 74% of orders paid by credit card
- Average of 3.7 installments per credit card transaction
- Payment method has no significant effect on review scores

**Delivery - Key Insight**
- On-time delivery rate: 93.2%
- On-time orders average 4.3 stars
- Late orders average 2.3 stars
- A 2-star gap consistent across all states and years. Delivery speed is the strongest driver of customer satisfaction.

---

## Dashboard Pages

**Page 1 - Sales Overview**
- KPI cards: Total Revenue, Total Orders, AOV, Avg Review Score
- Monthly revenue and orders trend (line chart)
- Revenue by product category (bar chart)
- Orders by Brazilian state (filled map)
- Payment method breakdown (donut chart)
<img width="1278" height="722" alt="Sales Dashboard" src="https://github.com/user-attachments/assets/8dbaafae-6ac0-46d4-8b31-2ca7ffc249b2" />



---


**Page 2 - Delivery and Satisfaction**
- KPI cards: On-Time Rate, Avg Delivery Days, YoY Growth, Avg Review Score
- On-time vs late delivery rating comparison (bar chart, green/red)
- Delivery days vs review score by state (scatter chart)
- Delivery status by year with conditional formatting (matrix)
- Top 10 sellers by revenue (bar chart)
<img width="1293" height="729" alt="Delivery Dashboard" src="https://github.com/user-attachments/assets/c20f2ad9-2d27-4cd2-97bc-3942d7856e37" />

---

## SQL Queries Included

| # | Query | Purpose |
|---|---|---|
| 1 | KPI Summary | Total revenue, orders, AOV, avg review score |
| 2 | Monthly Revenue Trend | Revenue and order count by month |
| 3 | Revenue by Category | Top categories using English translations |
| 4 | Sales by State | Revenue and orders per customer state |
| 5 | Payment Analysis | Payment type breakdown and avg values |
| 6 | Delivery vs Review Score | On-time vs late impact on satisfaction |
| 7 | Top 10 Sellers | Highest revenue sellers with review scores |
| 8 | YoY Growth | Year-over-year revenue using LAG() window function |

---

## Data Model
Snowflake schema with `olist_order_items` as the central fact table.
7 relationships across 8 tables managed in pgAdmin and replicated in Power BI.
<img width="1540" height="1240" alt="ERD_Schema" src="https://github.com/user-attachments/assets/4566c183-f025-491e-88d8-c24a24a9acfc" />

---

## How to Run

**SQL**
1. Install pgAdmin and create a database called `olist`
2. Import all 9 CSV files as tables
3. Run all SQL queries in the Query Tool

**Power BI**
1. Open `Olist_Dashboard.pbix` in Power BI Desktop
2. Update data source path to your local CSV folder if needed
3. Refresh data

---

## Notes on Data Quality
- 2016 data covers only September to December (partial year, excluded from YoY comparisons)
- 2018 data ends in August (partial year)
- ~800 orders have payments but no matching review, handled with IFERROR in Excel.
- Delivery status calculated using date comparison only (time component excluded for fairness)
