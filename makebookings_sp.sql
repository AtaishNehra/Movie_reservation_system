-- sp for insert, update
delimiter $$
create procedure make_bookings(
in bookingid varchar(50),
in userid varchar(50),
in showtimeid varchar(50),
in paymentid varchar(50),
in ticketid1 varchar(50),
in ticketid2 varchar(50),
in ticketid3 varchar(50),
in ticketid4 varchar(50),
in cnum varchar(50),
in tp integer
)
begin
insert into payment(Payment_id, card_number) 
values (paymentid, cnum);

insert into booking(Booking_id, user_id, Showtime_id, total_price, Payment_id) 
values (bookingid, userid, showtimeid, tp, paymentid);

update ticket set Booking_id = bookingid 
where showtime_id=showtimeid and ticket_id in (ticketid1,ticketid2,ticketid3,ticketid4);
end $$
delimiter ;
