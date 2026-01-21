USE optica;

INSERT INTO supplier (name, street, number, city, zip_code, country, phone, nif) 
VALUES 
('Visió Pro Distribucions', 'Carrer de Balmes', '150', 'Barcelona', '08008', 'Spain', '934567890', 'A12345678'),
('EuroGlasses Import', 'Rua da Prata', '22', 'Lisboa', '1100-415', 'Portugal', '351213456', 'B98765432');

INSERT INTO brand (name, supplier_id) 
VALUES 
('Ray-Ban', 1),
('Oakley', 1),
('Carrera', 2);

INSERT INTO glasses (brand_id, prescription_left, prescription_right, frame_type, frame_color, glass_color_left, glass_color_right, price) 
VALUES 
(1, 1.25, 1.50, 'acetate', 'Black', 'Green', 'Green', 145.50),
(2, 0.00, 0.00, 'metallic', 'Silver', 'Blue', 'Blue', 180.00),
(3, 2.00, 2.25, 'rimless', 'Gold', 'Transparent', 'Transparent', 210.00);

INSERT INTO employee (name) 
VALUES 
('Laura Soler'),
('Marc Ripoll');

INSERT INTO customer (name, address, phone, email, registration_date, recommended_by_id) 
VALUES 
('Joan García', 'Av. Gaudí 10, 2-1', '600111222', 'joan@email.com', '2023-01-15', NULL);

INSERT INTO customer (name, address, phone, email, registration_date, recommended_by_id) 
VALUES 
('Marta Roure', 'Carrer Gran 5', '655444333', 'marta@email.com', '2023-05-20', 1);

INSERT INTO sale (customer_id, employee_id, glasses_id, sale_date) 
VALUES 
(1, 1, 1, '2023-10-05 11:30:00'),
(2, 2, 3, '2023-11-12 17:45:00');