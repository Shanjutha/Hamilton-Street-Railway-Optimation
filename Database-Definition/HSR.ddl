connect to cs3db3;

--++++++++++++++++++++++++++++++++++++++++++++++
-- CREATE TABLES
--++++++++++++++++++++++++++++++++++++++++++++++


------------------------------------------------
--  DDL Statements for table Person
------------------------------------------------
CREATE TABLE Person (
	PersonID			CHAR(15) NOT NULL,
	FirstName			CHAR(20), 
	LastName 			CHAR(20),
	Gender 				CHAR(10),
	DateOfBirth			DATE,
	StreetAddress		CHAR(25),
	CityAddress			CHAR(20),
	Province 			CHAR(20),
	Occupation 			CHAR(20),
	PRIMARY KEY (PersonID)
);


-------------------------------------------------
--  DDL Statements for table Contact Information
-------------------------------------------------
CREATE TABLE ContactInformation(
	PhoneNumber	CHAR(10) NOT NULL,
	PersonID	CHAR(15) NOT NULL,
	PRIMARY KEY (PhoneNumber,PersonID),
	FOREIGN KEY (PersonID) REFERENCES Person on delete cascade
);

-------------------------------------------------
--  DDL Statements for table Has (Contact Info)
-------------------------------------------------
CREATE TABLE Has (
	PersonID		CHAR(15) NOT NULL,
	PhoneNumber		CHAR(10) NOT NULL,
	PRIMARY KEY (PersonID, PhoneNumber),
	FOREIGN KEY (PersonID) REFERENCES Person
);

------------------------------------------------
--  DDL Statements for table Passenger
------------------------------------------------
CREATE TABLE Passenger (
	PersonID		CHAR(15) NOT NULL,
	Type 			CHAR(7), 
	PRIMARY KEY (PersonID),
	FOREIGN KEY (PersonID) REFERENCES Person
);

-------------------------------------------------
--  DDL Statements for table Boards (Bus)
-------------------------------------------------
CREATE TABLE Boards (
	PersonID		CHAR(15) NOT NULL,
	BusNum			INT NOT NULL,
	PRIMARY KEY (PersonID, BusNum),
	FOREIGN KEY (PersonID) REFERENCES Passenger,
	FOREIGN KEY (BusNum) REFERENCES Bus
);

-------------------------------------------------
--  DDL Statements for table Buys (Ticket)
-------------------------------------------------
CREATE TABLE Buys (
	PersonID		CHAR(15) NOT NULL,
	TicketNum		INT NOT NULL,
	PRIMARY KEY (PersonID, TicketNum),
	FOREIGN KEY (PersonID) REFERENCES Passenger,
	FOREIGN KEY (TicketNum) REFERENCES Ticket
);

-------------------------------------------------
--  DDL Statements for table Ticket
-------------------------------------------------
CREATE TABLE Ticket (
	TicketNum		INT NOT NULL,
	FarePrice 		REAL, 
	PRIMARY KEY (TicketNum)	
);

------------------------------------------------
--  DDL Statements for table Bus Driver 
------------------------------------------------
CREATE TABLE BusDriver (
	PersonID			CHAR(15) NOT NULL,
	Salary				REAL, 
	NumYearsOfService 	INT,
	DrivingInfractions	INT,
	PRIMARY KEY (PersonID),
	FOREIGN KEY (PersonID) REFERENCES Person
);

-------------------------------------------------
--  DDL Statements for table Drives (Bus)
-------------------------------------------------
CREATE TABLE Drives (
	PersonID		CHAR(15) NOT NULL,
	BusNum			INT NOT NULL,
	PRIMARY KEY (PersonID, BusNum),
	FOREIGN KEY (PersonID) REFERENCES BusDriver,
	FOREIGN KEY (BusNum) REFERENCES Bus
);

-------------------------------------------------
--  DDL Statements for table Driving Infractions
-------------------------------------------------
CREATE TABLE DrivingInfractions (
	DateOfOccurrence	DATE NOT NULL,
	PersonID			CHAR(15) NOT NULL,
	DemeritPoints		INT,
	FinancialPenalty 	REAL,
	Type				CHAR(40),
	PRIMARY KEY (PersonID, DateOfOccurrence),
	FOREIGN KEY (PersonID) REFERENCES BusDriver on delete cascade 
);

-------------------------------------------------
--  DDL Statements for table Incurred 
-------------------------------------------------
CREATE TABLE Incurred (
	PersonID 			CHAR(15) NOT NULL,
	DateOfOccurrence	DATE NOT NULL,
	PRIMARY KEY (PersonID, DateOfOccurrence),
	FOREIGN KEY (PersonID) REFERENCES BusDriver
);


--------------------------------------------------
--  DDL Statements for table Maintenance Personnel
--------------------------------------------------
CREATE TABLE MaintenancePersonnel (
	PersonID			CHAR(15) NOT NULL,
	Salary				REAL, 
	NumYearsOfService 	INT,
	Specialization		CHAR(40),
	Level				CHAR(20),
	PRIMARY KEY (PersonID),
	FOREIGN KEY (PersonID) REFERENCES Person
);


-------------------------------------------------
--  DDL Statements for table Fixes
-------------------------------------------------
CREATE TABLE Fixes (
	PersonID			CHAR(15) NOT NULL,
	BusNum				INT NOT NULL, 
	DateOfFix			DATE,
	PRIMARY KEY (BusNum, PersonID),
	FOREIGN KEY (PersonID) REFERENCES MaintenancePersonnel,
	FOREIGN KEY (BusNum) REFERENCES Bus
);

-------------------------------------------------
--  DDL Statements for table Bus
-------------------------------------------------
CREATE TABLE Bus (
	BusNum				INT NOT NULL, 
	NumOfSeats			INT,
	YearsOfOperation	INT,
	FuelType			CHAR(20), 
	Manufacturer 		CHAR(20),
	AdRevenue			REAL, 
	PRIMARY KEY (BusNum)
);

-------------------------------------------------
--  DDL Statements for table Follows
-------------------------------------------------
CREATE TABLE Follows (
	BusNum				INT NOT NULL,
	RouteNum			INT NOT NULL, 
	PRIMARY KEY (BusNum, RouteNum),
	FOREIGN KEY (BusNum) REFERENCES Bus,
	FOREIGN KEY (RouteNum) REFERENCES Route
);

-------------------------------------------------
--  DDL Statements for table Route 
-------------------------------------------------
CREATE TABLE Route (
	RouteNum			INT NOT NULL, 
	RouteName			CHAR(20),
	PRIMARY KEY (RouteNum)
);

-------------------------------------------------
--  DDL Statements for table Contains 
-------------------------------------------------
CREATE TABLE Contains (
	RouteNum			INT NOT NULL, 
	StopNum				INT NOT NULL,
	PRIMARY KEY (StopNum, RouteNum),
	FOREIGN KEY (RouteNum) REFERENCES Route,
	FOREIGN KEY (StopNum) REFERENCES Stop
);

-------------------------------------------------
--  DDL Statements for table Schedules
-------------------------------------------------
CREATE TABLE Schedules (
	StopNum				INT NOT NULL, 
	RouteNum			INT NOT NULL,
	ArrivalTime			CHAR(5),
	PRIMARY KEY (StopNum, RouteNum),
	FOREIGN KEY (RouteNum) REFERENCES Route,
	FOREIGN KEY (StopNum) REFERENCES Stop
);

-------------------------------------------------
--  DDL Statements for table Serves(Site)
-------------------------------------------------
CREATE TABLE Serves (
	RouteNum			INT NOT NULL, 
	SiteName				CHAR(40) NOT NULL,
	PRIMARY KEY (SiteName, RouteNum),
	FOREIGN KEY (RouteNum) REFERENCES Route,
	FOREIGN KEY (SiteName) REFERENCES Site
);

-------------------------------------------------
--  DDL Statements for table Stop
-------------------------------------------------
CREATE TABLE Stop (
	StopNum				INT NOT NULL, 
	StopName			INT,
	PRIMARY KEY (StopNum)
);

--  DDL Statements for table Belongs To (Site)
-------------------------------------------------
CREATE TABLE BelongsTo (
	StopNum				INT NOT NULL, 
	SiteName			CHAR(40) NOT NULL,
	PRIMARY KEY (SiteName, StopNum),
	FOREIGN KEY (StopNum) REFERENCES Stop,
	FOREIGN KEY (SiteName) REFERENCES Site
);

-------------------------------------------------
--  DDL Statements for table Site
-------------------------------------------------
CREATE TABLE Site (
	Address			CHAR(40),
	SiteName 		CHAR(40) NOT NULL,
	PhoneNum		CHAR(10),
	Category 		CHAR(20),
	Capacity 		INT, 
	PRIMARY KEY (SiteName)
);


-------------------------------------------------
--  DDL Statements for table Event
-------------------------------------------------
CREATE TABLE Event (
	EventName 			CHAR(40) NOT NULL, 
	EventDate			DATE,
	Time				CHAR(5), 
	NumOfParticipants 	INT,
	PRIMARY KEY (EventName) 
);

-------------------------------------------------
--  DDL Statements for table Hosts
-------------------------------------------------
CREATE TABLE Hosts (
	SiteName			CHAR(40) NOT NULL,
	EventName 		CHAR(40) NOT NULL,
	PRIMARY KEY (SiteName, EventName),
	FOREIGN KEY (SiteName) REFERENCES Site,
	FOREIGN KEY (EventName) REFERENCES Event
);

------------------------------------------------
-- List all tables your created
------------------------------------------------
list tables; 
