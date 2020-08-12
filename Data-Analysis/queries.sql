--1
SELECT  BusID, Age, Manufacturer 
FROM Bus
WHERE AdvertisingRevenue>9000;

--2
SELECT COUNT(DISTINCT SIN) AS Total 
FROM Person 
WHERE Occupation='student' OR YEAR(current_date-DateOfBirth)< 25;

--3
SELECT COUNT(DISTINCT SIN) AS Total 
FROM Bus B, Take T 
WHERE SIN IN(SELECT SIN 
		FROM Person 
		WHERE Occupation='student' OR YEAR(current_date-DateOfBirth)<25) 
	AND B.RouteID=5 AND T.Date='5/3/2017';

--4
SELECT RouteID, SUM(AdvertisingRevenue) AS TotalRevenue 
FROM Bus 
GROUP BY RouteID 
ORDER BY TotalRevenue DESC;

--5a
SELECT I.SIN AS DriverID, Person.FirstName, Person.LastName 
FROM Infraction I 
INNER JOIN Person ON I.SIN=Person.SIN 
GROUP BY I.SIN, FirstName, LastName 
HAVING COUNT(I.SIN)<3;

--5b
SELECT SIN AS DriverID, SUM(Demerit) AS TotalDemerit, SUM(Fine) AS TotalFine 
FROM Infraction 
WHERE SIN IN(SELECT SIN FROM Infraction GROUP BY SIN HAVING COUNT(SIN)>2) 
GROUP BY SIN 
ORDER BY TotalDemerit DESC, TotalFine DESC;

--6
SELECT Manufacturer, MIN(BusID) AS BusID 
FROM Bus 
GROUP BY Manufacturer 
HAVING COUNT(Manufacturer)<2;

--7a
SELECT P.Type AS PassengerType, SUM(Fare.Fee) AS TotalFareRevenue 
FROM Passenger P 
INNER JOIN Fare ON P.Type=Fare.Type 
GROUP BY P.Type;

--7b
SELECT P.Type AS PassengerType, SUM(Fare.Fee) AS TotalFareRevenue 
FROM Passenger P 
INNER JOIN Fare ON P.Type=Fare.Type 
GROUP BY P.Type 
HAVING SUM(Fare.Fee)>500;

--7c
SELECT P.Type 
FROM Passenger P, Fare F, Take T 
WHERE (P.Type=F.Type) AND (P.SIN=T.SIN) and T.Date='5/1/2017' 
GROUP BY P.Type 
ORDER BY SUM(F.Fee) DESC FETCH FIRST 1 ROWS ONLY;

--8a
SELECT B.RouteID, COUNT(T.SIN) AS NumberOfTrips 
FROM Bus B, Take T 
WHERE (T.BusID=B.BusID) AND T.Date='5/7/2017' 
GROUP BY B.RouteID 
ORDER BY NumberOfTrips DESC FETCH FIRST 1 ROWS ONLY;

--8b
SELECT T.Date, COUNT(T.SIN) AS NumberOfTrips 
FROM Take T 
GROUP BY T.Date 
ORDER BY NumberOfTrips DESC FETCH FIRST 1 ROWS ONLY;

--9
SELECT DISTINCT P.Occupation 
FROM Person P, Take T, Bus B, Go G, Sites S 
WHERE P.SIN=T.SIN 
	AND T.BusID=B.BusID 
	AND B.RouteID=G.RouteID 
	AND S.SIName=G.SIName 
	AND S.Category='Library' 
	AND (T.Date='5/5/2017' OR T.Date='5/6/2017');

--10
SELECT 	P.FirstName, P.LastName, D.SIN 
FROM 		Person P,Driver D 
WHERE 	D.YearsOfService>5 
		AND D.Salary>80000 
		AND D.SIN=P.SIN 
		AND D.SIN IN (SELECT I.SIN 
				FROM Infraction I 
				GROUP BY I.SIN 
				HAVING SUM(I.Demerit)<10);

--11
SELECT DISTINCT P.FirstName, P.LastName, P.Sex 
FROM Person P, Take T, Go G, Event E,Bus B 
WHERE 	(P.Occupation='student' OR (YEAR(current_date-P.DateOfBirth)< 25)
	AND P.SIN=T.SIN 
	AND T.BusID=B.BusID 
	AND G.RouteID=B.RouteID 
	AND G.RouteID=4 
	AND E.SIName=G.SIName 	
	AND E.EName='Marauders Tennis');

--12
SELECT DISTINCT Sch.RouteID, St.SName, Sch.ArrivalTIme 
FROM Schedule Sch, Stop St, Go G, Event E 
WHERE 	(Sch.StopID=St.StopID) 
		AND (Sch.Date='5/1/2017') 
		AND (Sch.ArrivalTime BETWEEN '16:20:00' AND '16:50:00') 
		AND Sch.RouteID=G.RouteID 
		AND St.SIName=E.SIName 
		AND E.Ename='Marauders Basketball' 
		AND E.Time='17:00:00';



















