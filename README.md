
# Pharmacy Management System

## Overview

The Pharmacy Management System is a comprehensive database management solution designed to streamline and manage various pharmacy operations. This system handles medicine tracking, inventory management, customer orders, prescriptions, and supplier information. It provides efficient data storage, retrieval, and management through a structured database design.


![alttext](https://github.com/Saichandu19/PHARMACY-MANAGEMENT-SYSTEM-DBMS/blob/main/Relation%20Schema.png?raw=true).

![alttext](https://github.com/Saichandu19/PHARMACY-MANAGEMENT-SYSTEM-DBMS/blob/main/pharmacy.drawio%20(3).png?raw=true).



## Table of Contents

- [Requirements Analysis](#requirements-analysis)
- [ER Diagram](#er-diagram)
- [Normalization](#normalization)
- [SQL Table Creation](#sql-table-creation)
- [Data Insertion](#data-insertion)
- [SQL Queries for Data Analysis](#sql-queries-for-data-analysis)
- [Conclusion](#conclusion)

## Requirements Analysis

**Objective:** Create a system to manage the pharmacy's daily operations, including accurate data storage, retrieval, and management.

**Key Functions:**
- Manage medicines
- Track inventory
- Process customer orders and prescriptions
- Handle supplier information
- Generate relevant reports

## ER Diagram

### Entities and Attributes

1. **Pharmacy**
   - `pharmacy_id` (Primary Key)
   - `pharmacy_name`
   - `address`
   - `contact_number`
   - `email`

2. **Medicine**
   - `medicine_id` (Primary Key)
   - `medicine_name`
   - `category_id` (Foreign Key)
   - `manufacturer_id` (Foreign Key)
   - `expiry_date`
   - `price`
   - `quantity_in_stock`

3. **MedicineCategory**
   - `category_id` (Primary Key)
   - `category_name`
   - `description`

4. **Manufacturer**
   - `manufacturer_id` (Primary Key)
   - `manufacturer_name`
   - `contact_number`
   - `email`
   - `address`

5. **Customer**
   - `customer_id` (Primary Key)
   - `first_name`
   - `last_name`
   - `address`
   - `contact_number`
   - `email`

6. **Prescription**
   - `prescription_id` (Primary Key)
   - `customer_id` (Foreign Key)
   - `doctor_name`
   - `prescription_date`
   - `notes`

7. **Order**
   - `order_id` (Primary Key)
   - `customer_id` (Foreign Key)
   - `order_date`
   - `total_amount`
   - `payment_status`
   - `delivery_status`

8. **OrderDetails**
   - `order_details_id` (Primary Key)
   - `order_id` (Foreign Key)
   - `medicine_id` (Foreign Key)
   - `quantity`
   - `price_per_unit`
   - `total_price`

9. **Supplier**
   - `supplier_id` (Primary Key)
   - `supplier_name`
   - `contact_number`
   - `email`
   - `address`

10. **SupplyOrder**
    - `supply_order_id` (Primary Key)
    - `pharmacy_id` (Foreign Key)
    - `supplier_id` (Foreign Key)
    - `order_date`
    - `total_cost`
    - `delivery_date`
    - `status`

11. **SupplyOrderDetails**
    - `supply_order_id` (Foreign Key)
    - `medicine_id` (Foreign Key)
    - `quantity`
    - `price`

12. **PharmacyInventory**
    - `pharmacy_id` (Foreign Key)
    - `medicine_id` (Foreign Key)
    - `stock_quantity`

13. **PrescriptionDetails**
    - `prescription_id` (Foreign Key)
    - `medicine_id` (Foreign Key)
    - `dosage`
    - `duration`

### Relationships

1. **Pharmacy - SupplyOrder**
   - **Relationship Name:** "Places"
   - **Cardinality:** One-to-Many

2. **SupplyOrder - Supplier**
   - **Relationship Name:** "SuppliedBy"
   - **Cardinality:** Many-to-One

3. **SupplyOrder - SupplyOrderDetails**
   - **Relationship Name:** "Contains"
   - **Cardinality:** One-to-Many

4. **SupplyOrderDetails - Medicine**
   - **Relationship Name:** "Includes"
   - **Cardinality:** Many-to-One

5. **Pharmacy - PharmacyInventory**
   - **Relationship Name:** "Stocks"
   - **Cardinality:** One-to-Many

6. **PharmacyInventory - Medicine**
   - **Relationship Name:** "Contains"
   - **Cardinality:** Many-to-One

7. **Prescription - Customer**
   - **Relationship Name:** "IssuedTo"
   - **Cardinality:** Many-to-One

8. **Prescription - PrescriptionDetails**
   - **Relationship Name:** "Contains"
   - **Cardinality:** One-to-Many

9. **PrescriptionDetails - Medicine**
   - **Relationship Name:** "Includes"
   - **Cardinality:** Many-to-One

10. **Order - Customer**
    - **Relationship Name:** "PlacedBy"
    - **Cardinality:** Many-to-One

11. **Order - OrderDetails**
    - **Relationship Name:** "Contains"
    - **Cardinality:** One-to-Many

12. **OrderDetails - Medicine**
    - **Relationship Name:** "Includes"
    - **Cardinality:** Many-to-One

## Normalization

**First Normal Form (1NF):**
- Ensured atomic values with no repeating groups. Split composite attributes into separate tables.

**Second Normal Form (2NF):**
- Removed partial dependencies. Created separate tables for categories and manufacturers.

**Third Normal Form (3NF):**
- Removed transitive dependencies. Separated non-key attributes into their own tables.

### Example of Normalization

**Before Normalization:**

A single table may contain redundant information such as category and manufacturer details.

**After Normalization:**

- **Medicine Table:**
  - `medicine_id`
  - `medicine_name`
  - `category_id` (Foreign Key)
  - `manufacturer_id` (Foreign Key)
  - `expiry_date`
  - `price`
  - `quantity_in_stock`

- **MedicineCategory Table:**
  - `category_id`
  - `category_name`
  - `description`

- **Manufacturer Table:**
  - `manufacturer_id`
  - `manufacturer_name`
  - `contact_number`
  - `email`
  - `address`

## SQL Table Creation

The following tables were created using MySQL:
- **Pharmacy**
- **Medicine**
- **MedicineCategory**
- **Manufacturer**
- **Customer**
- **Prescription**
- **Order**
- **OrderDetails**
- **Supplier**
- **SupplyOrder**
- **SupplyOrderDetails**
- **PharmacyInventory**
- **PrescriptionDetails**

Constraints were defined to maintain data integrity and enforce relationships.

## Data Insertion

Sample data was inserted into each table to ensure relational requirements were met:
- **Medicine Table:** Details of various medicines.
- **Order Table:** Customer orders linked to specific medicines.
- **PharmacyInventory:** Stock levels of medicines in the pharmacy.

## SQL Queries for Data Analysis

Developed SQL queries to analyze data:
- Retrieve all orders placed by a specific customer.
- Find all medicines supplied by a particular supplier.
- Track inventory levels to identify medicines that need reordering.

**Example Queries:**
```sql
-- Retrieve all orders placed by a specific customer
SELECT * FROM `Order` WHERE customer_id = 1;

-- Find all medicines supplied by a particular supplier
SELECT m.medicine_name
FROM SupplyOrderDetails sod
JOIN Medicine m ON sod.medicine_id = m.medicine_id
WHERE sod.supply_order_id IN (
    SELECT supply_order_id FROM SupplyOrder WHERE supplier_id = 1
);

-- Track inventory levels
SELECT p.pharmacy_name, m.medicine_name, pi.stock_quantity
FROM PharmacyInventory pi
JOIN Pharmacy p ON pi.pharmacy_id = p.pharmacy_id
JOIN Medicine m ON pi.medicine_id = m.medicine_id;

