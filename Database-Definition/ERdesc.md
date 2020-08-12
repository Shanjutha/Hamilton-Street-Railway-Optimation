#Description of ER

Person is a regular entity with attributes person ID, first name, last name, gender, street address, city address, province, and occupation, and has a many-many relationship with Contact Information. 

Contact Information is a weak entity with the attribute phone number, and has a total participation relationship with Person. 

Has is the relationship that associates Person with Contact Information. 

Passenger is a subclass of Person with the attribute type, and has a many-many relationship with Ticket and Bus. 

Ticket is a regular entity that with attributes ticket number and fare price, and has a many-many relationship with Passenger. 

Buys is the relationship that associates Passenger with Ticket. 

Boards is the relationship that associated Passenger with Bus. 

Maintenance Personnel is a subclass of Person with attributes specialization, level, salary, and years of service, and has a many-many relationship with Bus. 

Fixes is the relationship that associates Maintenance Personnel and Bus, with the attribute date of fix. 

Bus Driver is a subclass of Person with attributes salary and number of years of service, and has a many-one relationship with Driving Infractions.

Driving Infractions is a weak entity with attributes date of occurrence, demerit points, financial penalty, and type, and an exactly one relationship with Bus Driver. 

Incurred is the relationship that associates Bus Driver with Driving Infractions. 

Drives is the relationship that associates Bus Driver and Bus. 

Bus is a regular entity with attributes bus number, number of seats, years of operation, fuel type, manufacturer, and ad revenue, and has many-many relationship with Passenger and Bus Driver, total participation relationship with Maintenance Personnel, and an exactly one relationship with Route. 

Route is a regular entity with attributes route number and route name, and a one-many relationship with Bus, two many-many relationships with Stop, and total participation relationship with Site. 

Stop is a regular entity with attributes stop number and stop name, and a total participation relationship with site and two many-many relationships with route.

Schedules is a relationship that associates Route and Stop with the attribute arrival time. 
Contains is a relationship that associates Route and Stop. 

Site is a regular entity with attributes name, address, phone number, category, and capacity, and a one-many relationship with Event, many-many with Route, and many-many relationship with Stop. 

Serves is a relationship that associates Route and Site. 

Belongs to is a relationship that associates Stop and Site. 

Event is a regular entity with attributes name of event, date, time, and number of participants, and an exactly one relationship with Site. 

Hosts is the relationship that associates Site and Event. 

