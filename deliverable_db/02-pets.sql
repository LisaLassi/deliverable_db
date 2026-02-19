-- Självaste arten. Skapar en "behållare" för arter
CREATE TABLE species (
	species_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY
);

-- Vad vi kallar arten. Skapar en tabell som innehåller alla namn som pekar på "behållaren"
CREATE TABLE species_names (
	species_name_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(80),
	is_latin BOOLEAN DEFAULT FALSE,
	species_id INTEGER,
	FOREIGN KEY (species_id) REFERENCES species(species_id)
);

-- Skapar samlingsinformationen om djuret
CREATE TABLE pets (
	pets_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE,
	description TEXT,
	alive BOOLEAN DEFAULT TRUE,
	species_id INTEGER,
	FOREIGN KEY (species_id) REFERENCES species(species_id)
);

-- Separerar species_id och species_name för att kunna lägga till flera
-- olika namn/ etiketter som pekar på en o samma art.

-- Om jag har common_name och latin_name direkt i species-tabellen så kan
-- jag bara lagra ett av varje namn per ID. Skulle då behöva skapa tre rader
-- i species-tabellen (sv, eng, lat), och då skulle dessa tre namn för samma 
-- djur art få tre olika ID-nummer och räknas som tre olika arter.


