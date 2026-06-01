# 🏦 Indian Bank Loan Default Analysis & Prediction

## 📌 Project Overview
End-to-end Data Analysis project analyzing loan default patterns 
in Indian banking data using SQL, Python, Machine Learning and Power BI.

## 🎯 Business Problem
Banks lose crores of rupees every year due to loan defaults. 
This project analyzes 5000 loan records to identify default risk 
factors and predict whether a customer will default using ML.

## 🛠️ Tools & Technologies
- **SQL** — Data extraction and analysis (MySQL)
- **Python** — EDA and Machine Learning (Pandas, Matplotlib, Scikit-learn)
- **Power BI** — Interactive dashboard (3 pages)
- **Machine Learning** — Logistic Regression and Random Forest

## 📁 Dataset
- **Source:** Synthetic dataset generated using AI prompt engineering
- **Size:** 5000 rows, 31 columns
- **Design:** Created a detailed prompt specifying realistic Indian 
  banking rules, age distributions, city wise data and intentional 
  missing values for data cleaning practice
- **Realism:** Follows real Indian banking patterns — credit score 
  distributions, EMI calculations, loan type distributions by age 
  group and realistic default rates

## 📊 Key Findings
- Overall default rate: **23%**
- Business loans have highest default rate: **26.4%**
- Self-employed customers default more: **25.4%**
- Nagpur has highest city-wise default rate: **27.5%**
- Random Forest model accuracy: **74%**

## 🔍 SQL Analysis
- Approval vs rejection rate
- Default rate by loan type, city, employment type
- Average income and credit score of defaulters vs non defaulters
- Year wise loan disbursement trend
- Top 10 customers by loan amount

## 🐍 Python Analysis
- Data cleaning and missing value handling
- Exploratory Data Analysis with 5 charts
- Logistic Regression model — 60% accuracy
- Random Forest model — 74% accuracy
- New customer default prediction with probability score

## 📈 Power BI Dashboard
- **Page 1** — Executive Summary (KPI cards, donut chart, trends)
- **Page 2** — Customer Analysis (city, age group, education)
- **Page 3** — Risk Analysis (high risk table with conditional formatting)
- Interactive slicers for loan type and date range

## 💡 Business Recommendations
1. Tighten eligibility for Business Loans — highest default rate 26.4%
2. Extra scrutiny for Self-Employed applicants — 25.4% default rate
3. Review approval criteria for Nagpur and Lucknow branches
4. Credit score below 600 should require additional verification
5. Use ML model for real-time default risk prediction during loan approval
