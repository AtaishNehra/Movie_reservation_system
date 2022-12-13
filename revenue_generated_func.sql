delimiter $$
create function revenue_generated(movid varchar(100))
returns int
deterministic
begin 
 	declare a int;
    declare b int;
	
	select sum(t.price) from ticket as t, showtime as st, movie as m
	where m.Movie_id=st.Movie_id and st.Showtime_id=t.Showtime_id and m.movie_id=movid and t.Booking_id is not null
    into a;
    
    select count(t.Ticket_id) as booked_seats from ticket as t, showtime as st, movie as m
	where m.Movie_id=st.Movie_id and st.Showtime_id=t.Showtime_id and m.movie_id=movid and t.Booking_id is not null into b; 

    return (a*b);

end $$
delimiter ;
