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
	order_information_id INTEGER NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
	FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
	FOREIGN KEY (order_information_id) REFERENCES order_information(order_information_id)
);

CREATE TABLE order_items (
	order_item_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	quantity INTEGER NOT NULL CHECK (quantity > 0),                          -- Extra skydd som checkar att antalet inte kan vara mindre än 0	
	price_at_purchase DECIMAL(10,2) NOT NULL,                                 -- Ifall priset ändras så ska inte äldre ordrar påverkas
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);
