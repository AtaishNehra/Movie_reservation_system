delimiter $$
create procedure new_showtime (in showtime_id varchar(50),Movie_id varchar(50),Theatre_id_ varchar(50),
Start_time timestamp, End_time timestamp, room_ varchar(50), total_price varchar(40), ticket_str varchar(10))
begin 
DECLARE i INT DEFAULT 0;
DECLARE n INT DEFAULT 0;
Select COUNT(*) from seats where theatre_id=theatre_id_  and room = room_ into n;
start transaction;
	insert into showtime(Showtime_id, Movie_id, Theatre_id, Start_time, End_time, room) 
    values (Showtime_id, Movie_id, Theatre_id_, Start_time, End_time, room_);

	set i = 0;
	WHILE i<n DO 
		insert into ticket(Ticket_id, Seat_id, Showtime_id, Booking_id, Price) 
		values (concat(ticket_str,cast(i as char)),(select seat_id from seats where Theatre_id=Theatre_id_ and room=room_ limit i,1), 
        Showtime_id, null, total_price);
		SET i = i + 1;
    END WHILE;
commit;
end $$
delimiter ;

-- drop procedure new_showtime;
