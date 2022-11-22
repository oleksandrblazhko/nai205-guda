/* Створення об'єктного типу (класу) user */
CREATE OR REPLACE TYPE user AS OBJECT (
	id_user INT,
nick varchar,
phone int,
age int
    	NOT FINAL MEMBER PROCEDURE display
) NOT FINAL 
/

/* Створення типу для зберігання списку користувачів - "Колекція екземплярів об`єктів класу user */
CREATE TYPE user_List IS TABLE OF user;
/



/* Cтворення об'єктного типу (класу) psychological_and_emotional_state , що успадковує об'єктний тип user */
CREATE OR REPLACE TYPE psychological_and_emotional_state UNDER user and song_category (
	id_psychological_and_emotional_state int,
emotion varchar,
emotion_duration int,
emotion_type nchar(50)
);
    	OVERRIDING MEMBER PROCEDURE display 
);
/


/* Створення об'єктного типу (класу) online_pleer */
CREATE OR REPLACE TYPE online_pleer AS OBJECT (
	id_online_pleer int,
name varchar,
link varchar
    	MEMBER PROCEDURE display
); 
/


/* Створення об'єктного типу (класу) song_category */
CREATE OR REPLACE TYPE song_category AS OBJECT (
	id_song_category int,
name varchar
);
/

/* Створення об'єктного типу (класу) song, що успадковує, об'єктний тип song_category */
CREATE OR REPLACE TYPE song  UNDER song_category (
	id_song int,
name nchar(50),
year int,
song_duration float
  );


	/* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) s_sname - назва пісні
	   умова 1) якщо в таблиці song вже існує вказана пісня,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці song створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION song(s_song VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_ssong(s_song_id NUMBER, s_sname VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_ssong_id RETURN NUMBER,
		MEMBER FUNCTION get_sname RETURN VARCHAR,
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
