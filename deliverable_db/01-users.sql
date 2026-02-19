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


