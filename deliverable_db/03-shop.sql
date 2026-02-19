CREATE TABLE category (
	category_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE manufacturer (
	manufacturer_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(65) NOT NULL,
	contact_name VARCHAR(25) NOT NULL,
	contact_phone VARCHAR(25) NOT NULL,
	contact_mail VARCHAR (60) NOT NULL
);

CREATE TABLE product_description (
	product_description_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description TEXT NOT NULL,
	instructions TEXT
);

CREATE TABLE products (
        product_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        SKU VARCHAR(20) NOT NULL UNIQUE,
        name VARCHAR(50) NOT NULL,
        category_id INTEGER NOT NULL,
        manufacturer_id INTEGER NOT NULL,
	product_description_id INTEGER NOT NULL,
        FOREIGN KEY (category_id) REFERENCES category(category_id),
        FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id),
	FOREIGN KEY (product_description_id) REFERENCES product_description(product_description_id)
);

CREATE TABLE product_sizes (
        product_size_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        product_id INTEGER NOT NULL,
        size VARCHAR(20) NOT NULL,
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_colours (
        product_colour_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_id INTEGER NOT NULL,
	colour VARCHAR(50) NOT NULL,
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE product_materials (
	product_material_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_id INTEGER NOT NULL,
	material VARCHAR(50) NOT NULL,
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);
