CREATE DATABASE Travel1
GO
USE Travel1

/***Должность***/

CREATE TABLE Post(
id_post int PRIMARY KEY identity(1,1),
Name_Post varchar(500) not null
)


/***Сотрудник***/

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

/***Тур агенство***/

CREATE TABLE Travel_agency(
  id_travel_agency int PRIMARY KEY identity(1,1),
  Name_Travel_agency varchar (100) not null,
  Travel_agency_Cod varchar (200) not null,
  Phone_Travel_agency varchar (20) not null,
  PK_Travel_agency int FOREIGN KEY REFERENCES Travel_packages (id_travel_packages),
  )



/***Клиент***/

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



 /***Туристичиский пакет***/

CREATE TABLE Travel_packages(
  id_travel_packages int PRIMARY KEY identity(1,1),
  id_tours int FOREIGN KEY REFERENCES Tours (id_tours),
  Travel_packages_cod varchar (100) not null,
  Employee_code varchar (50) not null, 
  Client_сode varchar (50) not null,
  Tour_code varchar (50) not null,
  Date_of_sale varchar (50) not null,
  )


/***Тур***/

CREATE TABLE Tours(
  id_tours int PRIMARY KEY identity(1,1),
  id_type_tour int FOREIGN KEY REFERENCES Type_tour (id_type_tour),
  Tour_code varchar (100) not null,
  Type_tour_cod varchar (100) not null,
  Flight_code varchar (100),
  Start_date varchar (100) not null,
  )




/***Тип тура***/

CREATE TABLE Type_tour(
  id_type_tour int PRIMARY KEY identity(1,1),
  id_flights int FOREIGN KEY REFERENCES Flights (id_flights),
  City varchar (100) not null,
  Hotel varchar (100) not null,
  Flights varchar (100) not null,
  Price varchar (100) not null,
  )




/***Рейсы***/

CREATE TABLE Flights(
  id_flights int PRIMARY KEY identity(1,1),
  id_airports int FOREIGN KEY REFERENCES Airports (id_airports),
  countries_cod int FOREIGN KEY REFERENCES Countries (countries_cod),
  Cod_Flights varchar (100) not null,
  Departure varchar (100) not null,
  Arrival varchar (100) not null,
  Number_of_available_seats varchar (100) not null,
  Сity_code varchar (100) not null,
  Airport_code varchar (100) not null,
  Price varchar (100) not null,
  )




/***Аэропорты***/

CREATE TABLE Airports(
  id_airports int PRIMARY KEY identity(1,1),
  City varchar (200) not null,
  )



/***Воздушное судно***/

CREATE TABLE Aircraft(
  id_aircraft int PRIMARY KEY identity(1,1),
  id_airports int FOREIGN KEY REFERENCES Airports (id_airports),
  Name_Aircraft varchar (100) not null,
  )


/***Самолет***/
 
CREATE TABLE Airplane(
  id_airplane int PRIMARY KEY identity(1,1),
  id_aircraft int FOREIGN KEY REFERENCES Aircraft (id_aircraft),
  Name_Airplane varchar (100) not null,
  Mode_Airplanel varchar (200) not null,
  Date_Airplane varchar (200) not null,
  Cod_Airplane varchar (100) not null,
  )

 /***Страна***/

CREATE TABLE Countries(
  countries_cod int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  )

/***Города***/

CREATE TABLE Cities(
  cities_cod int PRIMARY KEY identity(1,1),
  countries_cod int FOREIGN KEY REFERENCES Countries (countries_cod),
  id_hotels int FOREIGN KEY REFERENCES Hotels (id_hotels),
  Name varchar (100) not null,
  Country_code varchar (100) not null,
  )


/***Отели***/

CREATE TABLE Hotels(
  id_hotels int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  Сity varchar (50) not null,
  Number_of_stars varchar (5) not null,
  )


/***Апортаменты***/

CREATE TABLE Apartments(
  id_apartments int PRIMARY KEY identity(1,1),
  id_hotels int FOREIGN KEY REFERENCES Hotels(id_hotels),
  id_type_apartments int FOREIGN KEY REFERENCES Type_apartments(id_type_apartments),
  Apartments_std varchar (100) not null,
  Price_per_night varchar (100) not null,
  )


/***Тип апортоментов***/

CREATE TABLE Type_apartments(
  id_type_apartments int PRIMARY KEY identity(1,1),
  Name varchar (100) not null,
  rooms int not null,
  floor int not null,
  )


  INSERT INTO Post (Name_post) VALUES ('Директор'),
  ('Зам.Директора'),
  ('Администратор'),
  ('Системный администратор'),
  ('Териториальный менеджер'),
  ('Главный бухгалтер'),
  ('Бухгалтер'),
  ('Фронттент разрабочик'),
  ('Рекламный агент'),
  ('Разработчик БД'),
  ('Менеджер'),
  ('Уборщица')


  SELECT Name_Post FROM Post


  INSERT INTO Staff (Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary) VALUES 
  ('Фралов','Антон','Викторович','12.02.2000','Муж','3',+79524664114,90000),
  ('Арефиев','Андрей','Юрьевич','01.05.1992','Муж','7',+79524668579,100000),
  ('Букин','Роман','Сергеевич','12.02.2000','Муж','2',+79524444114,70000),
  ('Соколова','Ника','Викторовна','12.02.2000','Жен','1',+79567894114,110000),
  ('Вишин','Антон','Викторович','12.02.2000','Муж','6',+79512344114,30000),
  ('Макаров','Александр','Викторович','12.12.1993','Муж','3',+79905044114,27000),
  ('Беляков','Лионид','Юрьевич','10.08.1998','Муж','4',+79994904114,40000),
  ('Румянцев','Артем','Викторович','12.02.2000','Муж','5',+79081114114,34000),
  ('Нигматулин','Алексей','Викторович','12.02.1990','Муж','5',+79759554114,80000),
  ('Житухин','Михаил','Сергеевич','15.12.1993','Муж','4',+79342214114,65000),
  ('Комаров','Максим','Викторович','12.02.1996','Муж','2',+78547694114,50000),
  ('Мухин','Михаил','Сергеевич','15.12.1993','Муж','4',+79342214114,66000),
  ('Митрофанов','Михаил','Сергеевич','15.12.1993','Муж','4',+79342214114,67000),
  ('Петров','Михаил','Сергеевич','15.12.1993','Муж','4',+79342214114,68000),
  ('Пашин','Михаил','Сергеевич','15.12.1993','Муж','4',+79342214114,70000)


  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary 
  FROM Staff


  /*Обновление таблицы сотрудники.*/

  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,Salary
  FROM Staff
  UPDATE Staff SET Worked_days=200
  WHERE id_staff=1


  SELECT Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone,
  MAX(Salary) OVER(PARTITION BY Surname_Staff ORDER BY Name_Staff
  RANGE UNBOUNDED PRECEDING) as Min_Salary
  FROM Staff
  ORDER BY Surname_Staff,Name_Staff,Middle_Name_Staff,Date_Of_Birth_Staff,Staff_Gender,Worked_days,Phone;

  

  INSERT INTO Travel_agency (Name_Travel_agency,Travel_agency_Cod,Phone_Travel_agency) VALUES ('МИРТУР НН',55367891,+79992020200),
  ('МИРТУР МС',55367791,+79992020201),
  ('МИРТУР ЕК',55364191,+79992020202),
  ('МИРТУР ИЖ',55345891,+79992020203),
  ('МИРТУР ДЕР',55398891,+79992020204),
  ('МИРТУР БОР',55637891,+79992020205)


  SELECT Name_Travel_agency,Travel_agency_Cod,Phone_Travel_agency
  FROM Travel_agency


  INSERT INTO Client (Surname_Client,Name_Client,Middle_Name_Client,Phone,Number_of_people,Package) VALUES ('Гирасимов','Кирил','Игорьевич',+79875546932,3,'Египет'),
  ('Скоков','Иван','Игорьевич',+79874446932,2,'Гиленджик'),
  ('Акимов','Кирил','Игорьевич',+79873346932,2,'Дубаи'),
  ('Королева','Кскения','Николаевна',+79872246932,4,'Франция'),
  ('Шуркин','Александр','Вячеславович',+79871146932,3,'США'),
  ('Скоков','Иван','Игорьевич',+79876646932,2,'Тайланд'),
  ('Ломакина','Екатерина','Игорьевна',+79877746932,2,'США'),
  ('Макаров','Александр','Владимирович',+79878846932,2,'Кувейт'),
  ('Шуркин','Александр','Вячеславович',+79879946932,1,'США'),
  ('Беляков','Леонид','Юрьевич',+79871046932,4,'Египет'),
  ('Комаров','Макстим','Игорьевич',+79871246932,3,'Тайланд'),
  ('Королева','Ксения','Николаевна',+79871346932,1,'США'),
  ('Гришин','Кирил','Игорьевич',+79871446932,3,'Египет'),
  ('Житухин','Михаил','Сергеевич',+79871546932,3,'Гиленджик'),
  ('Ломакина','Екатерина','Игорьевна',+79871646932,2,'Тайланд'),
  ('Шуркин','Александр','Вячеславович',+79871746932,3,'США'),
  ('Житухин','Михаил','Сергеевич',+79871846932,3,'Египет'),
  ('Нигматулин','Алексей','Игорьевич',+79871946932,3,'Дубаи'),
  ('Скоков','Иван','Игорьевич',+79872046932,3,'Франция'),
  ('Нигматулин','Алексей','Игорьевич',+79872146932,3,'Тайланд'),
  ('Шуркин','Александр','Вячеславович',+79872346932,3,'США'),
  ('Королева','Кскения','Николаевна',+79872046932,3,'Греция')


  SELECT Surname_Client,Name_Client,Middle_Name_Client,Phone,Number_of_people,Package
  FROM Client



  INSERT INTO Travel_packages (Travel_packages_cod,Employee_code,Client_сode,Tour_code,Date_of_sale) VALUES ('5501','00023','Макаров','Майами','15.04.2018'),
  ('5501','00024','Суханов','Майами','15.04.2018'),
  ('5501','00025','Шуркин','Лос-Анджелес','15.04.2018'),
  ('5501','00026','Дятлов','Париж','15.04.2018'),
  ('5501','00027','Житухин','Майами','15.04.2018'),
  ('5501','00028','Мухин','Рим','15.04.2018'),
  ('5501','00029','Марков','Майами','15.04.2018'),
  ('5501','00030','Петраков','Лос-Анджелес','15.04.2018'),
  ('5501','00031','Крутов','Майами','15.04.2018'),
  ('5501','00032','Страхов','Рим','15.04.2018'),
  ('5501','00033','Казаков','Майами','15.04.2018'),
  ('5501','00034','Королев','Лос-Анджелес','15.04.2018'),
  ('5501','00035','Фирсов','Майами','15.04.2018'),
  ('5501','00036','Румянцев','Стамбул','15.04.2018'),
  ('5501','00037','Малышев','Милан','15.04.2018')


  SELECT Travel_packages_cod,Employee_code,Client_сode,Tour_code,Date_of_sale
  FROM Travel_packages


  INSERT INTO Tours (Tour_code,Type_tour_cod,Start_date) VALUES ('Греция','Афины','12.02.2021'),
  ('Греция','Александрия','12.02.2021'),
  ('Греция','Карпенисион','12.02.2021'),
  ('Франция','Париж','13.10.2021'),
  ('Франция','Ницца','13.10.2021'),
  ('США','Сан-Франциско','20.05.2021'),
  ('США','Лос-Анджелес','15.05.2021'),
  ('США','Майами','17.03.2021'),
  ('США','Лас-Вегас','11.05.2021'),
  ('США','Нью-Йорк','11.05.2021'),
  ('Италия','Рим','05.09.2021'),
  ('Италия','Неаполь','05.09.2021'),
  ('Италия','Милан','11.12.2021'),
  ('Тайланд','Бангкок','11.11.2021'),
  ('Турция','Анкара','11.02.2021'),
  ('Турция','Стамбул','30.11.2021')


  SELECT Tour_code,Type_tour_cod,Start_date
  FROM Tours



  INSERT INTO Type_tour (City,Hotel,Flights,Price) VALUES ('Лос-Анджелес','Sonesta Los Angeles Airport LAX','Boeing 777',150000),
  ('Лос-Анджелес','Best Western Plus Commerce','Boeing 747',150000),
  ('Лос-Анджелес','Huntley Santa Monica Beach','Boeing 777',150000),
  ('Лос-Анджелес','Sheraton Gateway Los Angeles Hotel','Boeing 787',150000),
  ('Майами','Eurostars Langford','Boeing 747',100000),
  ('Майами','EVEN Hotel Miami - Airport, an IHG Hotel','Boeing 787',100000),
  ('Майами','Red Roof Inn PLUS+ Miami Airport','Boeing 767',100000),
  ('Сан-Франциско','Handlery Union Square Hotel','Bombardier CRJ200',160000),
  ('Сан-Франциско','Hotel Nikko San Francisco','Bombardier CRJ200',160000),
  ('Сан-Франциско','Hotel Caza Fishermans Wharf','Bombardier CRJ200',160000)


  SELECT City,Hotel,Flights,Price
  FROM Type_tour



  INSERT INTO Flights (Cod_Flights,Departure,Arrival,Number_of_available_seats,Сity_code,Airport_code,Price) VALUES ('Москва-Париж','20.05.2021','22.05.2021',20,58,'DME',50000),
  ('Москва-Рим','29.05.2021','01.06.2021',25,166,'DME',70000),
  ('Киров-Милан','20.05.2021','22.05.2021',30,155,'KVX',75000),
  ('Сочи-Стамбул','20.05.2021','22.05.2021',5,216,'AER',60000),
  ('Москва-Лос-Анджелес','20.05.2021','22.05.2021',18,323,'DME',150000),
  ('Волгоград-Афины','20.05.2021','22.05.2021',50,300,'	VOG',80000),
  ('Нижний Новгород-Майами','20.05.2021','22.05.2021',13,305,'GOJ',110000),
  ('Санкт-Петербург-Бангкок','20.05.2021','22.05.2021',10,585,'LED',50000)


  SELECT Cod_Flights,Departure,Arrival,Number_of_available_seats,Сity_code,Airport_code,Price
  FROM Flights



  INSERT INTO Airports (City) VALUES ('Москва'),
  ('Санкт-Петербург'),
  ('Екатеренбург'),
  ('Нижний Новгород'),
  ('Саратов'),
  ('Казань'),
  ('Сочи'),
  ('Самара'),
  ('Киров'),
  ('Волгоград'),
  ('Саранск'),
  ('Ставрополь'),
  ('Ульяновск'),
  ('Калуга'),
  ('Пенза')


  SELECT City
  FROM Airports



  INSERT INTO Aircraft (Name_Aircraft) VALUES ('Ан-225'),
  ('Sukhoi Superjet 100'),
  ('МС-21'),
  ('Ту-134'),
  ('Boeing 777'),
  ('Ан-124'),
  ('Airbus A380'),
  ('Boeing 747'),
  ('Ил-96'),
  ('Airbus A330'),
  ('Boeing 787 Dreamliner'),
  ('Ил-86'),
  ('Airbus A350'),
  ('Bombardier CRJ200'),
  ('Boeing 767')


  SELECT Name_Aircraft
  FROM Aircraft



  INSERT INTO Airplane (Name_Airplane,Mode_Airplanel,Date_Airplane,Cod_Airplane) VALUES ('Ан-225','',2021,''),
  ('Sukhoi Superjet 100','RRJ95',2021,'RRJ-95NEW-100'),
  ('Airbus A320neo','AA320',2021,'AIA-320-100'),
  ('Embraer E-Jet','EEJ',2021,'EEJ-100-100'),
  ('Boeing 777','B7',2021,'BOE-777-100'),
  ('Ан-124','A124',2021,'AH1-124-100'),
  ('Airbus A380','AA380',2021,'AIA-380-100'),
  ('Boeing 747','B7',2021,'BOE-747-100'),
  ('Ил-96','И96',2021,'ИЛ9-096-100'),
  ('Airbus A330','AA330',2021,'AIA-330-100'),
  ('Boeing 787 Dreamliner','B787D',2021,'BOE-787D-100'),
  ('Ил-86','И86',2021,'ИЛ8-086-100'),
  ('Airbus A350','AA350',2021,'AIA-350-100'),
  ('Bombardier CRJ200','BCRJ200',2021,'BCRJ-200-100'),
  ('Boeing 767','B767',2021,'BOE-767-100')


  SELECT Name_Airplane,Mode_Airplanel,Date_Airplane,Cod_Airplane
  FROM Airplane




  INSERT INTO Countries (Name) VALUES ('Греция'),
  ('Турция'),
  ('Тайланд'),
  ('США'),
  ('Франция'),
  ('Германия'),
  ('Финляндия'),
  ('Африка'),
  ('Франция'),
  ('Мексика'),
  ('Китай'),
  ('Япония'),
  ('Южная Коррея'),
  ('Италия'),
  ('Испания'),
  ('Куба')


  /*Удаление в тоблице странны, страну с последним id.*/

  SELECT * FROM Countries
  DELETE FROM Countries
  WHERE countries_cod=16



  SELECT Name
  FROM Countries



  INSERT INTO Cities (Name,Country_code) VALUES ('Нью-Йорк','США'),
  ('Лос-Анджелес','США'),
  ('Лас-Вегас','США'),
  ('Майами','США'),
  ('Сан-Франциско','США'),
  ('Афины','Греция'),
  ('Александрия','Греция'),
  ('Карпенисион','Греция'),
  ('Париж','Франция'),
  ('Ницца','Франция'),
  ('Рим','Италия'),
  ('Милан','Италия'),
  ('Неаполь','Италия'),
  ('Стамбул','Турция'),
  ('Анкара','Турция'),
  ('Бангкок','Тайланд')


  SELECT Name,Country_code
  FROM Cities




  INSERT INTO Hotels (Name,Сity,Number_of_stars) VALUES ('La Quinta by Wyndham LAX','Лос-Анджелес',3),
  ('Sonesta Los Angeles Airport LAX','Лос-Анджелес',4),
  ('Best Western Plus Commerce','Лос-Анджелес',3),
  ('Sheraton Gateway Los Angeles Hotel','Лос-Анджелес',4),
  ('Huntley Santa Monica Beach','Лос-Анджелес',4),
  ('Downtown Grand Hotel & Casino','Лас-Вегас',3),
  ('Plaza Hotel & Casino','Лас-Вегас',4),
  ('Hotel & Casino','Лас-Вегас',2),
  ('Ellis Island Hotel Casino & Brewery','Лас-Вегас',3),
  ('Hilton Vacation Club Polo Towers Las Vegas','Лас-Вегас',3),
  ('EVEN Hotel Miami - Airport, an IHG Hotel','Майами',3),
  ('Red Roof Inn PLUS+ Miami Airport','Майами',2),
  ('Eurostars Langford','Майами',4),
  ('Handlery Union Square Hotel','Сан-Франциско',3),
  ('Hotel Nikko San Francisco','Сан-Франциско',5),
  ('Hotel Caza Fishermans Wharf','Сан-Франциско',4),
  ('Hotel Nikko','Сан-Франциско',5)


  SELECT Name,Сity,Number_of_stars
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



/*Запрос с соединением Full,Outer*/

  SELECT *
  FROM Cities
  FULL OUTER JOIN Countries ON Cities.cities_cod= Countries.countries_cod


  SELECT *
  FROM Cities
  LEFT OUTER JOIN Client ON Cities.Country_code=Client.Package




/*Показать неиспользованные страны.*/

SELECT name FROM Countries
WHERE Name  NOT IN (select Country_code from Cities)




/*Сколько городов в каждой стране.*/

SELECT cities.Country_code, count(Countries.name) AS 'К-во'
FROM Countries
INNER JOIN Cities ON Cities.Country_code=countries.Name
GROUP BY Cities.Country_code




/*Показать страну, у которой больше 1 тура.*/

SELECT Tour_code, count (Client.id_client) AS 'К-во туров'
FROM Client
INNER JOIN Tours ON Tours.id_tours=Client.id_client
GROUP BY Tour_code
HAVING count (id_client) >1
ORDER BY count(id_client) DESC




/*Показать города, с самым большим к-вом отелей.*/

SELECT Hotels.Сity, count(cities.Name) AS 'К-во '
FROM Cities
INNER JOIN Hotels ON Hotels.Сity=Cities.Name
GROUP BY Hotels.Сity,Cities.Name
HAVING count(Cities.Name) = 
(select top 1 count(Name) AS MaxCount
FROM Hotels
GROUP BY (Сity)
ORDER BY count(Name) DESC)
