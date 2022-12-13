delimiter $$
create function ratio_booked_seats(Movie_id_ varchar(50),Theatre_id_ varchar(30))
returns float
deterministic
begin 
 	declare a int;
    declare b int;
	select count(t.Ticket_id) as booked_seats from ticket as t, showtime as st, movie as m
	where m.Movie_id=st.Movie_id and st.Showtime_id=t.Showtime_id and t.Booking_id is not null
	and m.Movie_id=Movie_id_ and st.Theatre_id=Theatre_id_ into a;
    
    select count(t.Ticket_id) as booked_seats from ticket as t, showtime as st, movie as m
	where m.Movie_id=st.Movie_id and st.Showtime_id=t.Showtime_id
	and m.Movie_id=Movie_id_ and st.Theatre_id=Theatre_id_ into b;
    
    return (a/b);

end $$
delimiter ;

-- drop function ratio_booked_seats;
