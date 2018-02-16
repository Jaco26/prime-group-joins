-- 1: Get all customers and their addresses
SELECT * FROM customers 
JOIN addresses on customers.id = addresses.customer_id;

-- 2: Get all orders and their line items
SELECT * FROM orders 
JOIN line_items on orders.id = line_items.order_id;

-- 3: Which warehouses have cheetos?
SELECT * FROM warehouse 
JOIN warehouse_product on warehouse.id = warehouse_product.warehouse_id
JOIN products on product_id = products.id WHERE product_id = 5;

-- 4: Which warehouses have pepsi?
SELECT * FROM warehouse
JOIN warehouse_product as wp on warehouse.id = wp.warehouse_id
JOIN products on product_id = products.id WHERE product_id = 6;

-- 5: Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in the results
SELECT customers.first_name, COUNT(customers.id)  FROM customers
JOIN addresses on customers.id = addresses.customer_id
JOIN orders on orders.address_id = addresses.id
GROUP BY customers.first_name;

-- 6: How many customers do we have?
SELECT DISTINCT(COUNT(id)) FROM customers;

-- 7: How many products do we carry?
SELECT COUNT(*) FROM products;

-- 8: What is the total available on-hand quantity of diet pepsi?
SELECT products.description, SUM(on_hand) FROM warehouse_product as whp
JOIN products on products.id = whp.product_id WHERE products.description='diet pepsi'
GROUP BY products.description;

