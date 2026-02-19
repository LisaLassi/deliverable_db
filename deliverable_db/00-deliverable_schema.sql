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


