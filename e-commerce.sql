-- Brand table
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Product Category table
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id INT NULL,
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

-- Size table
CREATE TABLE size (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    category VARCHAR(50) -- e.g., 'clothing', 'shoes'
);

-- Color table
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

-- Product table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Product Image table
CREATE TABLE product_image (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

-- Product Item table (SKUs with variations)
CREATE TABLE product_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    size_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
    FOREIGN KEY (size_id) REFERENCES size(id),
    FOREIGN KEY (color_id) REFERENCES color(id)
);

-- Product Attribute table
CREATE TABLE product_attribute (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE
);

-- Sample Data Insertion
INSERT INTO brand (name, description) VALUES 
('Nike', 'Athletic apparel and footwear'),
('Apple', 'Consumer electronics');

INSERT INTO category (name, parent_id) VALUES 
('Electronics', NULL),
('Smartphones', 1),
('Clothing', NULL),
('Shoes', 3);

INSERT INTO size (name, category) VALUES 
('S', 'Clothing'), ('M', 'Clothing'), ('L', 'Clothing'),
('8', 'Shoes'), ('9', 'Shoes'), ('10', 'Shoes');

INSERT INTO color (name, hex_code) VALUES 
('Red', '#FF0000'), ('Blue', '#0000FF'), ('Black', '#000000');

INSERT INTO product (name, brand_id, category_id, description, price) VALUES 
('iPhone 15', 2, 2, 'Latest Apple smartphone', 999.00),
('Air Max', 1, 4, 'Running shoes', 120.00);

INSERT INTO product_image (product_id, url, is_primary) VALUES 
(1, 'https://example.com/iphone1.jpg', TRUE),
(1, 'https://example.com/iphone2.jpg', FALSE),
(2, 'https://example.com/shoe1.jpg', TRUE);

INSERT INTO product_item (product_id, sku, price, stock, size_id, color_id) VALUES 
(1, 'IPH15-BLK-128', 999.00, 100, NULL, 3),
(2, 'AIRMAX-BLK-9', 120.00, 50, 5, 3),
(2, 'AIRMAX-RED-10', 120.00, 30, 6, 1);

INSERT INTO product_attribute (product_id, name, value) VALUES 
(1, 'Storage', '128GB'),
(1, 'Color', 'Black'),
(2, 'Material', 'Mesh and rubber');