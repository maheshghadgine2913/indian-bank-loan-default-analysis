create database loan_analysis;
use loan_analysis;

CREATE TABLE loan_data (
    customer_id VARCHAR(20),
    full_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    education VARCHAR(50),
    employment_type VARCHAR(30),
    years_of_experience INT,
    monthly_income INT,
    loan_id VARCHAR(20),
    loan_type VARCHAR(30),
    loan_amount BIGINT,
    loan_tenure_months INT,
    interest_rate DECIMAL(5,2),
    emi_amount INT,
    loan_purpose VARCHAR(100),
    loan_application_date DATE,
    loan_approval_status VARCHAR(20),
    credit_score INT,
    existing_loans INT,
    total_existing_debt BIGINT,
    debt_to_income_ratio DECIMAL(5,2),
    collateral_value BIGINT,
    co_applicant VARCHAR(5),
    repayment_status VARCHAR(20),
    missed_payments INT,
    default_status TINYINT,
    days_past_due INT,
    recovery_amount BIGINT
);

SELECT COUNT(*) FROM loan_data;

select *
from loan_data
limit 10;

## How many loans are approved
select
	loan_approval_status,
    count(*) as total_status
from loan_data
group by loan_approval_status;

## default rate
SELECT 
    default_status,
    COUNT(*) AS total,
    CONCAT(ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2), '%') AS percentage
FROM loan_data
WHERE default_status IS NOT NULL
GROUP BY default_status;

#credit category wise customers
select
    case when credit_score >= 750 then 'Excellent'
		 when credit_score >= 650 then 'Good'
         when credit_score >= 550 then 'Average'
         else 'Poor'
	End as Credit_Category,
     count(*) as Total
    from loan_data
    group by Credit_Category
    order by Total desc;
    

# Which loan type has the highest default rate?
select
	loan_type,
    count(*) as total_loans,
    sum(case when default_status = 1 then 1 else 0 end) as total_defaults,
	concat(round(sum(case when default_status = 1 then 1 else 0 end) * 100.0 / count(*),2),'%') as default_rate
    from loan_data
    where default_status is not null
    group by loan_type
    order by default_rate desc;

# Which city has the highest number of defaulters?
select
	city,
    count(*) as total_loans,
    sum(case when default_status = 1 then 1 else 0 end) as total_defaults,
	concat(round(sum(case when default_status = 1 then 1 else 0 end) * 100.0 / count(*),2),'%') as default_rate
from loan_data
where default_status is not null
group by city
order by default_rate desc;
    
# What is the average income of defaulters vs non defaulters?
select
	case when default_status = 0 then 'Non defaulter'
		 when default_status = 1 then 'defaulter'
	End as customer_type,
    concat('₹',format(avg(monthly_income),0 ))as monthly_income
from loan_data
where default_status is not null
group by default_status;

# What is the average credit score of defaulters vs non defaulters?
select
	case when default_status = 0 then 'Non defaulter'
		 when default_status = 1 then 'defaulter'
	End as customer_type,
    round(avg(credit_score),0) as credit_score
from loan_data
where default_status is not null
group by default_status;

# Default rate by employment type
select
	employment_type,
    count(*) as total_loans,
    sum(case when default_status = 1 then 1 else 0 end) as total_defaults,
	concat(round(sum(case when default_status = 1 then 1 else 0 end) * 100.0 / count(*),2),'%') as default_rate
from loan_data
where default_status is not null
group by employment_type
order by default_rate desc;

# Top 10 customer by loan amount
select
	customer_id,
    full_name,
    loan_type,
    concat('₹',format(loan_amount,0)) as total_amount
from loan_data
order by loan_amount desc
limit 10;
    
# Year wise loan disbursement trend
select
	year(loan_application_date) as disbursed_year,
    count(*) as total_loans
from loan_data
where loan_approval_status = 'Approved'
group by year(loan_application_date)
order by year(loan_application_date) asc;




