-- ================================================
-- W4 Database Fundamentals - Activity 07
-- Subqueries, Views, and Nested Queries Practice
-- ================================================
-- INSTRUCTIONS:
-- - Queries 1-7 are WORKING (run these first to understand subqueries)
-- - Queries 8-10 are TODOs for you to complete
-- - Each TODO has clear Success Criteria

-- ============================================
-- ✅ QUERY 1: Simple Subquery in WHERE (WORKING)
-- ============================================
-- PURPOSE: Find customers who placed orders in the last 30 days
-- LEARNING: Basic subquery pattern with IN operator

SELECT
    c.id,
    c.name,
    c.email,
    c.city,
    c.loyalty_tier
FROM customers c
WHERE c.id IN (
    SELECT DISTINCT customer_id
    FROM orders
    WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
);

-- EXPLANATION:
-- - Inner query finds customer IDs with recent orders
-- - Outer query gets full customer details for those IDs
-- - IN operator checks if customer_id exists in subquery results


-- ============================================
-- ✅ QUERY 2: Subquery with IN - Top Categories (WORKING)
-- ============================================
-- PURPOSE: Find products in the top-selling categories
-- LEARNING: Subquery combining JOINs and GROUP BY

SELECT
    p.id,
    p.name,
    p.category,
    p.price,
    p.stock_quantity
FROM products p
WHERE p.category IN (
    SELECT p2.category
    FROM order_items oi
    JOIN products p2 ON oi.product_id = p2.id
    GROUP BY p2.category
    ORDER BY SUM(oi.quantity) DESC
    LIMIT 3
)
ORDER BY p.category, p.name;

-- EXPLANATION:
-- - Inner query finds top 3 categories by total items sold
-- - Outer query retrieves all products in those categories
-- - Useful for focusing inventory on bestsellers


-- ============================================
-- ✅ QUERY 3: Subquery in SELECT (WORKING)
-- ============================================
-- PURPOSE: Calculate customer lifetime value alongside basic info
-- LEARNING: Scalar subqueries in SELECT clause

SELECT
    c.id,
    c.name,
    c.email,
    c.loyalty_tier,
    (
        SELECT COALESCE(SUM(o.total_amount), 0)
        FROM orders o
        WHERE o.customer_id = c.id
        AND o.status = 'completed'
    ) AS lifetime_value,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.id
    ) AS total_orders
FROM customers c
ORDER BY lifetime_value DESC
LIMIT 10;

-- EXPLANATION:
-- - Each subquery runs once per customer (correlated subquery)
-- - First subquery calculates total spending
-- - Second subquery counts all orders
-- - Shows top 10 customers by revenue


-- ============================================
-- ✅ QUERY 4: Correlated Subquery (WORKING)
-- ============================================
-- PURPOSE: Find customers with above-average order counts
-- LEARNING: Subquery that references outer query

SELECT
    c.name,
    c.email,
    c.city,
    (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.id) AS order_count
FROM customers c
WHERE (
    SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id = c.id
) > (
    SELECT AVG(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS order_counts
)
ORDER BY order_count DESC;

-- EXPLANATION:
-- - Innermost subquery calculates average orders per customer
-- - Middle subquery counts orders for current customer
-- - Compares each customer's count to the average
-- - Identifies high-value, frequent customers


-- ============================================
-- ✅ QUERY 5: Subquery in FROM (Inline View) (WORKING)
-- ============================================
-- PURPOSE: Get order statistics using derived table
-- LEARNING: Subquery as a temporary table

SELECT
    order_stats.status,
    order_stats.order_count,
    order_stats.total_revenue,
    ROUND(order_stats.avg_order_value, 2) AS avg_order_value,
    ROUND(order_stats.total_revenue * 100.0 / sum_revenue.grand_total, 2) AS revenue_percentage
FROM (
    SELECT
        status,
        COUNT(*) AS order_count,
        SUM(total_amount) AS total_revenue,
        AVG(total_amount) AS avg_order_value
    FROM orders
    GROUP BY status
) AS order_stats
CROSS JOIN (
    SELECT SUM(total_amount) AS grand_total
    FROM orders
) AS sum_revenue
ORDER BY order_stats.total_revenue DESC;

-- EXPLANATION:
-- - First subquery (order_stats) groups orders by status
-- - Second subquery (sum_revenue) calculates total revenue
-- - CROSS JOIN combines both for percentage calculation
-- - Shows business health by order status


-- ============================================
-- ✅ QUERY 6: CREATE VIEW - Customer Summary (WORKING)
-- ============================================
-- PURPOSE: Reusable view for customer analytics
-- LEARNING: Views simplify complex queries

-- View already created in schema.sql!
-- Let's query it:
SELECT
    customer_name,
    email,
    city,
    loyalty_tier,
    order_count,
    ROUND(total_spent, 2) AS total_spent,
    ROUND(avg_order_value, 2) AS avg_order_value,
    last_order_date
FROM customer_order_summary
WHERE order_count > 0
ORDER BY total_spent DESC
LIMIT 15;

-- EXPLANATION:
-- - View pre-computes customer statistics
-- - Can be queried like a regular table
-- - Simplifies complex joins and aggregations
-- - Check schema.sql to see view definition


-- ============================================
-- ✅ QUERY 7: CTE (Common Table Expression) (WORKING)
-- ============================================
-- PURPOSE: Product revenue analysis using WITH clause
-- LEARNING: CTEs make queries more readable (MySQL 8.0+)

WITH product_sales AS (
    SELECT
        p.id,
        p.name,
        p.category,
        p.price,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM products p
    LEFT JOIN order_items oi ON p.id = oi.product_id
    GROUP BY p.id, p.name, p.category, p.price
),
category_totals AS (
    SELECT
        category,
        SUM(total_revenue) AS category_revenue
    FROM product_sales
    GROUP BY category
)
SELECT
    ps.name AS product_name,
    ps.category,
    ps.units_sold,
    ROUND(ps.total_revenue, 2) AS product_revenue,
    ROUND(ct.category_revenue, 2) AS category_revenue,
    ROUND(ps.total_revenue * 100.0 / ct.category_revenue, 2) AS pct_of_category
FROM product_sales ps
JOIN category_totals ct ON ps.category = ct.category
WHERE ps.total_revenue > 0
ORDER BY ps.category, ps.total_revenue DESC;

-- EXPLANATION:
-- - First CTE (product_sales) calculates per-product metrics
-- - Second CTE (category_totals) sums revenue by category
-- - Main query joins both CTEs for percentage calculation
-- - Much more readable than nested subqueries!


-- ============================================
-- ✅ TODO 8: Above-Average Order Totals (Medium)
-- ============================================
-- TODO 8: Customers above the company-wide average completed-order spend.
-- Output: customer_name, email, total_spent, avg_order_value.
-- Verify: only completed orders contribute; every output row has total_spent
-- greater than the global average completed-order amount.

SELECT
    c.name AS customer_name,
    c.email,
    COALESCE(SUM(o.total_amount), 0) AS total_spent,
    COALESCE(AVG(o.total_amount), 0) AS avg_order_value
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id AND o.status = 'completed'
GROUP BY c.id, c.name, c.email
HAVING COALESCE(SUM(o.total_amount), 0) > (
    SELECT AVG(total_amount)
    FROM orders
    WHERE status = 'completed'
)
ORDER BY total_spent DESC;


-- ============================================
-- ✅ TODO 9: Product Revenue Ranking
-- ============================================
-- Output: rank, product_name, category, total_revenue (rounded to 2 dp).
-- Include all 40 products. Products with zero sales show 0.00 (not NULL).
-- Verify: row count = 40; rank 1 has the highest revenue.

SELECT
    RANK() OVER (ORDER BY COALESCE(SUM(oi.quantity * oi.unit_price), 0) DESC) AS rank,
    p.name AS product_name,
    p.category,
    ROUND(COALESCE(SUM(oi.quantity * oi.unit_price), 0), 2) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.id AND o.status = 'completed'
GROUP BY p.id, p.name, p.category
ORDER BY total_revenue DESC;


-- ============================================
-- ✅ TODO 10: Sales Dashboard View
-- ============================================
-- Create a view named sales_dashboard that joins customers, orders,
-- order_items, and products. Include only orders with status='completed'.
-- Columns: customer_name, customer_city, loyalty_tier, order_id, order_date,
-- order_status, product_name, category, quantity, unit_price, line_total.
-- Verify: SELECT COUNT(*) FROM sales_dashboard returns 150 or more rows.

CREATE VIEW sales_dashboard AS
SELECT
    c.name AS customer_name,
    c.city AS customer_city,
    c.loyalty_tier,
    o.id AS order_id,
    o.order_date,
    o.status AS order_status,
    p.name AS product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    ROUND(oi.quantity * oi.unit_price, 2) AS line_total
FROM customers c
JOIN orders o ON c.id = o.customer_id AND o.status = 'completed'
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;


-- ============================================
-- Stretch (optional, ungraded)
-- ============================================
-- - Products never ordered (NOT EXISTS).
-- - Running total of revenue per customer (window function).
-- - Month-over-month growth using LAG().
