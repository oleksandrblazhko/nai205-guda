/* Методи класу song */
CREATE OR REPLACE TYPE BODY song AS
  /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	    1) s_sname - назва пісні
	   умова 1) якщо в таблиці song вже існує вказана пісня,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці song створюється новий рядок з одночасним
	   створюється екземпляр класу 
	  Вихідний параметр - екземпляр обєкту класу */
    CONSTRUCTOR FUNCTIONS song (s_sname VARCHAR)
        RETURN SELF AS RESULT,
    IS
        v_song_id song.song_id%TYPE;
    BEGIN
        SELECT song_id INTO v_song_id
        FROM song
        WHERE 
            name = s_sname;
        SELF.song_id := v_song_id;
        SELF.name := s_sname;
        RETURN;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        INSERT INTO song (name)
            VALUES ( s_sname)
        RETURNING song_id INTO v_song_id;
        SELF.song_id := v_song_id;
        SELF.name := s_sname;
        RETURN;
    END Song;
    
        /* Процедура зміни значень атрибутів */
	      MEMBER PROCEDURE set_sname(s_song_id NUMBER, s_sname VARCHAR)
	      IS
	      BEGIN
        UPDATE song SET name = sname
		      WHERE song_id = s_song_id;
		      SELF.name := s_sname;
	      END set_sname;
    
        /* Функції отримання значень атрибутів */
	      /* get_song_id */
        MEMBER FUNCTION get_song_id
	        RETURN NUMBER 
	      IS
        BEGIN
          RETURN SELF.song_id;
        END get_song_id;
        
        /* get_pname */
        MEMBER FUNCTION get_sname
	        RETURN VARCHAR 
	      IS
        BEGIN
          RETURN SELF.name;
        END get_sname;

        /* Процедура виводу на екран значень атрибутів */
        MEMBER PROCEDURE display 
        IS
        BEGIN 
          dbms_output.put_line('song_id: ' || song_id);
          dbms_output.put_line('name: ' || name);
        END display;
END; 
/
