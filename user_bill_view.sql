create view user_bill as select p.payment_id as Bill_Number, m.Title as 'Movie', t.theatre_name as 'Theatre', t.contact_number as 'Theatre Contact Number', 
u.full_name as 'Payee', u.email as 'User Email', b.total_price as 'Amount Paid'
from movie as m, user as u, payment as p, booking as b, theatre as t, showtime as st
where p.payment_id=b.payment_id and u.user_id=b.user_id and st.Movie_id=m.Movie_id
and st.Theatre_id=t.Theatre_id and b.Showtime_id=st.Showtime_id;

drop view user_bill;

select * from user_bill where Bill_Number = 'u9MmwCkMwQLrO7O8';