/* Приклади роботи з класом song */
DECLARE
    sn1 song;
BEGIN 
    sn1:= NEW song(1,'Червона калина');
	    dbms_output.put_line('get get_song_id: ' || pr1.get_song_id);
	    dbms_output.put_line('get get_sname: ' || pr1.get_sname);
    sn1.display();
END;
/

/* Приклад роботи з класами Song, User */
DECLARE 
    sn1 song;
    us1 user;
BEGIN 
    sn1:= song(1,'Червона_калина');
	sn1.display();
    us1:= user(1, 'nick', "+380815402635", '22');
    us1.display();
END;
/

/* Приклад роботи з класами song, user, song_category */
DECLARE 
    sn1 song;
    us1 user;
    ctg1 song_category;
BEGIN
    sn1:= song(1,'Червона_калина');
	sn1.display();
    us1:= user(1, 'nick', "+380815402635", '22');
    ctg1 := song_category(3, 'українські'); 
    ctg1.display(); 
END;
/

/* Приклад роботи з класами song, user, song_category, online_pleer */
DECLARE 
    sn1 song;
    us1 user;
	ctg1 song_category;
    plr1 online_pleer;
BEGIN 
     sn1:= song(1,'Червона_калина');
	sn1.display();
    us1:= user(1, 'nick', "+380815402635", '22');
    ctg1 := song_category(3, 'українські'); 
    plr1 := online_pleer(1, 'music', 'посилання')
    plr1.display(); 
END;
/

/* Приклад роботи з класами song, user, song_category, online_pleer */
DECLARE 
    sn1 song;
    us1 user;
	ctg1 song_category;
    plr1 online_pleer;
BEGIN 
     sn1:= song(1,'Червона_калина');
	sn1.display();
    us1:= user(1, 'nick', "+380815402635", '22');
    ctg1 := song_category(3, 'українські'); 
    plr1 := online_pleer(1, 'music', 'посилання')
    plr1.display(); 
END;
/* Приклад роботи з класами song, user, song_category, online_pleer, psychological_and_emotional_state */
DECLARE 
    sn1 song;
    us1 user;
	ctg1 song_category;
    plr1 online_pleer;
    psmst1 psychological_and_emotional_state;
BEGIN 
     sn1:= song(1,'Червона_калина');
	sn1.display();
    us1:= user(1, 'nick', "+380815402635", '22');
    ctg1 := song_category(3, 'українські'); 
    plr1 := online_pleer(1, 'music', 'посилання')
    psmst1 := psychological_and_emotional_state(1,sadness,56, негативний) 
    psmst1.display(); 
END;
