-- a) Total Sales and Profit for Each Product:
\COPY (
    SELECT 
    "Product ID", 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Product ID"
ORDER BY 
    Total_Sales DESC
)
TO 'C:/Users/athar/Documents/trying sql/query_a_output.csv' WITH CSV HEADER;

-- b) Top Product Categories by Revenue or Profit:
\COPY (SELECT 
    "Category", 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Category"
ORDER BY 
    Total_Sales DESC)
TO 'C:/Users/athar/Documents/trying sql/query_b_output.csv' WITH CSV HEADER;

-- c) Average Order Value by Customer Segment:
\COPY
SELECT 
    "Segment", 
    AVG("Sales") AS Average_Order_Value
FROM 
    superstore
GROUP BY 
    "Segment"
TO 'C:/Users/athar/Documents/trying sql/query_c_output.csv' WITH CSV HEADER;

-- d) Top Customers by Total Sales:
\COPY
SELECT 
    "Customer ID", 
    SUM("Sales") AS Total_Sales, 
    COUNT("Order ID") AS Total_Orders
FROM 
    superstore
GROUP BY 
    "Customer ID"
ORDER BY 
    Total_Sales DESC
LIMIT 10
TO 'C:/Users/athar/Documents/trying sql/query_d_output.csv' WITH CSV HEADER;

-- e) Average Discount Given to Customers:
\COPY
SELECT 
    "Customer ID", 
    AVG("Discount") AS Average_Discount
FROM 
    superstore
GROUP BY 
    "Customer ID"
ORDER BY 
    Average_Discount DESC
TO 'C:/Users/athar/Documents/trying sql/query_e_output.csv' WITH CSV HEADER;

-- f) Average Time Between Order Date and Ship Date:
\COPY 
SELECT 
    AVG("Ship Date" - "Order Date") AS Average_Shipping_Time
FROM 
    superstore
TO 'C:/Users/athar/Documents/trying sql/query_f_output.csv' WITH CSV HEADER;

-- g) Most Common Shipping Modes and Their Impact:
\COPY 
SELECT 
    "Ship Mode", 
    COUNT("Order ID") AS Total_Orders, 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Ship Mode"
ORDER BY 
    Total_Orders DESC
TO 'C:/Users/athar/Documents/trying sql/query_g_output.csv' WITH CSV HEADER;

-- h) Sales and Profit by Region (Postal Code):
\COPY 
SELECT 
    "Postal Code", 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Postal Code"
ORDER BY 
    Total_Sales DESC
TO 'C:/Users/athar/Documents/trying sql/query_h_output.csv' WITH CSV HEADER;

-- i) Highest Sales/Profit Regions:
\COPY 
SELECT 
    "Postal Code", 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Postal Code"
ORDER BY 
    Total_Profit DESC
LIMIT 10
TO 'C:/Users/athar/Documents/trying sql/query_i_output.csv' WITH CSV HEADER;

-- j) Monthly Sales and Profit Trends:
\COPY 
SELECT 
    TO_CHAR("Order Date", 'YYYY-MM') AS Order_Month, 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    Order_Month
ORDER BY 
    Order_Month
TO 'C:/Users/athar/Documents/trying sql/query_j_output.csv' WITH CSV HEADER;

-- k) Seasonal Trends in Sales or Profit:
\COPY 
SELECT 
    EXTRACT(QUARTER FROM "Order Date") AS Quarter, 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    Quarter
ORDER BY 
    Quarter
TO 'C:/Users/athar/Documents/trying sql/query_k_output.csv' WITH CSV HEADER;

-- l) Sensitivity to Discounts by Product:
\COPY 
SELECT 
    "Product ID", 
    AVG("Discount") AS Average_Discount, 
    SUM("Sales") AS Total_Sales, 
    SUM("Profit") AS Total_Profit
FROM 
    superstore
GROUP BY 
    "Product ID"
ORDER BY 
    Average_Discount DESC
TO 'C:/Users/athar/Documents/trying sql/query_l_output.csv' WITH CSV HEADER;
