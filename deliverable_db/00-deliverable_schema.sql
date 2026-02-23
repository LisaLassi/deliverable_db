DROP SCHEMA IF EXISTS deliverable_database;
CREATE SCHEMA deliverable_database;
USE deliverable_database;

CREATE TABLE users (
	users_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(45) NOT NULL UNIQUE,
	password VARCHAR(85) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	email_confirmation BOOLEAN DEFAULT FALSE
);

CREATE TABLE user_address (
	user_address_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INTEGER NOT NULL,
	street VARCHAR (100),
	zip_code VARCHAR (25),
	city VARCHAR(100),
	address_type TINYINT,
	FOREIGN KEY (user_id) REFERENCES users(users_id)
);

CREATE TABLE order_information (
	order_information_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	billing_address INTEGER NOT NULL,
	delivery_address INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	FOREIGN KEY (billing_address) REFERENCES user_address(user_address_id),
	FOREIGN KEY (delivery_address) REFERENCES user_address(user_address_id),
	FOREIGN KEY (user_id) REFERENCES users(users_id)
);


CREATE TABLE species (
	species_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE species_names (
	species_name_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(80),
	is_latin BOOLEAN DEFAULT FALSE,
	species_id INTEGER,
	FOREIGN KEY (species_id) REFERENCES species(species_id)
);


CREATE TABLE pets (
	pets_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE,
	description TEXT,
	alive BOOLEAN DEFAULT TRUE,
	species_id INTEGER,
	FOREIGN KEY (species_id) REFERENCES species(species_id)
);

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

CREATE TABLE warehouses (
	warehouse_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(25) NOT NULL
);

CREATE TABLE inventory (
	inventory_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	warehouse_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL DEFAULT 0 CHECK (quantity >= 0),
	UNIQUE (warehouse_id, product_id),
	FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE order_status (
	order_status_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	status_name VARCHAR(30) NOT NULL
);

CREATE TABLE orders (
	order_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INTEGER NOT NULL,
	order_status_id INTEGER NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	warehouse_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
	FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

CREATE TABLE order_items (
	order_item_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL CHECK (quantity > 0),
	price_at_purchase DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE messages (
	messages_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	sender_id INTEGER NOT NULL,
	receiver_id INTEGER NOT NULL,
	content VARCHAR (250),
	date_and_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	parent_id INTEGER NULL,
	FOREIGN KEY (sender_id) REFERENCES users(users_id) ON DELETE CASCADE,
	FOREIGN KEY (receiver_id) REFERENCES users(users_id) ON DELETE CASCADE,
	FOREIGN KEY (parent_id) REFERENCES messages(messages_id) ON DELETE CASCADE
);

