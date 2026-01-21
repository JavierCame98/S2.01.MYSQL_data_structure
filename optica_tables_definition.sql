USE optica;

CREATE TABLE supplier (
  supplier_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  street VARCHAR(100) DEFAULT NULL,
  number VARCHAR(10) DEFAULT NULL,
  floor VARCHAR(10) DEFAULT NULL,
  door VARCHAR(10) DEFAULT NULL,
  city VARCHAR(50) DEFAULT NULL,
  zip_code VARCHAR(10) DEFAULT NULL,
  country VARCHAR(50) DEFAULT NULL,
  phone VARCHAR(20) DEFAULT NULL,
  fax VARCHAR(20) DEFAULT NULL,
  nif VARCHAR(20) NOT NULL,
  PRIMARY KEY (supplier_id)
);

CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT fk_brand_supplier FOREIGN KEY (supplier_id) 
        REFERENCES supplier(supplier_id)
);

CREATE TABLE glasses (
    glasses_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    prescription_left DECIMAL(4,2),
    prescription_right DECIMAL(4,2),
    frame_type ENUM('rimless', 'acetate', 'metallic') NOT NULL,
    frame_color VARCHAR(30),
    glass_color_left VARCHAR(30),
    glass_color_right VARCHAR(30),
    price DECIMAL(8,2) NOT NULL,
    CONSTRAINT fk_glasses_brand FOREIGN KEY (brand_id) 
        REFERENCES brand(brand_id)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(150),
    phone VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE NOT NULL,
    recommended_by_id INT,
    CONSTRAINT fk_customer_recommendation FOREIGN KEY (recommended_by_id) 
        REFERENCES customer(customer_id)
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE sale (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    glasses_id INT NOT NULL,
    sale_date DATETIME NOT NULL,
    CONSTRAINT fk_sale_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_sale_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    CONSTRAINT fk_sale_glasses FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id)
);


