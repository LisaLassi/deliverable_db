CREATE TABLE warehouses (
	warehouse_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	city VARCHAR(25) NOT NULL
);

CREATE TABLE inventory (
	inventory_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	warehouse_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL DEFAULT 0 CHECK (quantity >= 0),
	UNIQUE (warehouse_id, product_id),                                     -- Detta för att samma produkt ska inte kunna finnas två gånger i samma warehouse
	FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);
