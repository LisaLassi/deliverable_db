CREATE TABLE messages (
	messages_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,                      -- unikt ID för varje meddelande
	sender_id INTEGER NOT NULL,                                                   -- foreign key till users
	receiver_id INTEGER NOT NULL,                                                 -- foreign key till users
	content VARCHAR (250),                                                        -- meddelandet
	date_and_time DATETIME DEFAULT CURRENT_TIMESTAMP,                             -- datum & tid för meddelandet
	parent_id INTEGER NULL,                                                       -- foreign key till messages_id på meddelande som detta svarar på, NULL om det är en ny tråd
	FOREIGN KEY (sender_id) REFERENCES users(users_id) ON DELETE CASCADE,         -- om en användare raderas, raderas alla deras meddelanden dom skickat
	FOREIGN KEY (receiver_id) REFERENCES users(users_id) ON DELETE CASCADE,       -- om en användare raderas, raderas alla meddelandet dom tagit emot
	FOREIGN KEY (parent_id) REFERENCES messages(messages_id) ON DELETE CASCADE    -- om ett första meddelande (ursprungsmeddelande, startet på konverationen) raderas, raderas alla svar (tråden) automatiskt
);


-- Sparar bara IDs för sender och receiver
-- Använder users-tabellen för att få ut namn, email osv istället för att duplicera datan igen, återanvänder istället.
-- parent_id satt till NULL för att OM det är en ny "tråd" av meddelanden som skapas så är parent_id = NULL 
-- OM meddelandet är svar på ett tidigare meddelande så är parent_id = messages_id


-- Test data
-- Ny tråd från Alice till Bob
INSERT INTO messages (sender_id, receiver_id, content, parent_id)
VALUES (1, 2, 'Hej Bob! Hur mår du?', NULL); -- parent_id = NULL -> ny tråd

-- Svar från Bob till Alice
INSERT INTO messages (sender_id, receiver_id, content, parent_id)
VALUES (2, 1, 'Hej Alice! Jag mår bra, tack. Hur är det själv?', 1); -- parent_id = 1 -> svar på första meddelandet

-- Svar från Alice på Bobs svar
INSERT INTO messages (sender_id, receiver_id, content, parent_id)
VALUES (1, 2, 'Jag mår också bra, tack!', 2); -- parent_id = 2 -> svar på Bobs meddelande

-- Ny tråd från Carol till Alice
INSERT INTO messages (sender_id, receiver_id, content, parent_id)
VALUES (3, 1, 'Hej Alice, kan du kolla dokumentet jag skickade?', NULL); -- ny tråd

-- Svar från Alice till Carol
INSERT INTO messages (sender_id, receiver_id, content, parent_id)
VALUES (1, 3, 'Självklart, jag tittar på det snart.', 4); -- svar på Carols meddelande (id=4)


