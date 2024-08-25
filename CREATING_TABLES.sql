CREATE DATABASE PharmacyManagement;
USE PharmacyManagement;

CREATE TABLE Pharmacy (
    pharmacy_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    medicine_name VARCHAR(100) NOT NULL,
    category_id INT,
    manufacturer_id INT,
    expiry_date DATE,
    price DECIMAL(10, 2),
    quantity_in_stock INT,
    FOREIGN KEY (category_id) REFERENCES MedicineCategory(category_id),
    FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id)
);


CREATE TABLE MedicineCategory (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE Manufacturer (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    doctor_name VARCHAR(100),
    prescription_date DATE,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status ENUM('Pending', 'Completed', 'Cancelled'),
    delivery_status ENUM('Pending', 'Delivered', 'Cancelled'),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderDetails (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    medicine_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE SupplyOrder (
    supply_order_id INT PRIMARY KEY AUTO_INCREMENT,
    pharmacy_id INT,
    supplier_id INT,
    order_date DATE,
    total_cost DECIMAL(10, 2),
    delivery_date DATE,
    status ENUM('Pending', 'Completed', 'Cancelled'),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE SupplyOrderDetails (
    supply_order_id INT,
    medicine_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (supply_order_id, medicine_id),
    FOREIGN KEY (supply_order_id) REFERENCES SupplyOrder(supply_order_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

CREATE TABLE PharmacyInventory (
    pharmacy_id INT,
    medicine_id INT,
    stock_quantity INT,
    PRIMARY KEY (pharmacy_id, medicine_id),
    FOREIGN KEY (pharmacy_id) REFERENCES Pharmacy(pharmacy_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);

CREATE TABLE PrescriptionDetails (
    prescription_id INT,
    medicine_id INT,
    dosage VARCHAR(100),
    duration VARCHAR(50),
    PRIMARY KEY (prescription_id, medicine_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescription(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id)
);



