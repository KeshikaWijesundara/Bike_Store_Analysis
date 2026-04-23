-- 1.How many rows exist in each table?
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


-- 2.Are there duplicate primary keys in any table?
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


-- 3.Are there duplicate customer emails?
SELECT email,COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(email) > 1

-- 4.Are there duplicate staff emails?
SELECT email,COUNT(*)
FROM staffs
GROUP BY email
HAVING COUNT(email) >1

-- 5.Are any products missing prices?
SELECT * 
FROM products
WHERE list_price IS NULL

-- 6.Are any orders missing dates?
-- missing order creation date(critical)
SELECT *
FROM orders
WHERE order_date IS NULL;

-- missing requested date(Optional)
SELECT *
FROM orders
WHERE required_date IS NULL;

-- 7.Are there orders without customers?
SELECT *
FROM orders LEFT JOIN customers
    ON orders.customer_id  = customers.customer_id
WHERE customers.customer_id IS NULL

-- 8.Are there order items without orders?
SELECT *
FROM order_items LEFT JOIN orders
    ON order_items.order_id  = orders.order_id
WHERE orders.order_id IS NULL

-- 9.Are there order items without products?
SELECT *
FROM order_items LEFT JOIN products
    ON order_items.product_id  = products.product_id
WHERE products.product_id IS NULL

-- 10.Are there stocks linked to missing stores?
SELECT stocks.* 
FROM stocks LEFT join stores 
    ON stocks.store_id  = stores.store_id
WHERE stocks.store_id IS  NULL

-- 11.Are discounts outside valid range (0–1)?
SELECT * 
FROM order_items
WHERE discount < 0  and discount > 1

-- 12.Are there negative quantities or prices?
SELECT order_id, quantity, list_price
FROM order_items
WHERE quantity < 0
  AND list_price < 0;


/*

FINAL SUMMARY

After running all data quality checks on the retail database, the following observations were made,

        - All tables contain data and are properly populated.
        - No duplicate primary keys were found in any table.
        - Customer and staff emails are unique with no duplicates.
        - No missing product prices were detected.
        - All orders have valid order dates and required dates.
        - No missing relationships were found between tables(customers, orders, order_items, products, and stores).
        - No invalid values were found in quantities, prices, or discounts.

Overall, the dataset is clean and consistent and is ready for further analysis and reporting.

*/
