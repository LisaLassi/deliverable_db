CREATE TABLE category (
	category_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);


CREATE TABLE manifacturer (
	manifacturer_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	address VARCHAR(65) NOT NULL,
	contact_name VARCHAR(25) NOT NULL,
	contact_phone VARCHAR(25) NOT NULL,
	contact_mail VARCHAR (60) NOT NULL
);


CREATE TABLE products (
        products_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
        SKU VARCHAR(20) NOT NULL UNIQUE,
        name VARCHAR(50) NOT NULL,
        description TEXT NOT NULL,
        categories_id INTEGER,
        manifacturer_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES category(category_id),
        FOREIGN KEY (manifacturer_id) REFERENCES manifacturer(manifacturer_id)
);
