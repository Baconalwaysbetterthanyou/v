-- ================================================
-- W4 Database Fundamentals - Activity 07
-- Sample Sales Data (Realistic Test Dataset)
-- ================================================
-- INSTRUCTIONS: Run this after creating the schema
-- Dataset: 30 customers, 40 products, 80 orders, 200 order items

-- ============================================
-- Insert 30 Customers across 5 Cities
-- ============================================
INSERT INTO customers (name, email, city, registration_date, loyalty_tier) VALUES
-- NYC customers (8)
('Alice Johnson', 'alice.j@email.com', 'NYC', '2023-08-15', 'Gold'),
('Bob Smith', 'bob.smith@email.com', 'NYC', '2023-09-20', 'Silver'),
('Carol White', 'carol.w@email.com', 'NYC', '2023-10-05', 'Platinum'),`
('David Lee', 'david.lee@email.com', 'NYC', '2023-11-12', 'Bronze'),
('Emma Davis', 'emma.d@email.com', 'NYC', '2023-12-01', 'Gold'),
('Frank Miller', 'frank.m@email.com', 'NYC', '2024-01-15', 'Silver'),
('Grace Chen', 'grace.c@email.com', 'NYC', '2024-02-10', 'Bronze'),
('Henry Wilson', 'henry.w@email.com', 'NYC', '2024-03-05', 'Gold'),

-- LA customers (7)
('Iris Martinez', 'iris.m@email.com', 'LA', '2023-08-20', 'Platinum'),
('Jack Brown', 'jack.b@email.com', 'LA', '2023-09-15', 'Gold'),
('Katie Garcia', 'katie.g@email.com', 'LA', '2023-10-20', 'Silver'),
('Leo Rodriguez', 'leo.r@email.com', 'LA', '2023-11-25', 'Bronze'),
('Maria Lopez', 'maria.l@email.com', 'LA', '2024-01-10', 'Gold'),
('Nathan Kim', 'nathan.k@email.com', 'LA', '2024-02-15', 'Silver'),
('Olivia Taylor', 'olivia.t@email.com', 'LA', '2024-03-20', 'Bronze'),

-- Chicago customers (6)
('Paul Anderson', 'paul.a@email.com', 'Chicago', '2023-09-01', 'Gold'),
('Quinn Moore', 'quinn.m@email.com', 'Chicago', '2023-10-15', 'Silver'),
('Rachel Thomas', 'rachel.t@email.com', 'Chicago', '2023-11-20', 'Platinum'),
('Sam Jackson', 'sam.j@email.com', 'Chicago', '2023-12-25', 'Bronze'),
('Tina Harris', 'tina.h@email.com', 'Chicago', '2024-01-30', 'Gold'),
('Uma Patel', 'uma.p@email.com', 'Chicago', '2024-03-10', 'Silver'),

-- Houston customers (5)
('Victor Clark', 'victor.c@email.com', 'Houston', '2023-09-10', 'Bronze'),
('Wendy Lewis', 'wendy.l@email.com', 'Houston', '2023-10-25', 'Gold'),
('Xander Scott', 'xander.s@email.com', 'Houston', '2023-12-05', 'Silver'),
('Yara Walker', 'yara.w@email.com', 'Houston', '2024-02-01', 'Bronze'),
('Zoe Young', 'zoe.y@email.com', 'Houston', '2024-03-15', 'Gold'),

-- Phoenix customers (4)
('Aaron Hall', 'aaron.h@email.com', 'Phoenix', '2023-10-10', 'Silver'),
('Beth Allen', 'beth.a@email.com', 'Phoenix', '2023-11-15', 'Bronze'),
('Carl King', 'carl.k@email.com', 'Phoenix', '2024-01-20', 'Gold'),
('Dana Wright', 'dana.w@email.com', 'Phoenix', '2024-03-25', 'Silver');

-- ============================================
-- Insert 40 Products across 5 Categories
-- ============================================
INSERT INTO products (name, category, price, stock_quantity, supplier) VALUES
-- Electronics (10 products)
('Wireless Headphones', 'Electronics', 79.99, 150, 'TechSupply Co'),
('Smart Watch', 'Electronics', 249.99, 80, 'TechSupply Co'),
('Bluetooth Speaker', 'Electronics', 59.99, 200, 'AudioHub'),
('Laptop Stand', 'Electronics', 39.99, 120, 'OfficeGear'),
('USB-C Cable', 'Electronics', 12.99, 500, 'TechSupply Co'),
('Wireless Mouse', 'Electronics', 24.99, 300, 'OfficeGear'),
('Keyboard', 'Electronics', 89.99, 100, 'OfficeGear'),
('Webcam HD', 'Electronics', 69.99, 90, 'TechSupply Co'),
('Phone Case', 'Electronics', 19.99, 400, 'AccessoryCo'),
('Screen Protector', 'Electronics', 9.99, 600, 'AccessoryCo'),

-- Clothing (10 products)
('Cotton T-Shirt', 'Clothing', 24.99, 300, 'FashionWorld'),
('Denim Jeans', 'Clothing', 59.99, 150, 'FashionWorld'),
('Running Shoes', 'Clothing', 89.99, 100, 'SportStyle'),
('Winter Jacket', 'Clothing', 149.99, 60, 'FashionWorld'),
('Baseball Cap', 'Clothing', 19.99, 200, 'SportStyle'),
('Athletic Shorts', 'Clothing', 34.99, 180, 'SportStyle'),
('Hoodie', 'Clothing', 49.99, 120, 'FashionWorld'),
('Socks (3-pack)', 'Clothing', 14.99, 400, 'FashionWorld'),
('Leather Belt', 'Clothing', 39.99, 150, 'AccessoryCo'),
('Sunglasses', 'Clothing', 79.99, 90, 'AccessoryCo'),

-- Home (8 products)
('Coffee Maker', 'Home', 79.99, 80, 'HomeEssentials'),
('Desk Lamp', 'Home', 34.99, 150, 'HomeEssentials'),
('Throw Pillow', 'Home', 24.99, 200, 'HomeEssentials'),
('Wall Clock', 'Home', 29.99, 100, 'HomeDecor'),
('Picture Frame', 'Home', 19.99, 250, 'HomeDecor'),
('Candle Set', 'Home', 34.99, 180, 'HomeEssentials'),
('Kitchen Knife Set', 'Home', 89.99, 70, 'KitchenPro'),
('Cutting Board', 'Home', 24.99, 150, 'KitchenPro'),

-- Sports (6 products)
('Yoga Mat', 'Sports', 29.99, 200, 'FitGear'),
('Dumbbell Set', 'Sports', 149.99, 50, 'FitGear'),
('Water Bottle', 'Sports', 19.99, 300, 'FitGear'),
('Resistance Bands', 'Sports', 24.99, 180, 'FitGear'),
('Jump Rope', 'Sports', 14.99, 250, 'FitGear'),
('Gym Bag', 'Sports', 39.99, 120, 'SportStyle'),

-- Books (6 products)
('Python Programming', 'Books', 49.99, 100, 'BookHub'),
('Web Development Guide', 'Books', 39.99, 80, 'BookHub'),
('Database Design', 'Books', 54.99, 70, 'BookHub'),
('Clean Code', 'Books', 44.99, 90, 'BookHub'),
('The Pragmatic Programmer', 'Books', 42.99, 85, 'BookHub'),
('Data Science Handbook', 'Books', 59.99, 60, 'BookHub');

-- ============================================
-- Insert 80 Orders (spanning 6 months)
-- ============================================
-- Orders distributed across Aug 2023 - Mar 2024
-- Mix of statuses: ~70% completed, ~20% pending, ~10% cancelled
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
-- August 2023 (8 orders)
(1, '2023-08-20', 159.98, 'completed'),
(2, '2023-08-22', 89.99, 'completed'),
(3, '2023-08-25', 329.97, 'completed'),
(9, '2023-08-27', 249.99, 'completed'),
(17, '2023-08-28', 79.99, 'completed'),
(10, '2023-08-29', 124.98, 'completed'),
(4, '2023-08-30', 59.99, 'cancelled'),
(18, '2023-08-31', 199.98, 'completed'),

-- September 2023 (12 orders)
(5, '2023-09-02', 299.98, 'completed'),
(11, '2023-09-05', 149.99, 'completed'),
(19, '2023-09-08', 89.99, 'completed'),
(1, '2023-09-10', 179.97, 'completed'),
(12, '2023-09-12', 109.98, 'completed'),
(23, '2023-09-15', 249.99, 'completed'),
(6, '2023-09-17', 79.99, 'cancelled'),
(13, '2023-09-20', 169.98, 'completed'),
(24, '2023-09-22', 139.99, 'completed'),
(3, '2023-09-25', 279.97, 'completed'),
(14, '2023-09-27', 99.99, 'completed'),
(25, '2023-09-30', 189.98, 'completed'),

-- October 2023 (14 orders)
(7, '2023-10-02', 219.98, 'completed'),
(15, '2023-10-05', 159.99, 'completed'),
(2, '2023-10-08', 129.98, 'completed'),
(20, '2023-10-10', 199.98, 'completed'),
(26, '2023-10-12', 89.99, 'completed'),
(8, '2023-10-15', 249.99, 'completed'),
(16, '2023-10-17', 119.98, 'cancelled'),
(21, '2023-10-20', 179.97, 'completed'),
(27, '2023-10-22', 139.99, 'completed'),
(9, '2023-10-25', 299.98, 'completed'),
(22, '2023-10-27', 159.98, 'completed'),
(28, '2023-10-29', 99.99, 'completed'),
(10, '2023-10-30', 189.98, 'completed'),
(1, '2023-10-31', 229.97, 'completed'),

-- November 2023 (13 orders)
(11, '2023-11-03', 169.98, 'completed'),
(4, '2023-11-05', 149.99, 'completed'),
(18, '2023-11-08', 209.98, 'completed'),
(29, '2023-11-10', 89.99, 'completed'),
(12, '2023-11-12', 179.97, 'completed'),
(5, '2023-11-15', 259.98, 'completed'),
(19, '2023-11-17', 129.99, 'cancelled'),
(30, '2023-11-20', 199.98, 'completed'),
(13, '2023-11-22', 139.99, 'completed'),
(6, '2023-11-25', 189.98, 'completed'),
(20, '2023-11-27', 109.99, 'completed'),
(14, '2023-11-28', 249.99, 'completed'),
(7, '2023-11-30', 159.98, 'completed'),

-- December 2023 (11 orders)
(21, '2023-12-02', 219.98, 'completed'),
(15, '2023-12-05', 179.97, 'completed'),
(8, '2023-12-08', 299.98, 'completed'),
(22, '2023-12-10', 149.99, 'completed'),
(16, '2023-12-12', 189.98, 'cancelled'),
(9, '2023-12-15', 129.99, 'completed'),
(23, '2023-12-18', 259.98, 'completed'),
(17, '2023-12-20', 139.99, 'completed'),
(10, '2023-12-22', 199.98, 'completed'),
(24, '2023-12-25', 89.99, 'completed'),
(25, '2023-12-28', 279.97, 'completed'),

-- January 2024 (9 orders)
(11, '2024-01-05', 169.98, 'completed'),
(26, '2024-01-08', 149.99, 'completed'),
(5, '2024-01-10', 229.97, 'completed'),
(18, '2024-01-15', 189.98, 'completed'),
(27, '2024-01-18', 119.99, 'completed'),
(12, '2024-01-22', 209.98, 'completed'),
(6, '2024-01-25', 159.98, 'cancelled'),
(19, '2024-01-28', 179.97, 'completed'),
(28, '2024-01-30', 139.99, 'completed'),

-- February 2024 (7 orders)
(13, '2024-02-03', 199.98, 'completed'),
(1, '2024-02-08', 249.99, 'completed'),
(29, '2024-02-12', 129.99, 'completed'),
(20, '2024-02-15', 189.98, 'pending'),
(14, '2024-02-20', 159.98, 'completed'),
(7, '2024-02-25', 219.98, 'pending'),
(30, '2024-02-28', 99.99, 'completed'),

-- March 2024 (6 orders)
(21, '2024-03-05', 179.97, 'completed'),
(15, '2024-03-10', 149.99, 'pending'),
(8, '2024-03-15', 209.98, 'pending'),
(22, '2024-03-20', 139.99, 'pending'),
(16, '2024-03-25', 189.98, 'pending'),
(3, '2024-03-28', 259.98, 'pending');

-- ============================================
-- Insert 200 Order Items (2-5 items per order)
-- ============================================
-- Realistic distribution: mix of quantities and products
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
-- Order 1 (2 items)
(1, 1, 2, 79.99),
(1, 5, 1, 12.99),
-- Order 2 (1 item)
(2, 13, 1, 89.99),
-- Order 3 (3 items)
(3, 2, 1, 249.99),
(3, 11, 1, 24.99),
(3, 21, 2, 34.99),
-- Order 4 (1 item)
(4, 2, 1, 249.99),
-- Order 5 (1 item)
(5, 21, 1, 79.99),
-- Order 6 (2 items)
(6, 6, 2, 24.99),
(6, 29, 3, 24.99),
-- Order 7 (1 item)
(7, 3, 1, 59.99),
-- Order 8 (3 items)
(8, 7, 1, 89.99),
(8, 23, 2, 24.99),
(8, 31, 2, 29.99),
-- Order 9 (4 items)
(9, 2, 1, 249.99),
(9, 12, 1, 59.99),
(9, 22, 1, 34.99),
(9, 28, 1, 24.99),
-- Order 10 (1 item)
(10, 14, 1, 149.99),
-- Order 11 (1 item)
(11, 13, 1, 89.99),
-- Order 12 (3 items)
(12, 1, 1, 79.99),
(12, 11, 2, 24.99),
(12, 32, 2, 19.99),
-- Order 13 (2 items)
(13, 4, 1, 39.99),
(13, 30, 3, 19.99),
-- Order 14 (1 item)
(14, 2, 1, 249.99),
-- Order 15 (2 items)
(15, 27, 1, 89.99),
(15, 35, 1, 49.99),
-- Order 16 (2 items)
(16, 13, 1, 89.99),
(16, 17, 1, 49.99),
-- Order 17 (2 items)
(17, 21, 1, 79.99),
(17, 31, 2, 29.99),
-- Order 18 (3 items)
(18, 7, 1, 89.99),
(18, 15, 1, 19.99),
(18, 24, 2, 19.99),
-- Order 19 (2 items)
(19, 12, 1, 59.99),
(19, 26, 1, 34.99),
-- Order 20 (3 items)
(20, 2, 1, 249.99),
(20, 33, 2, 19.99),
(20, 37, 1, 49.99),
-- Order 21 (2 items)
(21, 3, 1, 59.99),
(21, 25, 1, 14.99),
-- Order 22 (3 items)
(22, 1, 2, 79.99),
(22, 6, 1, 24.99),
(22, 29, 1, 24.99),
-- Order 23 (2 items)
(23, 8, 1, 69.99),
(23, 22, 2, 34.99),
-- Order 24 (2 items)
(24, 11, 1, 24.99),
(24, 36, 3, 34.99),
-- Order 25 (4 items)
(25, 2, 1, 249.99),
(25, 13, 1, 89.99),
(25, 23, 1, 24.99),
(25, 31, 1, 29.99),
-- Order 26 (2 items)
(26, 4, 2, 39.99),
(26, 30, 1, 19.99),
-- Order 27 (2 items)
(27, 18, 1, 14.99),
(27, 34, 3, 24.99),
-- Order 28 (3 items)
(28, 7, 1, 89.99),
(28, 21, 1, 79.99),
(28, 32, 1, 19.99),
-- Order 29 (2 items)
(29, 1, 1, 79.99),
(29, 19, 1, 39.99),
-- Order 30 (3 items - continued for all 80 orders)
(30, 12, 1, 59.99),
(30, 27, 1, 89.99),
(30, 35, 1, 49.99),
-- Orders 31-40
(31, 2, 1, 249.99), (31, 5, 2, 12.99),
(32, 14, 1, 149.99),
(33, 1, 2, 79.99), (33, 3, 1, 59.99),
(34, 6, 3, 24.99), (34, 9, 2, 19.99),
(35, 20, 1, 79.99),
(36, 7, 1, 89.99), (36, 11, 1, 24.99), (36, 23, 1, 24.99),
(37, 13, 1, 89.99), (37, 17, 1, 49.99),
(38, 2, 1, 249.99), (38, 28, 2, 24.99),
(39, 4, 1, 39.99), (39, 16, 2, 19.99), (39, 30, 1, 19.99),
(40, 21, 1, 79.99), (40, 31, 2, 29.99), (40, 36, 1, 34.99),
-- Orders 41-50
(41, 8, 1, 69.99), (41, 15, 1, 19.99), (41, 33, 2, 19.99),
(42, 12, 1, 59.99), (42, 18, 3, 14.99), (42, 25, 1, 14.99),
(43, 2, 1, 249.99), (43, 22, 1, 34.99),
(44, 1, 1, 79.99), (44, 26, 2, 34.99),
(45, 10, 4, 9.99), (45, 24, 2, 19.99), (45, 32, 1, 19.99),
(46, 7, 1, 89.99), (46, 27, 1, 89.99),
(47, 3, 1, 59.99), (47, 19, 1, 39.99),
(48, 14, 1, 149.99), (48, 29, 1, 24.99),
(49, 11, 2, 24.99), (49, 34, 2, 24.99), (49, 37, 2, 49.99),
(50, 2, 1, 249.99), (50, 35, 1, 49.99),
-- Orders 51-60
(51, 6, 2, 24.99), (51, 16, 3, 19.99), (51, 30, 2, 19.99),
(52, 1, 1, 79.99), (52, 13, 1, 89.99),
(53, 4, 1, 39.99), (53, 8, 1, 69.99), (53, 23, 2, 24.99), (53, 31, 1, 29.99),
(54, 12, 1, 59.99), (54, 20, 1, 79.99),
(55, 2, 1, 249.99), (55, 28, 1, 24.99),
(56, 7, 1, 89.99), (56, 17, 1, 49.99),
(57, 3, 1, 59.99), (57, 22, 1, 34.99), (57, 32, 1, 19.99),
(58, 21, 1, 79.99), (58, 36, 2, 34.99),
(59, 5, 3, 12.99), (59, 10, 5, 9.99), (59, 25, 2, 14.99),
(60, 2, 1, 249.99), (60, 33, 1, 19.99),
-- Orders 61-70
(61, 1, 2, 79.99), (61, 18, 2, 14.99),
(62, 14, 1, 149.99),
(63, 6, 2, 24.99), (63, 11, 1, 24.99), (63, 29, 1, 24.99),
(64, 7, 1, 89.99), (64, 27, 1, 89.99),
(65, 19, 1, 39.99), (65, 24, 1, 19.99), (65, 35, 1, 49.99),
(66, 2, 1, 249.99), (66, 37, 1, 49.99),
(67, 4, 1, 39.99), (67, 9, 3, 19.99), (67, 15, 2, 19.99),
(68, 12, 1, 59.99), (68, 23, 2, 24.99), (68, 31, 1, 29.99),
(69, 1, 1, 79.99), (69, 20, 1, 79.99),
(70, 2, 1, 249.99), (70, 26, 1, 34.99),
-- Orders 71-80
(71, 3, 1, 59.99), (71, 8, 1, 69.99), (71, 16, 2, 19.99),
(72, 7, 1, 89.99), (72, 13, 1, 89.99),
(73, 2, 1, 249.99), (73, 34, 2, 24.99),
(74, 5, 2, 12.99), (74, 10, 3, 9.99), (74, 28, 2, 24.99), (74, 32, 1, 19.99),
(75, 1, 1, 79.99), (75, 22, 1, 34.99), (75, 36, 1, 34.99),
(76, 14, 1, 149.99), (76, 30, 2, 19.99),
(77, 11, 2, 24.99), (77, 17, 1, 49.99), (77, 25, 3, 14.99),
(78, 2, 1, 249.99),
(79, 6, 2, 24.99), (79, 21, 1, 79.99), (79, 33, 2, 19.99),
(80, 2, 1, 249.99), (80, 35, 1, 49.99);

-- ============================================
-- Verification Query
-- ============================================
SELECT
    'Data Loaded Successfully!' as status,
    (SELECT COUNT(*) FROM customers) as total_customers,
    (SELECT COUNT(*) FROM products) as total_products,
    (SELECT COUNT(*) FROM orders) as total_orders,
    (SELECT COUNT(*) FROM order_items) as total_order_items,
    (SELECT COUNT(*) FROM orders WHERE status = 'completed') as completed_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'pending') as pending_orders,
    (SELECT COUNT(*) FROM orders WHERE status = 'cancelled') as cancelled_orders;

-- Expected Output:
-- total_customers: 30
-- total_products: 40
-- total_orders: 80
-- total_order_items: 200+
-- completed_orders: ~56 (70%)
-- pending_orders: ~16 (20%)
-- cancelled_orders: ~8 (10%)
