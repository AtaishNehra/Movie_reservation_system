delimiter $$
create procedure new_movie (in Movie_id varchar(50),Title varchar(100),Overview varchar(5000),
Duration varchar(100),Release_date date,original_language varchar(32),age_type varchar(10), 
 genre1 varchar(50), genre2 varchar(50), 
Actor_id varchar(50),
actor_name varchar(50),
director_id varchar(50),
director_name varchar(50))
begin 
DECLARE i INT DEFAULT 0;
DECLARE n INT DEFAULT 0;
DECLARE DIRID varchar(50);
DECLARE ACTID varchar(50);
start transaction;

	
	insert into movie(Movie_id,Title,Overview,Duration,Release_date,original_language,age_type) 
	values (Movie_id,Title,Overview,Duration,Release_date,original_language,age_type);
    
    select count(*) from genre where genre_id in (genre1,genre2) into n;
    set i = 0;
    while i < n do
    insert into movie_genre(Movie_id,Genre_id) 
    values (Movie_id,(select genre_id from genre where genre_id in (genre1,genre2) limit i,1));
    set i = i+1;
    end while;
    
    if (exists (select * from movie_cast inner join movie_director on movie_cast.cast_id = movie_director.director_id where movie_cast.full_name = director_name))
    then
	select cast_id from movie_cast where movie_cast.full_name = director_name into dirid;
	insert into movie_director(Director_id,Movie_id) 
    values (dirid,Movie_id);
    else
    insert into movie_cast(Cast_id,full_name) 
    values (Director_id,director_name);
	insert into movie_director(Director_id,Movie_id) 
    values (Director_id,Movie_id);
    end if;
    
    if (exists (select * from movie_cast inner join movie_actor on movie_cast.cast_id = movie_actor.actor_id where movie_cast.full_name = actor_name))
    then
    select cast_id from movie_cast where movie_cast.full_name = ator_name into actid;
    insert into movie_actor(Actor_id,Movie_id) 
    values (actid,Movie_id);
    else
    insert into movie_cast(Cast_id,full_name) 
    values (Actor_id,actor_name);
    insert into movie_actor(Actor_id,Movie_id) 
    values (Actor_id,Movie_id);
    end if;
	
commit;
end $$
delimiter ;

-- drop procedure if exists new_movie;

call new_movie("LeMvaoEkMHntHPeC","Raat Pasine ki","Bohot geela hai sab!","2","2022-10-23","Hindi Desi","P","5f684eaee5f57c315cac401b","5f684eaee5f57c315cac401e","ygEJlzv6bOmj8xnJ","Khiladi 786","hwynzwIVIFmB0iWe","Woo Min-ho");

-- call new_movie('398','Raat ke mehek','Choot ki khushboo','9987','2023-10-23','Punjabi','P','5295','Adventure','900','Sir Lundfakeer',
-- '2798','253','5f68b34045ab693e24bd9d70');
