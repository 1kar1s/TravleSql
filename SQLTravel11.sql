CREATE DATABASE Travel1
GO
USE Travel1

/***���������***/

CREATE TABLE Post(
id_post int PRIMARY KEY identity(1,1),
Name_Post varchar(500) not null
)


/***���������***/

CREATE TABLE Staff(
  id_staff int PRIMARY KEY identity(1,1),
  id_post int FOREIGN KEY REFERENCES Post(id_post),
  id_travel_agency int FOREIGN KEY REFERENCES Travel_agency (id_travel_agency),
  Surname_Staff varchar (100) not null,
  Name_Staff varchar (100) not null,
  Middle_Name_Staff varchar (100) not null,
  Date_Of_Birth_Staff varchar (20) not null,
  Staff_Gender varchar (20) not null,
  Worked_days varchar (20) not null,
  Phone varchar (20) not null,
  Salary varchar (20) not null,
)


ALTER TABLE Staff
ADD CONSTRAINT FK_Staff FOREIGN KEY (id_staff) REFERENCES Client(id_client)

/***��� ��������***/

CREATE TABLE Travel_agency(
  id_travel_agency int PRIMARY KEY identity(1,1),
  Name_Travel_agency varchar (100) not null,
  Travel_agency_Cod varchar (200) not null,
  Phone_Travel_agency varchar (20) not null,
  PK_Travel_agency int FOREIGN KEY REFERENCES Travel_packages (id_travel_packages),
  )



/***������***/

CREATE TABLE Client(
  id_client int PRIMARY KEY identity(1,1),
  id_tours int FOREIGN KEY REFERENCES Tours (id_tours),
  Surname_Client varchar (100) not null,
  Name_Client varchar (100) not null,
  Middle_Name_Client varchar (100) not null,
  Phone varchar (20) not null,
  Number_of_people varchar (10) not null,
  Package varchar (30) not null,
  )



 /***������������� �����***/

CREATE TABLE Travel_packages(
  id_travel_packages int PRIMARY KEY identity(1,1),
  id_tours int FOREIGN KEY REFERENCES Tours (id_tours),
  Travel_packages_cod varchar (100) not null,
  Employee_code varchar (50) not null, 
  Client_�ode varchar (50) not null,
  Tour_code varchar (50) not null,
  Date_of_sale varchar (50) not null,
  )


/***���***/

CREATE TABLE Tours(
  id_tours int PRIMARY KEY identity(1,1),
  id_type_tour int FOREIGN KEY REFERENCES Type_tour (id_type_tour),
  Tour_code varchar (100) not null,
  Type_tour_cod varchar (100) not null,
  Flight_code varchar (100),
  Start_date varchar (100) not null,
  )




/***��� ����***/

CREATE TABLE Type_tour(
  id_type_tour int PRIMARY KEY identity(1,1),
  id_flights int FOREIGN KEY REFERENCES Flights (id_flights),
  City varchar (100) not null,
  Hotel varchar (100) not null,
  Flights varchar (100) not null,
  Price varchar (100) not null,
  )




/***�����***/

CREATE TABLE Flights(
  id_flights int PRIMARY KEY identity(1,1),
  id_airports int FOREIGN KEY REFERENCES Airports (id_airports),
  countries_cod int FOREIGN KEY REFERENCES Countries (countries_cod),
  Cod_Flights varchar (100) not null,
  Departure varchar (100) not null,
  Arrival varchar (100) not null,
  Number_of_available_seats varchar (100) not null,
  �ity_code varchar (100) not null,
  Airport_code varchar (100) not null,
  Price varchar (100) not null,
  )




/***���������***/

CREATE TABLE Airports(
  id_airports int PRIMARY KEY identity(1,1),
  City varchar (200) not null,
  )



/***��������� �����***/

CREATE TABLE Aircraft(
  id_aircraft int PRIMARY KEY identity(1,1),
  id_airports int FOREIGN KEY REFERENCES Airports (id_airports),
  Name_Aircraft varchar (100) not null,
  )


/***�������***/
 
CREATE TABLE Airplane(
  id_airplane int PRIMARY KEY identity(1,1),
  id_aircraft int FOREIGN KEY REFERENCES Aircraft (id_aircraft),
  Name_Airplane varchar (100) not null,
  Mode_Airplanel varchar (200) not null,
  Date_Airplane varchar (200) not null,
  Cod_Airplane varchar (100) not null,
  )

 /***������***/

CREATE TABLE Countries(
  countries_cod int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  )

/***������***/

CREATE TABLE Cities(
  cities_cod int PRIMARY KEY identity(1,1),
  countries_cod int FOREIGN KEY REFERENCES Countries (countries_cod),
  id_hotels int FOREIGN KEY REFERENCES Hotels (id_hotels),
  Name varchar (100) not null,
  Country_code varchar (100) not null,
  )


/***�����***/

CREATE TABLE Hotels(
  id_hotels int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  �ity varchar (50) not null,
  Number_of_stars varchar (5) not null,
  )


/***�����������***/

CREATE TABLE Apartments(
  id_apartments int PRIMARY KEY identity(1,1),
  id_hotels int FOREIGN KEY REFERENCES Hotels(id_hotels),
  id_type_apartments int FOREIGN KEY REFERENCES Type_apartments(id_type_apartments),
  Apartments_std varchar (100) not null,
  Price_per_night varchar (100) not null,
  )


/***��� ������������***/

CREATE TABLE Type_apartments(
  id_type_apartments int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  rooms int not null,
  floor int not null,
  )


  INSERT INTO Post (Name_post) VALUES ('��������'),
  ('���.���������'),
  ('�������������'),
  ('��������� �������������'),
  ('�������������� ��������'),
  ('������� ���������'),
  ('���������'),
  ('��������� ����������'),
  ('��������� �����'),
  ('����������� ��'),
  ('��������'),
  ('��������')


  SELECT Name_Post FROM Post


  INSERT INTO Staff (Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary) VALUES 
  ('������','�����','����������','12.02.2000','���','3',+79524664114,90000),
  ('�������','������','�������','01.05.1992','���','7',+79524668579,100000),
  ('�����','�����','���������','12.02.2000','���','2',+79524444114,70000),
  ('��������','����','����������','12.02.2000','���','1',+79567894114,110000),
  ('�����','�����','����������','12.02.2000','���','6',+79512344114,30000),
  ('�������','���������','����������','12.12.1993','���','3',+79905044114,27000),
  ('�������','������','�������','10.08.1998','���','4',+79994904114,40000),
  ('��������','�����','����������','12.02.2000','���','5',+79081114114,34000),
  ('����������','�������','����������','12.02.1990','���','5',+79759554114,80000),
  ('�������','������','���������','15.12.1993','���','4',+79342214114,65000),
  ('�������','������','����������','12.02.1996','���','2',+78547694114,50000),
  ('�����','������','���������','15.12.1993','���','4',+79342214114,66000),
  ('����������','������','���������','15.12.1993','���','4',+79342214114,67000),
  ('������','������','���������','15.12.1993','���','4',+79342214114,68000),
  ('�����','������','���������','15.12.1993','���','4',+79342214114,70000)


  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary 
  FROM Staff


  /*���������� ������� ����������.*/

  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary
  FROM Staff
  UPDATE Staff SET Worked_days=200
  WHERE id_staff=1


  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,
  MAX(Salary) OVER(PARTITION BY Surname_Staff ORDER BY Name_Staff
  RANGE UNBOUNDED PRECEDING) as Min_Salary
  FROM Staff
  ORDER BY Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone;

  

  INSERT INTO Travel_agency (Name_Travel_agency,Travel_agency_Cod,Phone_Travel_agency) VALUES ('������ ��',55367891,+79992020200),
  ('������ ��',55367791,+79992020201),
  ('������ ��',55364191,+79992020202),
  ('������ ��',55345891,+79992020203),
  ('������ ���',55398891,+79992020204),
  ('������ ���',55637891,+79992020205)


  SELECT Name_Travel_agency,Travel_agency_Cod,Phone_Travel_agency
  FROM Travel_agency


  INSERT INTO Client (Surname_Client,Name_Client,Middle_Name_Client,Phone,Number_of_people,Package) VALUES ('���������','�����','���������',+79875546932,3,'������'),
  ('������','����','���������',+79874446932,2,'���������'),
  ('������','�����','���������',+79873346932,2,'�����'),
  ('��������','�������','����������',+79872246932,4,'�������'),
  ('������','���������','������������',+79871146932,3,'���'),
  ('������','����','���������',+79876646932,2,'�������'),
  ('��������','���������','���������',+79877746932,2,'���'),
  ('�������','���������','������������',+79878846932,2,'������'),
  ('������','���������','������������',+79879946932,1,'���'),
  ('�������','������','�������',+79871046932,4,'������'),
  ('�������','�������','���������',+79871246932,3,'�������'),
  ('��������','������','����������',+79871346932,1,'���'),
  ('������','�����','���������',+79871446932,3,'������'),
  ('�������','������','���������',+79871546932,3,'���������'),
  ('��������','���������','���������',+79871646932,2,'�������'),
  ('������','���������','������������',+79871746932,3,'���'),
  ('�������','������','���������',+79871846932,3,'������'),
  ('����������','�������','���������',+79871946932,3,'�����'),
  ('������','����','���������',+79872046932,3,'�������'),
  ('����������','�������','���������',+79872146932,3,'�������'),
  ('������','���������','������������',+79872346932,3,'���'),
  ('��������','�������','����������',+79872046932,3,'������')


  SELECT Surname_Client,Name_Client,Middle_Name_Client,Phone,Number_of_people,Package
  FROM Client



  INSERT INTO Travel_packages (Travel_packages_cod,Employee_code,Client_�ode,Tour_code,Date_of_sale) VALUES ('5501','00023','�������','������','15.04.2018'),
  ('5501','00024','�������','������','15.04.2018'),
  ('5501','00025','������','���-��������','15.04.2018'),
  ('5501','00026','������','�����','15.04.2018'),
  ('5501','00027','�������','������','15.04.2018'),
  ('5501','00028','�����','���','15.04.2018'),
  ('5501','00029','������','������','15.04.2018'),
  ('5501','00030','��������','���-��������','15.04.2018'),
  ('5501','00031','������','������','15.04.2018'),
  ('5501','00032','�������','���','15.04.2018'),
  ('5501','00033','�������','������','15.04.2018'),
  ('5501','00034','�������','���-��������','15.04.2018'),
  ('5501','00035','������','������','15.04.2018'),
  ('5501','00036','��������','�������','15.04.2018'),
  ('5501','00037','�������','�����','15.04.2018')


  SELECT Travel_packages_cod,Employee_code,Client_�ode,Tour_code,Date_of_sale
  FROM Travel_packages


  INSERT INTO Tours (Tour_code,Type_tour_cod,Start_date) VALUES ('������','�����','12.02.2021'),
  ('������','�����������','12.02.2021'),
  ('������','�����������','12.02.2021'),
  ('�������','�����','13.10.2021'),
  ('�������','�����','13.10.2021'),
  ('���','���-���������','20.05.2021'),
  ('���','���-��������','15.05.2021'),
  ('���','������','17.03.2021'),
  ('���','���-�����','11.05.2021'),
  ('���','���-����','11.05.2021'),
  ('������','���','05.09.2021'),
  ('������','�������','05.09.2021'),
  ('������','�����','11.12.2021'),
  ('�������','�������','11.11.2021'),
  ('������','������','11.02.2021'),
  ('������','�������','30.11.2021')


  SELECT Tour_code,Type_tour_cod,Start_date
  FROM Tours



  INSERT INTO Type_tour (City,Hotel,Flights,Price) VALUES ('���-��������','Sonesta Los Angeles Airport LAX','Boeing 777',150000),
  ('���-��������','Best Western Plus Commerce','Boeing 747',150000),
  ('���-��������','Huntley Santa Monica Beach','Boeing 777',150000),
  ('���-��������','Sheraton Gateway Los Angeles Hotel','Boeing 787',150000),
  ('������','Eurostars Langford','Boeing 747',100000),
  ('������','EVEN Hotel Miami - Airport, an IHG Hotel','Boeing 787',100000),
  ('������','Red Roof Inn PLUS+ Miami Airport','Boeing 767',100000),
  ('���-���������','Handlery Union Square Hotel','Bombardier CRJ200',160000),
  ('���-���������','Hotel Nikko San Francisco','Bombardier CRJ200',160000),
  ('���-���������','Hotel Caza Fishermans Wharf','Bombardier CRJ200',160000)


  SELECT City,Hotel,Flights,Price
  FROM Type_tour



  INSERT INTO Flights (Cod_Flights,Departure,Arrival,Number_of_available_seats,�ity_code,Airport_code,Price) VALUES ('������-�����','20.05.2021','22.05.2021',20,58,'DME',50000),
  ('������-���','29.05.2021','01.06.2021',25,166,'DME',70000),
  ('�����-�����','20.05.2021','22.05.2021',30,155,'KVX',75000),
  ('����-�������','20.05.2021','22.05.2021',5,216,'AER',60000),
  ('������-���-��������','20.05.2021','22.05.2021',18,323,'DME',150000),
  ('���������-�����','20.05.2021','22.05.2021',50,300,'	VOG',80000),
  ('������ ��������-������','20.05.2021','22.05.2021',13,305,'GOJ',110000),
  ('�����-���������-�������','20.05.2021','22.05.2021',10,585,'LED',50000)


  SELECT Cod_Flights,Departure,Arrival,Number_of_available_seats,�ity_code,Airport_code,Price
  FROM Flights



  INSERT INTO Airports (City) VALUES ('������'),
  ('�����-���������'),
  ('������������'),
  ('������ ��������'),
  ('�������'),
  ('������'),
  ('����'),
  ('������'),
  ('�����'),
  ('���������'),
  ('�������'),
  ('����������'),
  ('���������'),
  ('������'),
  ('�����')


  SELECT City
  FROM Airports



  INSERT INTO Aircraft (Name_Aircraft) VALUES ('��-225'),
  ('Sukhoi Superjet 100'),
  ('��-21'),
  ('��-134'),
  ('Boeing 777'),
  ('��-124'),
  ('Airbus A380'),
  ('Boeing 747'),
  ('��-96'),
  ('Airbus A330'),
  ('Boeing 787 Dreamliner'),
  ('��-86'),
  ('Airbus A350'),
  ('Bombardier CRJ200'),
  ('Boeing 767')


  SELECT Name_Aircraft
  FROM Aircraft



  INSERT INTO Airplane (Name_Airplane,Mode_Airplanel,Date_Airplane,Cod_Airplane) VALUES ('��-225','',2021,''),
  ('Sukhoi Superjet 100','RRJ95',2021,'RRJ-95NEW-100'),
  ('Airbus A320neo','AA320',2021,'AIA-320-100'),
  ('Embraer E-Jet','EEJ',2021,'EEJ-100-100'),
  ('Boeing 777','B7',2021,'BOE-777-100'),
  ('��-124','A124',2021,'AH1-124-100'),
  ('Airbus A380','AA380',2021,'AIA-380-100'),
  ('Boeing 747','B7',2021,'BOE-747-100'),
  ('��-96','�96',2021,'��9-096-100'),
  ('Airbus A330','AA330',2021,'AIA-330-100'),
  ('Boeing 787 Dreamliner','B787D',2021,'BOE-787D-100'),
  ('��-86','�86',2021,'��8-086-100'),
  ('Airbus A350','AA350',2021,'AIA-350-100'),
  ('Bombardier CRJ200','BCRJ200',2021,'BCRJ-200-100'),
  ('Boeing 767','B767',2021,'BOE-767-100')


  SELECT Name_Airplane,Mode_Airplanel,Date_Airplane,Cod_Airplane
  FROM Airplane




  INSERT INTO Countries (Name) VALUES ('������'),
  ('������'),
  ('�������'),
  ('���'),
  ('�������'),
  ('��������'),
  ('���������'),
  ('������'),
  ('�������'),
  ('�������'),
  ('�����'),
  ('������'),
  ('����� ������'),
  ('������'),
  ('�������'),
  ('����')


  /*�������� � ������� �������, ������ � ��������� id.*/

  SELECT * FROM Countries
  DELETE FROM Countries
  WHERE countries_cod=16



  SELECT Name
  FROM Countries



  INSERT INTO Cities (Name,Country_code) VALUES ('���-����','���'),
  ('���-��������','���'),
  ('���-�����','���'),
  ('������','���'),
  ('���-���������','���'),
  ('�����','������'),
  ('�����������','������'),
  ('�����������','������'),
  ('�����','�������'),
  ('�����','�������'),
  ('���','������'),
  ('�����','������'),
  ('�������','������'),
  ('�������','������'),
  ('������','������'),
  ('�������','�������')


  SELECT Name,Country_code
  FROM Cities




  INSERT INTO Hotels (Name,�ity,Number_of_stars) VALUES ('La Quinta by Wyndham LAX','���-��������',3),
  ('Sonesta Los Angeles Airport LAX','���-��������',4),
  ('Best Western Plus Commerce','���-��������',3),
  ('Sheraton Gateway Los Angeles Hotel','���-��������',4),
  ('Huntley Santa Monica Beach','���-��������',4),
  ('Downtown Grand Hotel & Casino','���-�����',3),
  ('Plaza Hotel & Casino','���-�����',4),
  ('Hotel & Casino','���-�����',2),
  ('Ellis Island Hotel Casino & Brewery','���-�����',3),
  ('Hilton Vacation Club Polo Towers Las Vegas','���-�����',3),
  ('EVEN Hotel Miami - Airport, an IHG Hotel','������',3),
  ('Red Roof Inn PLUS+ Miami Airport','������',2),
  ('Eurostars Langford','������',4),
  ('Handlery Union Square Hotel','���-���������',3),
  ('Hotel Nikko San Francisco','���-���������',5),
  ('Hotel Caza Fishermans Wharf','���-���������',4),
  ('Hotel Nikko','���-���������',5)


  SELECT Name,�ity,Number_of_stars
  FROM Hotels




  INSERT INTO Apartments (Apartments_std,Price_per_night) VALUES ('La Quinta by Wyndham LAX',10000),
  ('Sonesta Los Angeles Airport LAX',9759),
  ('Best Western Plus Commerce',10016),
  ('Sheraton Gateway Los Angeles Hotel',9940),
  ('Huntley Santa Monica Beach',23039),
  ('Downtown Grand Hotel & Casino',3467),
  ('Plaza Hotel & Casino',3051),
  ('Ellis Island Hotel Casino & Brewery',3005),
  ('Hilton Vacation Club Polo Towers Las Vegas',6172),
  ('EVEN Hotel Miami - Airport, an IHG Hotel',9709),
  ('Red Roof Inn PLUS+ Miami Airport',8399),
  ('Eurostars Langford',12329),
  ('Handlery Union Square Hotel',13793),
  ('Hotel Nikko San Francisco',15411),
  ('Hotel Caza Fishermans Wharf',13176)


  SELECT Apartments_std,Price_per_night
  FROM Apartments

  SELECT Apartments_std,
  max(Price_per_night) as max_salary,
  min(Price_per_night) AS min_salary
  FROM Apartments
  group by Apartments_std;



  INSERT INTO Type_apartments (Name,rooms,floor) VALUES ('La Quinta by Wyndham LAX',5,12),
  ('Sonesta Los Angeles Airport LAX',4,12),
  ('Best Western Plus Commerce',3,9),
  ('Sheraton Gateway Los Angeles Hotel',4,10),
  ('Huntley Santa Monica Beach',3,2),
  ('Downtown Grand Hotel & Casino',3,3),
  ('Plaza Hotel & Casino',3,4),
  ('Ellis Island Hotel Casino & Brewery',4,5),
  ('Hilton Vacation Club Polo Towers Las Vegas',5,23),
  ('EVEN Hotel Miami - Airport, an IHG Hotel',2,18),
  ('Red Roof Inn PLUS+ Miami Airport',2,2),
  ('Eurostars Langford',3,10),
  ('Handlery Union Square Hotel',3,3),
  ('Hotel Nikko San Francisco',3,2),
  ('Hotel Caza Fishermans Wharf',4,3)


  SELECT Name,rooms,floor
  FROM Type_apartments



/*������ � ����������� Full,Outer*/

  SELECT *
  FROM Cities
  FULL OUTER JOIN Countries ON Cities.cities_cod= Countries.countries_cod


  SELECT *
  FROM Cities
  LEFT OUTER JOIN Client ON Cities.Country_code=Client.Package




/*�������� ���������������� ������.*/

SELECT name FROM Countries
WHERE Name  NOT IN (select Country_code from Cities)




/*������� ������� � ������ ������.*/

SELECT cities.Country_code, count(Countries.name) AS '�-��'
FROM Countries
INNER JOIN Cities ON Cities.Country_code=countries.Name
GROUP BY Cities.Country_code




/*�������� ������, � ������� ������ 1 ����.*/

SELECT Tour_code, count (Client.id_client) AS '�-�� �����'
FROM Client
INNER JOIN Tours ON Tours.id_tours=Client.id_client
GROUP BY Tour_code
HAVING count (id_client) >1
ORDER BY count(id_client) DESC




/*�������� ������, � ����� ������� �-��� ������.*/

SELECT Hotels.�ity, count(cities.Name) AS '�-�� '
FROM Cities
INNER JOIN Hotels ON Hotels.�ity=Cities.Name
GROUP BY Hotels.�ity,Cities.Name
HAVING count(Cities.Name) = 
(select top 1 count(Name) AS MaxCount
FROM Hotels
GROUP BY (�ity)
ORDER BY count(Name) DESC)
