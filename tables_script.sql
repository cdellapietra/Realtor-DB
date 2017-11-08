-- CREATE ALL TABLES
CREATE TABLE Property (
	address VARCHAR(50) PRIMARY KEY,
	ownerName VARCHAR(30) NOT NULL,
	price INT NOT NULL
);

CREATE TABLE House (
	bedrooms INT NOT NULL,
	bathrooms INT NOT NULL,
	size INT NOT NULL,
	propertyId INT PRIMARY KEY,
	address VARCHAR(50) REFERENCES Property(address),
	ownerName VARCHAR(30) NOT NULL,
	price INT NOT NULL
);

CREATE TABLE BusinessProperty (
	type CHAR(20) NOT NULL,
	size INT NOT NULL,
	propertyID INT PRIMARY KEY,
	address VARCHAR(50) REFERENCES Property(address),
	ownerName VARCHAR(30) NOT NULL,
	price INT NOT NULL
);

CREATE TABLE Firm (
	id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL, 
	address VARCHAR(50) NOT NULL
);

CREATE TABLE Agent_Firm (
	agentId INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	phone CHAR(12),
	firmId INT REFERENCES Firm(id)
		ON DELETE CASCADE,
	dateStarted DATE NOT NULL
);

CREATE TABLE Listings (
	address VARCHAR(50) REFERENCES Property(address)
		ON DELETE CASCADE,
	agentId INT REFERENCES Agent_Firm(agentId)
		ON DELETE SET NULL,
	mlsNumber INT PRIMARY KEY,
	dateListed DATE NOT NULL
);

CREATE TABLE Buyer (
	id INT PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	phone CHAR(12),
	propertyType CHAR(20),
	bedrooms INT,
	bathrooms INT,
	businessPropertyType CHAR(20),
	minimumPreferredPrice INT,
	maximumPreferredPrice INT
);

CREATE TABLE Works_With (
	buyerId INT REFERENCES Buyer(id)
		ON DELETE CASCADE,
	agentID INT REFERENCES Agent_Firm(agentId)
		ON DELETE CASCADE
);

-- DATA POPULATION
INSERT INTO Property
VALUES('1017 Bricksquad Apt', 'Gucci Mane', 10000000),
('39 Yellowbrick Rd', 'Dorothy Gale', 100000),
('666 Hell Cir', 'Diablo, Lord of Terror', 3000000),
('007 London Dr', 'James Bond', 500000),
('1600 Pennsylvania Ave', 'Barack Obama', 300000000),
('1800 Savings Way', 'Geico Gecko', 700000),
('8 Candy Ln', 'Willy Wonka', 2000000),
('247 Wall St', 'Gordon Gekko', 40000000),
('1 Big Rm', 'Kreayshawn', 100000), 
('420 Pizza Pl', 'Papa John', 30000);

INSERT INTO House
VALUES(10, 6, 5000, 001017, '1017 Bricksquad Apt', 'Gucci Mane', 10000000),
(3, 2, 300, 001939, '39 Yellowbrick Rd', 'Dorothy Gale', 100000),
(0, 0, 15000, 000666, '666 Hell Cir', 'Diablo, Lord of Terror', 3000000),
(3, 2, 1000, 111007, '007 London Dr', 'James Bond', 500000),
(132, 35, 54900, 000001, '1600 Pennsylvania Ave', 'Barack Obama', 300000000); 

INSERT INTO BusinessProperty
VALUES('Office Space', 5000, 000015, '1800 Savings Way', 'Geico Gecko', 700000),
('Factory', 20000, 111005, '8 Candy Ln', 'Willy Wonka', 2000000),
('Office Space', 8000, 000365, '247 Wall St', 'Gordon Gekko', 40000000),
('Store', 600, 101010, '1 Big Rm', 'Kreayshawn', 100000), 
('Restaurant', 200, 111420, '420 Pizza Pl', 'Papa John', 30000);

INSERT INTO Firm
VALUES(09876, 'Honey, Im Home(owner)!', '101 Lame St'),
(45678, 'REMAX', '123 First Ave'),
(99999, 'Holy Trinity Church', '1 Heaven Way'),
(03030, 'Real Estate Bros', '2012 Jersey Shr'),
(90000, 'Sketchy Deals', '0 Luck Rd');

INSERT INTO Agent_Firm
VALUES(33445, 'Billy Mays', '888-333-7676', 45678, '2008-08-01'),
(78978, 'Dirty Mike', NULL, 90000, '2012-11-15'),
(22200, 'Martha Stewart', '305-950-5954', 09876, '2000-03-03'),
(80808, 'Sister Mary Eunice', NULL, 99999, '1999-04-09'),
(11100, 'Dwayne The Rock Johnson', NULL, 03030, '2005-05-28');

INSERT INTO Listings
VALUES('1017 Bricksquad Apt', 11100, 2323, '2013-09-21'),
('39 Yellowbrick Rd', 22200, 4949, '2014-10-20'),
('666 Hell Cir', 80808, 6677, '2015-12-25'),
('1800 Savings Way', 33445, 9870, '2015-06-10'),
('420 Pizza Pl', 33445, 5050, '2016-02-23');

INSERT INTO Buyer
VALUES(4556, 'Hermione Granger', '202-455-7889', 'House', 3, 3, NULL, 500000, 1000000),
(5992, 'Jackie Chan', NULL, 'House', 4, 3, NULL, 800000, 1500000),
(6880, 'Count Dracula', '767-859-2221', 'House', 2, 1, NULL, 100000, 200000),
(3221, 'Silly Rabbit', '565-432-8976', 'Business Property', NULL, NULL, 'Factory', 1000000, 1500000),
(7447, 'Big Mama', NULL, 'Business Property', NULL, NULL, 'Store', 300000, 500000);

INSERT INTO Works_With
VALUES(4556, 22200),
(5992, 33445),
(6880, 80808),
(3221, 11100),
(7447, 78978);