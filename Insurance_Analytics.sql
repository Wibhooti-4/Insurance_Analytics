CREATE DATABASE Insurance_DB;
USE Insurance_DB;



SELECT * FROM brokerage;
SELECT * FROM budgets;
SELECT * FROM fees;
SELECT * FROM invoice;
SELECT * FROM meeting;
SELECT * FROM opportunity;

#1. No of Invoice by Account Executive

SELECT Account_Executive, Count(invoice_number) AS Number_of_invoice FROM Invoice
GROUP BY Account_Executive
ORDER BY Number_of_invoice DESC;

#2 Yearly Meeting Count

SELECT YEAR(meeting_date), COUNT(*) AS NO_of_Meeting FROM meeting
GROUP BY YEAR(meeting_date)
ORDER BY NO_of_Meeting ;

#3.1 Crosscell- Target,Achieved,Invoice Amount

SELECT CONCAT(ROUND(SUM(Cross_Sell_Budget)/1000000,2),"M") AS Target_Amount FROM Budgets;

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Achieved_Amount FROM Brokerage 
WHERE income_class = "Cross Sell";

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Invoice_Amount FROM Invoice
WHERE income_class = "Cross Sell";

#3.2 New- Target,Achieved,Invoice Amount

SELECT CONCAT(ROUND(SUM(New_Budget)/1000000,2),"M") AS Target_Amount FROM Budgets;

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Achieved_Amount FROM Brokerage 
WHERE income_class = "New";

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Invoice_Amount FROM Invoice
WHERE income_class = "New";

#3.3 Renewal- Target,Achieved,Invoice Amount

SELECT CONCAT(ROUND(SUM(Renewal_Budget)/1000000,2),"M") AS Target_Amount FROM Budgets;

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Achieved_Amount FROM Brokerage 
WHERE income_class = "Renewal";

SELECT CONCAT(ROUND(SUM(Amount)/1000000,2),"M") AS Invoice_Amount FROM Invoice
WHERE income_class = "Renewal";

#4.Stages by Revenue

SELECT Stage, CONCAT(ROUND(SUM(Revenue_amount)/1000000,2),"M") AS Revenue_Amount
FROM Opportunity GROUP BY Stage;

# 5. No of Meeting by Account Executive

SELECT Account_Executive, COUNT(*) AS Number_of_Meeting 
FROM Meeting GROUP BY Account_Executive ORDER BY Number_of_Meeting DESC;

# 6. Top Opportunity by Revenue

SELECT opportunity_name, CONCAT("$",ROUND(SUM(revenue_amount)/1000000,2),"M") AS Revenue_Amount
FROM Opportunity GROUP BY opportunity_name ORDER By Revenue_Amount DESC;


# 7. Product_group by Revenue Amount
SELECT product_group, CONCAT("$",ROUND(SUM(revenue_amount)/1000000,2),"M") AS Revenue_Amount
FROM Opportunity GROUP BY product_group ORDER By Revenue_Amount DESC;

# 8. Product_sub_group by Revenue Amount
SELECT product_sub_group, CONCAT("$",ROUND(SUM(revenue_amount)/1000000,2),"M") AS Revenue_Amount
FROM Opportunity GROUP BY product_sub_group ORDER By Revenue_Amount DESC;