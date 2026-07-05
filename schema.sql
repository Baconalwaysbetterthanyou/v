-- ================================================
-- W4 Database Fundamentals - Activity 07
-- Sales Database Schema (MySQL 8.0 Version)
-- ================================================
-- LEARNING GOAL: Master subqueries, views, and nested queries

-- Drop existing tables if they exist (fresh start)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP VIEW IF EXISTS customer_order_summary;

-- ============================================
-- ✅ WORKING: Customers Table (30 records)
-- ============================================
CREATE TABLE customers (
    -- Primary Key
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Customer Information
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL,

    -- Registration and Loyalty
    registration_date DATE NOT NULL,
    loyalty_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum') DEFAULT 'Bronze',

    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_city (city),
    INDEX idx_loyalty (loyalty_tier)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- ✅ WORKING: Products Table (40 records)
-- ============================================
CREATE TABLE products (
    -- Primary Key
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Product Information
    name VARCHAR(255) NOT NULL,
    category ENUM('Electronics', 'Clothing', 'Home', 'Sports', 'Books') NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK(price > 0),
    stock_quantity INT NOT NULL DEFAULT 0,
    supplier VARCHAR(255),

    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_category (category),
    INDEX idx_price (price)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- ✅ WORKING: Orders Table (80 records)
-- ============================================
CREATE TABLE orders (
    -- Primary Key
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign Key
    customer_id INT NOT NULL,

    -- Order Information
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL CHECK(total_amount >= 0),
    status ENUM('pending', 'completed', 'cancelled') DEFAULT 'pending',

    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_customer (customer_id),
    INDEX idx_date (order_date),
    INDEX idx_status (status),

    -- Foreign Key Constraint
    FOREIGN KEY (customer_id) REFERENCES customers(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- ✅ WORKING: Order Items Table (200 records)
-- ============================================
CREATE TABLE order_items (
    -- Primary Key
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign Keys
    order_id INT NOT NULL,
    product_id INT NOT NULL,

    -- Item Information
    quantity INT NOT NULL CHECK(quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK(unit_price >= 0),

    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX idx_order (order_id),
    INDEX idx_product (product_id),

    -- Foreign Key Constraints
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- ✅ WORKING: Customer Order Summary View
-- ============================================
CREATE VIEW customer_order_summary AS
SELECT
    c.id as customer_id,
    c.name as customer_name,
    c.email,
    c.city,
    c.loyalty_tier,
    COUNT(DISTINCT o.id) as order_count,
    COALESCE(SUM(o.total_amount), 0) as total_spent,
    COALESCE(AVG(o.total_amount), 0) as avg_order_value,
    MAX(o.order_date) as last_order_date
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id AND o.status = 'completed'
GROUP BY c.id, c.name, c.email, c.city, c.loyalty_tier;

-- Success Message
SELECT 'MySQL schema created successfully!' as message,
       'Tables: customers, products, orders, order_items' as tables_created,
       'View: customer_order_summary' as view_created;
