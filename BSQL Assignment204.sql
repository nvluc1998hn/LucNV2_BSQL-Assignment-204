--table Movi --
CREATE TABLE Movie(
    id_movie int not null IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	duration time,
	check(duration >= '1:00:00'),
	genre TINYINT not null,
	check(genre BETWEEN  1 and 8),
	director nvarchar(50),
	amount decimal(18,2) not null
)
CREATE TABLE Actor(
    id_actor int not null IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50),
	age TINYINT ,
	average_salary decimal(18,2),
	nationality nvarchar(50)
)
CREATE TABLE ActedIn(
   id_actedin int not null IDENTITY(1,1) primary key,
   id_actor int not null FOREIGN KEY REFERENCES Actor(id_actor),
   id_movie int not null FOREIGN KEY REFERENCES Movie(id_movie)
)
--query 3--
ALTER TABLE Movie 
ADD ImageLink  varchar(50) not null unique
 
 INSERT INTO Movie(name,duration,genre,director,amount)
 VALUES(N'Tôi đi code dạo','1:30:00',1,'A',195.000)

  INSERT INTO Movie(name,duration,genre,director,amount)
 VALUES(N'Ngân Hà','1:30:00',2,'A',195.000)

  INSERT INTO Movie(name,duration,genre,director,amount)
 VALUES(N'Minh Hoàng','1:30:00',1,'A',195.000)

  INSERT INTO Movie(name,duration,genre,director,amount)
 VALUES(N'Hiếu Ngu','1:30:00',5,'A',195.000)

  INSERT INTO Movie(name,duration,genre,director,amount)
 VALUES(N'Ngu Hiếu','1:30:00',8,'A',195.000)
 --INSERT Actor--
 INSERT INTO Actor(name,age,average_salary)
 values('Luc',18,10000000)

 INSERT INTO Actor(name,age,average_salary)
 values('Tuan',18,10000000)
 --INSERT ActedIn--
 INSERT INTO ActedIn(id_actor,id_movie)
 values(1,2)
  
 INSERT INTO ActedIn(id_actor,id_movie)
 values(2,1)



 select *from Actor
 where age > 50
 drop table Movie
 select name,average_salary from Actor 
 order by(average_salary)
 --query4-- 
 select Movie.name,Actor.name
 from Movie
 Inner join ActedIn on ActedIn.id_movie=Movie.id_movie
 inner join Actor on ActedIn.id_actor=Actor.id_actor
 --query 5--
 select Movie.name, COUNT(ActedIn.id_movie) as solanxuathien
 from ActedIn
 Inner join Movie on ActedIn.id_movie=Movie.id_movie and Movie.genre=1
 inner join Actor on ActedIn.id_actor=Actor.id_actor
 group by ActedIn.id_movie,Movie.name
 having count(*) >= 2
 
