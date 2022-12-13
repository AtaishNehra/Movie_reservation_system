
create view ticket_information as select m.Title as 'Movie', s.room as 'Audi', s.row_ as 'Row',s.column_ as 'Seat', t.theatre_name as 'Theatre', t.theatre_address as 'Location', t.contact_number as 'Contact Number(Theatre)', 
b.booking_id as 'Booking_Confirmation_No', st.start_time as 'Form (time)' ,st.End_time as 'To'
from movie as m, seats as s, ticket as tr, booking as b, showtime as st, theatre as t
where m.movie_id=st.movie_id and st.showtime_id=b.showtime_id and t.theatre_id=st.theatre_id and st.Showtime_id = tr.Showtime_id
and tr.seat_id = s.seat_id and b.Booking_id = tr.Booking_id and tr.Booking_id is not null; 

drop view ticket_information;

select * from ticket_information where Booking_Confirmation_No = 'AxHLDH9iUreCtjQX';