delimiter $$
create function calc_discount(user_iden varchar(50),old_bill int)
returns int
deterministic
begin
	declare num_old_booking int;
    declare new_card int;
    select credit_score into num_old_booking from user where user_id = user_iden;
    if num_old_booking > 15 then
    return old_bill - num_old_booking * 0.30;
    else
    return old_bill;
    end if;
end $$




delimiter ;


