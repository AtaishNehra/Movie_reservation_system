use theatre;

create table User 
(user_id varchar(50) primary key,
full_name varchar(100), 
email varchar(80) unique not null, 
phone_number varchar(12), 
address varchar (500),
gender varchar(100),
role varchar(100));
-- done

create table Movie
(Movie_id varchar(50) primary key, 
Title varchar(100),
Overview varchar(5000),
Duration varchar(100),
Release_date date,
original_language varchar(32),
age_type varchar(10));
-- done

create table Theatre
(Theatre_id varchar(30) primary key, 
Theatre_Name varchar(100),
Theatre_Address varchar(500),
contact_number varchar(100),
email varchar(150),
opening_hours varchar(150));
-- done

create table Showtime
(Showtime_id varchar(50) primary key,
Movie_id varchar(50),
Theatre_id varchar(50),
Start_time timestamp,
End_time timestamp,
room varchar(50),
foreign key (Movie_id) references Movie(Movie_id) on delete cascade,
foreign key (Theatre_id) references Theatre(Theatre_id) on delete cascade);
-- done

create table Payment
(Payment_id varchar(50) primary key, 
card_number varchar(100));
-- done


create table Booking
(Booking_id varchar(50) primary key, 
user_id varchar(50),
Showtime_id varchar(50),
total_price integer not null,
Payment_id varchar(50),
foreign key (Showtime_id) references Showtime(Showtime_id) on delete cascade,
foreign key (Payment_id) references Payment(Payment_id) on delete cascade,
foreign key (user_id) references User(user_id) on delete cascade);
-- done

create table Rating
(Rating_id varchar(50) primary key, 
user_id varchar(50),
Movie_id varchar(50),
comment varchar(1000),
rate_star varchar(10),
foreign key (Movie_id) references Movie(Movie_id) on delete cascade,
foreign key (user_id) references User(user_id) on delete cascade);
-- done

create table Genre
(Genre_id varchar(50) primary key, 
Name varchar(100));
-- done

create table Movie_genre
(Movie_id varchar(50),
Genre_id varchar(50),
primary key (Movie_id,Genre_id), 
foreign key (Movie_id) references Movie(Movie_id) on delete cascade,
foreign key (Genre_id) references Genre(Genre_id) on delete cascade);
-- done



create table Movie_cast
(Cast_id varchar(50) primary key, 
full_name varchar(150));
 -- done
 
create table Movie_director
(Director_id varchar(50), 
Movie_id varchar(50),
primary key (Director_id,Movie_id),
foreign key (Movie_id) references Movie(Movie_id) on delete cascade,
foreign key (Director_id) references Movie_cast(Cast_id) on delete cascade);
 -- done
 
create table Movie_actor
(Actor_id varchar(50), 
Movie_id varchar(50),
primary key (Actor_id,Movie_id),
foreign key (Movie_id) references Movie(Movie_id) on delete cascade,
foreign key (actor_id) references Movie_cast(Cast_id) on delete cascade);
-- done


create table Theatre_room
(Theatre_id varchar(30), 
room_number varchar(300),
room_type varchar(5),
primary key(Theatre_id,room_number),
foreign key (Theatre_id) references Theatre(Theatre_id) on delete cascade);
-- done


create table Seats
(Seat_id varchar(50) primary key, 
Theatre_id varchar(50),
room varchar(100),
row_ varchar(100),
column_ varchar(100),
foreign key (Theatre_id) references Theatre(Theatre_id) on delete cascade);
-- done

create table Ticket
(Ticket_id varchar(50) primary key, 
Seat_id varchar(50),
Showtime_id varchar(50),
Booking_id varchar(50),
Price integer,
foreign key (Showtime_id) references Showtime(Showtime_id) on delete cascade,
foreign key (Booking_id) references Booking(Booking_id) on delete cascade,
foreign key (Seat_id) references Seats(Seat_id) on delete cascade);
-- done

