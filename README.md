# 🛒 Walmart Sales Analysis

## 📚 Table of Contents
- [📌 Project Overview](#project-overview)  
- [📊 Business Problem](#business-problem)  
- [🎯 Aim of the Project](#aim-of-the-project)  
- [📥 Data Sources](#data-sources)  
- [🛠 Tools Used](#tools-used)  
- [🔄 Process Workflow](#process-workflow)  
- [🔍 Key Insights](#key-insights)  
- [📈 Dashboard Features](#dashboard-features)  
- [📊 Results/Findings](#resultsfindings)  
- [💡 Recommendations](#recommendations)



### 📌Project Overview

This project explores Walmart’s sales performance over a short time frame in early 2019. The goal was to identify product demand trends, branch-level income distribution, and customer behavior based on sales timing, gender, and payment methods. The dashboard provides an interactive and visual summary to help stakeholders make informed business decisions.
### 📊Business Problem
 - Walmart needed a quick insight into:

 - Which products and time periods were generating the highest income?

 - How did branch performance compare across different cities?

 - What were the customer preferences in terms of time of purchase, gender, and payment method?

 - How much impact do customer types (members vs. normal) have on revenue?


### 🎯Aim of the Project
**The primary aims of the project include:**

 - Analyzing total sales performance by branch, product, and customer segment

 - Identifying peak sales periods and high-performing product categories

 - Understanding the purchasing behavior of different customer types and genders

 - Delivering a Power BI dashboard for real-time exploration and decision-making
### 📥Data Sources
**Walmart Sales Dataset (Jan–Mar 2019)**
- Contains transactional-level data including:

  - Product line

  - Unit price and total sales

  - Branch and city

  - Customer type and gender

  - Payment method

  - Date and time of transaction

- Format: The primary data set used for this analysis is the "Walmart_sales.csv"file,containg detailed information about each Bike sales made by the company


### 🛠Tools Used
- **Excel –** Data preparation and formatting

- **Power BI –** Data modeling, DAX measures, and dashboard creation

- **Power Query –** Data transformation

- **DAX -** Perform advanced calculations

### 🔄Process Workflow
**1. Data Cleaning**

 - Removed missing values and standardized column names

 - Filtered dataset for the period between January 1, 2019 – March 19, 2019

**2. Data Transformation**

 - Extracted time of day from timestamps (morning, afternoon, evening)

 - Created metrics: total income, gross income, quantity sold, average unit price

**3. Data Modeling**

 - Established relationships between time, products, customer type, and branches

**4. Dashboard Design**

 - Built multiple visuals with interactive filters for time, gender, and payment method

### 🔍Key Insights
- **Total Income:** $287K

- **Gross Income:** $14K

- **Average Unit Price:** $49K

- **Quantity Sold:** 4,911 units

- **Orders Processed:** 886

- **Top-Selling Product Categories:**

  - Food and beverages, Fashion accessories, Sports & travel

- **Peak Sales Month:** January ($116K)

- **Most Used Time Slot:** Afternoon (38.93%)

- **Customer Type:** Normal customers made slightly more purchases (50.79%) than Members

- **Highest Income by Gender:** Female ($153K)

- **Branch Performance:**

  - Branch C (Naypyitaw): Highest income ($100K)

  - Branch A (Yangon): Lowest income ($91K)
 
    <img width="602" height="338" alt="Walmart sales dashboard" src="https://github.com/user-attachments/assets/260f5162-c2f3-4ae4-a506-9e14304aa73a" />


### 📈Dashboard Features
- KPI Cards: Total Income, Gross Margin, Orders, Quantity, Unit Price

- Bar Charts:

  - Total Sales by Month

  - Income by Branch

  - Quantity & Total by Product Line

- Donut Charts:

  - Sales by Customer Type

  - Quantity Sold by Time of Day

- Tables:

  - Income by Gender

  - Gross Income by City

- Slicers/Filters:

  - Payment Method

  - Date

  - City
### 📊Results/Findings
- Food-related products and fashion accessories performed best.

- Most purchases were made in the afternoon.

- Branch C in Naypyitaw brought in the highest income and had strong gross margins.

- Female customers contributed slightly more to total revenue.

- Despite similar product quantities sold across branches, income distribution varied — likely due to product mix or unit prices.



### 💡Recommendations
**1. Focus Marketing on Afternoon Shoppers**
 - Enhance promotions and staff during the afternoon time slot, which drives nearly 40% of sales.

**2. Product Positioning**
 - Prioritize inventory and display for food, beverages, and fashion accessories.

**3. Branch Optimization**
 - Review pricing or product strategies in Branch A (Yangon) to improve revenue.

**4. Customer Loyalty Programs**
 - Consider boosting incentives for normal customers since they represent the majority of buyers.

**5. Gender-Specific Campaigns**
 - Leverage the strong female buyer segment for targeted promotions.

### ⚠️Limitation
The analysis is based on a ~2.5-month window, which may not reflect annual trends.

### 📚References
- Excel
- Mysql workbench server
- Power BI for data modeling and visualization
