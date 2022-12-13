
delimiter $$
create trigger update_creditscore after Update on ticket
for each row
begin
	if (new.booking_id is not null and new.booking_id <> old.booking_id) then
	update user
	set credit_score = credit_score + 15
	where user.user_id in (select user_id from booking inner join ticket on booking.booking_id = ticket.booking_id where booking.booking_id = new.booking_id group by user_id);
    end if;
end $$
delimiter ;

