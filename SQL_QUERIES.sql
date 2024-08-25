use pharmacymanagement;

-- 1. Total Sales by Medicine
SELECT m.medicine_name, SUM(od.total_price) AS total_sales
FROM OrderDetails od
JOIN Medicine m ON od.medicine_id = m.medicine_id
GROUP BY m.medicine_name
ORDER BY total_sales DESC;

-- 2. Total Inventory Stock by Pharmacy
SELECT p.pharmacy_name, SUM(pi.stock_quantity) AS total_stock
FROM PharmacyInventory pi
JOIN Pharmacy p ON pi.pharmacy_id = p.pharmacy_id
GROUP BY p.pharmacy_name
ORDER BY total_stock DESC;

-- 3. Number of Orders by Customer
SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM `Order` o
JOIN Customer c ON o.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_orders DESC;

-- 4. Medicines Supplied by Each Supplier
SELECT s.supplier_name, m.medicine_name, sod.quantity
FROM SupplyOrderDetails sod
JOIN Supplier s ON sod.supply_order_id = s.supplier_id
JOIN Medicine m ON sod.medicine_id = m.medicine_id;

-- 5. Total Cost of Supply Orders
SELECT supply_order_id, order_date, total_cost
FROM SupplyOrder
ORDER BY total_cost DESC;

-- 6. Prescription Details by Patient
SELECT c.first_name, c.last_name, p.prescription_date, m.medicine_name, pd.dosage, pd.duration
FROM PrescriptionDetails pd
JOIN Prescription p ON pd.prescription_id = p.prescription_id
JOIN Customer c ON p.customer_id = c.customer_id
JOIN Medicine m ON pd.medicine_id = m.medicine_id;

-- 7. Order Status Distribution
SELECT payment_status, COUNT(order_id) AS order_count
FROM `Order`
GROUP BY payment_status;

-- 8. Medicines by Category
SELECT mc.category_name, m.medicine_name, m.price
FROM Medicine m
JOIN MedicineCategory mc ON m.category_id = mc.category_id;

-- 9. Total Cost of Orders per Customer
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM `Order` o
JOIN Customer c ON o.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 10. Average Quantity of Medicines in Supply Orders
SELECT AVG(quantity) AS average_quantity
FROM SupplyOrderDetails;

-- 11. Total Number of Medicines per Supplier
SELECT s.supplier_name, COUNT(sod.medicine_id) AS total_medicines
FROM SupplyOrderDetails sod
JOIN Supplier s ON sod.supply_order_id = s.supplier_id
GROUP BY s.supplier_name;

-- 12. Medicine Stock Levels Below Threshold
SELECT p.pharmacy_name, m.medicine_name, pi.stock_quantity
FROM PharmacyInventory pi
JOIN Pharmacy p ON pi.pharmacy_id = p.pharmacy_id
JOIN Medicine m ON pi.medicine_id = m.medicine_id
WHERE pi.stock_quantity < 50;

