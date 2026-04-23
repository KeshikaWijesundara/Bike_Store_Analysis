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
--Brands Table
SELECT brand_id,count(*)
FROM brands
GROUP BY brand_id
HAVING count(brand_id) >1

--Categories Table
SELECT category_id,COUNT(*)
FROM categories
GROUP BY category_id
HAVING COUNT(category_id) >1

--Customers Table
SELECT customer_id,count(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(customer_id) > 1

--Order_items Table
SELECT order_id,item_id,count(*)
FROM order_items
GROUP BY order_id,item_id
HAVING COUNT(*) > 1

--Orders Table
SELECT order_id,count(*)
FROM orders
GROUP BY order_id
HAVING COUNT(order_id) > 1

--Products Table
SELECT product_id,count(*)
FROM products
GROUP BY product_id
HAVING COUNT(product_id) > 1

--Staffs Table
SELECT staff_id,count(*)
FROM staffs
GROUP BY staff_id
HAVING COUNT(staff_id) > 1

--Stocks Table
SELECT store_id,product_id,count(*)
FROM stocks
GROUP BY store_id,product_id
HAVING COUNT(*) > 1

--Stores Table
SELECT store_id,count(*)
FROM stores
GROUP BY store_id
HAVING COUNT(store_id) > 1


-- Are there duplicate customer emails?
SELECT email,COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(email) > 1

-- Are there duplicate staff emails?
SELECT email,COUNT(*)
FROM staffs
GROUP BY email
HAVING COUNT(email) >1


-- Are any products missing prices?

-- Are any orders missing dates?

-- Are there orders without customers?

-- Are there order items without orders?

-- Are there order items without products?

-- Are there stocks linked to missing stores?

-- Are discounts outside valid range (0–1)?

SELECT * 
FROM order_items
WHERE discount < 0  and discount > 1

-- Are there negative quantities or prices?
SELECT order_id,quantity,list_price
FROM order_items
WHERE
    (quantity < 0 ) AND
    (list_price < 0)

-- Which tables need cleaning before analysis?