CREATE DATABASE Project;
use Project;
CREATE TABLE Restaurants (
	Id					INTEGER PRIMARY KEY IDENTITY(1,1),
	Id_type_restaurant	integer,
	Id_user				integer,
	Id_city				integer,
	Name				varchar(255),
	Email				varchar(255),
	Address				varchar(60),
	Active				bit,
)

CREATE TABLE Users (

	Id						INTEGER PRIMARY KEY identity(1,1),
	Id_role					INTEGER,
	Password				varchar(255),
	Confirmation_joined		varchar(255),
	Time_joined				datetime,
	Name					varchar(60),
	Surname					varchar(60),
	Email					varchar(60),
	Phone					varchar(60)
)

CREATE TABLE Roles (
	Id			INTEGER PRIMARY KEY IDENTITY(1,1),
	Name		varchar(60),
)

CREATE TABLE Type_restaurant (
	Id			integer primary key identity(1,1),
	Name		varchar(60)
)

CREATE TABLE Orders (
	Id					integer primary key identity(1,1),
	Id_user				integer,
	Id_restaurant		integer,
	Id_status			integer,
	Data				date,
	Total_price			decimal(12,2),
	Preparation_time	time,
	Comment				text
)

CREATE TABLE Comment (
	Id integer primary key IDENTITY(1,1),
	Id_user  integer,
	Id_restaurant  integer,
	Description text,
	Data date,
)

CREATE TABLE Item_order (
	Id			integer primary key identity(1,1),
	Id_food		integer,
	Id_order	integer,
	Quantity	integer
)

CREATE TABLE food (
	Id				integer primary key identity(1,1),
	id_restaurant	integer,
	Name			varchar(60),
	Description		text,
	Price			decimal(12,2),
	Id_category		integer,
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

INSERT INTO Users VALUES (1, '1qazxsW@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Jan', 'Kowalski', 'Jan.k@gmail.com','555666777');
INSERT INTO Users VALUES (2, '1qazxsW@', '1231432123123534', convert(datetime,'18-06-12 10:34:09 PM',5),'Tomasz', 'Nowak', 'Tomasz.N@gmail.com','555666777');
INSERT INTO Users VALUES (3, '1qazxsW@', '1231432123123534', convert(datetime,'18-06-19 10:34:09 PM',5),'Marek', 'Grzybowski', 'Mark.k@gmail.com','555666777')

INSERT INTO Type_restaurant VALUES ('Azjatycka');
INSERT INTO Type_restaurant VALUES ('Polska');
INSERT INTO Type_restaurant VALUES ('W³oska');

INSERT INTO City VALUES ('Dêbica','34123');
INSERT INTO City VALUES ('Rzeszów','31231');
INSERT INTO City VALUES ('Tarnów','12312');
INSERT INTO City VALUES ('Kraków','312231');

INSERT INTO Restaurants VALUES (1,1,4,'Czarny Sezam','sezam@gmail.com','S³oneczna 12',1);
INSERT Category_food VALUES ('Kebab');
INSERT Category_food VALUES ('Pizza');

INSERT Status_order VALUES ('Gotowy');
INSERT Status_order VALUES ('W trakcie');

INSERT INTO food VALUES (1,'Pizza Bia³a', 'pizza za dodatkami', 27.3,2,1);
INSERT INTO food VALUES (1,'Kebab pita', 'Kebab', 13,2,1);

INSERT INTO Orders VALUES (1,1,2,convert(varchar,getdate(),1),34,convert(varchar,getdate(),8),'jak najszybciej');

INSERT INTO Item_order VALUES (2,1,3);
