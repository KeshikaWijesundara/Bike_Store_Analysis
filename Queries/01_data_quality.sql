-- How many rows exist in each table?
SELECT 'brands' AS table_name,COUNT(*) AS row_count FROM brands
UNION ALL
SELECT 'categories' AS tale_name,COUNT(*) AS row_count FROM categories
UNION ALL
SELECT 'customers' AS table_name,COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'order_items' AS tale_name,COUNT(*) AS row_count FROM order_items
UNION ALL
SELECT 'orders' AS tale_name,COUNT(*) AS row_count FROM orders
UNION ALL
SELECT 'products' AS tale_name,COUNT(*) AS row_count FROM products
UNION ALL
SELECT 'staffs' AS tale_name,COUNT(*) AS row_count FROM staffs
UNION ALL
SELECT 'stocks' AS tale_name,COUNT(*) AS row_count FROM stocks
UNION ALL
SELECT 'stores' AS tale_name,COUNT(*) AS row_count FROM stores


-- Are there duplicate primary keys in any table?

-- Are there duplicate customer emails?

-- Are there duplicate staff emails?

-- Which tables contain null values in important columns?

-- Are any products missing prices?

-- Are any orders missing dates?

-- Are there orders without customers?

-- Are there order items without orders?

-- Are there order items without products?

-- Are there stocks linked to missing stores?

-- Are discounts outside valid range (0–1)?

-- Are there negative quantities or prices?

-- Which tables need cleaning before analysis?