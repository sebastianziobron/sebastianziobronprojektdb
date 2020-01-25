CREATE DATABASE Project;
use Project;
CREATE TABLE Restaurants (
	Id					INTEGER PRIMARY KEY IDENTITY(1,1),
	Id_type_restaurant	integer not null,
	Id_user				integer not null,
	Id_city				integer not null,
	Name				varchar(255) not null,
	Email				varchar(255) not null,
	Address				varchar(60)not null,
	Active				bit,
)

CREATE TABLE Users (

	Id						INTEGER PRIMARY KEY identity(1,1),
	Id_role					INTEGER not null,
	Password				varchar(255) not null,
	Confirmation_joined		varchar(255) not null,
	Time_joined				datetime not null,
	Name					varchar(60) not null,
	Surname					varchar(60) null,
	Email					varchar(60) not null,
	Phone					varchar(60) not null
)

CREATE TABLE Roles (
	Id			INTEGER PRIMARY KEY IDENTITY(1,1),
	Name		varchar(60) not null,
)

CREATE TABLE Type_restaurant (
	Id			integer primary key identity(1,1),
	Name		varchar(60) not null
)

CREATE TABLE Orders (
	Id					integer primary key identity(1,1),
	Id_user				integer not null,
	Id_restaurant		integer not null,
	Id_status			integer not null,
	Data				date null,
	Total_price			decimal(12,2) null,
	Preparation_time	time null,
	Comment				text null
)

CREATE TABLE Comment (
	Id integer primary key IDENTITY(1,1),
	Id_user  integer not null,
	Id_restaurant  integer not null,
	Description text null,
	Data date,
)

CREATE TABLE Item_order (
	Id			integer primary key identity(1,1),
	Id_food		integer not null,
	Id_order	integer not null,
	Quantity	integer not null
)

CREATE TABLE food (
	Id				integer primary key identity(1,1),
	id_restaurant	integer not null,
	Name			varchar(60) not null,
	Description		text not null,
	Price			decimal(12,2) not null,
	Id_category		integer not null,
	active			bit
)

CREATE TABLE City (
	Id			integer primary key identity(1,1),
	Name		varchar(60),
	Zip_code	varchar(16),
)

CREATE TABLE Category_food (
	Id		integer primary key identity(1,1),
	Name	varchar(60)
)


CREATE TABLE Status_order (
	Id		integer primary key identity(1,1),
	Name	varchar(60)
)


ALTER TABLE Restaurants ADD FOREIGN KEY (Id_type_restaurant) REFERENCES Type_restaurant(Id);
ALTER TABLE Restaurants ADD FOREIGN KEY (Id_user) REFERENCES Users(Id);
ALTER TABLE Restaurants ADD FOREIGN KEY (Id_city) REFERENCES City(Id);

ALTER TABLE Users ADD FOREIGN KEY (Id_role) REFERENCES Roles(Id);

ALTER TABLE Orders ADD FOREIGN KEY (Id_user) REFERENCES Users(Id);
ALTER TABLE Orders ADD FOREIGN KEY (Id_restaurant) REFERENCES Restaurants(Id);
ALTER TABLE Orders ADD FOREIGN KEY (Id_status) REFERENCES Status_order(Id);

ALTER TABLE Comment ADD FOREIGN KEY (Id_user) REFERENCES Users(Id);
ALTER TABLE Comment ADD FOREIGN KEY (Id_restaurant) REFERENCES Restaurants(Id);

ALTER TABLE Item_order ADD FOREIGN KEY (Id_food) REFERENCES Food(Id);
ALTER TABLE Item_order ADD FOREIGN KEY (Id_order) REFERENCES Orders(Id);

ALTER TABLE Food ADD FOREIGN KEY (Id_restaurant) REFERENCES Restaurants(Id);
ALTER TABLE Food ADD FOREIGN KEY (Id_category) REFERENCES Category_food(Id);

INSERT INTO Roles VALUES ('Admin');
INSERT INTO Roles VALUES ('Customer');
INSERT INTO Roles VALUES ('employee');

INSERT INTO Users VALUES (1, '54jhsk@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Jan', 'Kowalski', 'Jan.k@gmail.com','555666777');
INSERT INTO Users VALUES (2, 'sdfaw2@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Tomasz', 'Nowak', 'Tomasz.N@gmail.com','906723666');
INSERT INTO Users VALUES (3, '1qazxsW@', '1231432123123534', convert(datetime,'18-06-19 10:34:09 PM',5),'Marek', 'Grzybowski', 'Mark.k@gmail.com','659217453');
INSERT INTO Users VALUES (2, 'fhk#@1w', '1231432123123534', convert(datetime,'18-05-15 09:34:09 PM',5),'Dawid', 'Kowalski', 'Dawid.k@gmail.com','256345607');
INSERT INTO Users VALUES (2, 'djfhsdj64@', '1231432123123534', convert(datetime,'03-01-15 10:34:09 PM',5),'Kamil', 'Szybki', 'Kamil.N@gmail.com','999045783');
INSERT INTO Users VALUES (2, 'jshfs623@', '1231432123123534', convert(datetime,'15-07-17 10:34:09 PM',5),'Magda', 'Milec', 'Magda.k@gmail.com','413678456');
INSERT INTO Users VALUES (3, 'sdadas@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Jan', 'Kowalski', 'Jan.k@gmail.com','555666777');
INSERT INTO Users VALUES (2, 'hkli435@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Tomasz', 'Nowak', 'Tomasz.N@gmail.com','555666777');
INSERT INTO Users VALUES (3, '1qazxkgjdflgsW@', '1231432123123534', convert(datetime,'22-05-16 10:34:09 PM',5),'Marek', 'Grzybowski', 'Mark.k@gmail.com','555666777');
INSERT INTO Users VALUES (2, '3875kjkxv@', '1231432123123534', convert(datetime,'18-06-16 10:34:09 PM',5),'Kamila', 'Kowalski', 'Kamila.k@gmail.com','555666777');
INSERT INTO Users VALUES (2, 'jfdkgh4@', '1231432123123534', convert(datetime,'12-07-19 10:34:09 PM',5),'Damian', 'Nowak', 'Damian.N@gmail.com','555666777');
INSERT INTO Users VALUES (3, 'jshhjk3@', '1231432123123534', convert(datetime,'18-02-19 10:34:09 PM',5),'Łukasz', 'Mikos', 'luki.k@gmail.com','555666777');

SELECT * FROM Users;

INSERT INTO Type_restaurant VALUES ('Azjatycka');
INSERT INTO Type_restaurant VALUES ('Polska');
INSERT INTO Type_restaurant VALUES ('Włoska');
INSERT INTO Type_restaurant VALUES ('Indyjska');
INSERT INTO Type_restaurant VALUES ('Turecka');
INSERT INTO Type_restaurant VALUES ('Fastfood');

SELECT * FROM Type_restaurant;


INSERT INTO City VALUES ('Dębica','34123');
INSERT INTO City VALUES ('Rzeszów','31231');
INSERT INTO City VALUES ('Tarnów','12312');
INSERT INTO City VALUES ('Kraków','312231');
INSERT INTO City VALUES ('Warszawa','31231');
INSERT INTO City VALUES ('Radomyś Wielki','12312');
INSERT INTO City VALUES ('Mielec','312231');
INSERT INTO City VALUES ('Ryglice','31231');
INSERT INTO City VALUES ('Poznań','12312');
INSERT INTO City VALUES ('Białystok','312231');

SELECT * FROM City

DELETE FROM Restaurants WHERE Id = 1;

INSERT INTO Restaurants VALUES (1,3,4,'Czarny Sezam','sezam@gmail.com','Słoneczna 12',1);
INSERT INTO Restaurants VALUES (3,7,1,'Hades','hades@gmail.com','Słoneczna 12',1);
INSERT INTO Restaurants VALUES (4,9,10,'Papass','papass@gmail.com','Słoneczna 12',1);
INSERT INTO Restaurants VALUES (6,12,7,'Kebab City','kebab.c@gmail.com','Słoneczna 12',1);

SELECT * FROM Users
SELECT * FROM Restaurants; 
SELECT * FROM Type_restaurant
SELECT * FROM City
INSERT Category_food VALUES ('Kebab');
INSERT Category_food VALUES ('Pizza');
INSERT Category_food VALUES ('Zupy');
INSERT Category_food VALUES ('Napoje');
INSERT Category_food VALUES ('Burgery');
INSERT Category_food VALUES ('Makarony');
INSERT Category_food VALUES ('Przekąski');

INSERT Status_order VALUES ('Gotowy');
INSERT Status_order VALUES ('W trakcie');

INSERT INTO food VALUES (1,'Pizza Bia³a', 'pizza za dodatkami', 27.3,2,1);
INSERT INTO food VALUES (1,'Kebab pita', 'Kebab', 13,2,1);
INSERT INTO food VALUES (2,'Susshi', 'pizza za dodatkami', 27.3,7,1);
INSERT INTO food VALUES (2,'Rosół', 'zupka', 13,3,1);
INSERT INTO food VALUES (3,'Kotlet z szynka i serem', 'ziemniaki, surowka, ser,szynka', 35,7,1);
INSERT INTO food VALUES (3,'Woda z cytryna', 'woda i cytryna', 5.6,4,1);
INSERT INTO food VALUES (4,'Bigos domowy', 'kapusta kiełbasa', 18.4,2,1);
INSERT INTO food VALUES (4,'Gołąbki w sosie', 'ryż mięso', 13,2,1);

SELECT * FROM Category_food
SELECT * FROM food

INSERT INTO Orders VALUES (1,1,2,convert(varchar,getdate(),1),34,convert(varchar,getdate(),8),'jak najszybciej');
INSERT INTO Orders VALUES (5,2,2,convert(varchar,getdate(),1),45,convert(varchar,getdate(),8),'jak najszybciej');
INSERT INTO Orders VALUES (2,3,2,convert(varchar,getdate(),1),19,convert(varchar,getdate(),8),'jak najszybciej');
INSERT INTO Orders VALUES (8,4,2,convert(varchar,getdate(),1),23,convert(varchar,getdate(),8),'jak najszybciej');
SELECT * FROM Orders

INSERT INTO Item_order VALUES (2,1,3);
INSERT INTO Item_order VALUES (3,1,2);
INSERT INTO Item_order VALUES (4,2,1);
INSERT INTO Item_order VALUES (5,2,3);
INSERT INTO Item_order VALUES (6,4,5);
SELECT * FROM Item_order
SELECT * FROM Comment

INSERT INTO Comment VALUES(2,1,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(2,2,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(3,2,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(6,2,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(11,1,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(12,1,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(4,3,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(8,4,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));
INSERT INTO Comment VALUES(6,4,'Super restauracja polecam najlepsza w okolicy',convert(datetime,'18-02-19 10:34:09 PM',5));

SELECT * FROM Restaurants r , City c WHERE (r.Id_city = c.Id AND c.Name = 'Mielec'); 

SELECT r.Name, c.Description FROM Restaurants r, Comment c order by r.Name

SELECT u.Name, u.Surname, r.Name FROM Users u 
inner JOIN Roles r on u.Id_role = r.Id 
WHERE r.Name = 'Customer' order by u.Surname

SELECT sum(f.price) as TotalPrice from food f 
inner join Item_order i on i.Id_food = f.Id
inner join Orders o on o.Id = i.Id_order
WHERE o.Id = 1;

SELECT u.Name, u.Surname, u.Phone, u.Email, f.Name ,f.Price, i.Quantity from Users u
INNER JOIN Orders o on o.Id_user = u.Id
INNER JOIN Item_order i on i.Id_order = o.Id
INNER JOIN food f on f.Id = i.Id_food
WHERE u.Id = 1;

SELECT * FROM Users

CREATE PROCEDURE [deluser] @id 
as
begin
	DELETE FROM Users WHERE Id = @id;
end
