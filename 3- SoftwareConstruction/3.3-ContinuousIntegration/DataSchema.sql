CREATE TABLE user(
id_user SERIAL PRIMARY KEY,
nick varchar,
phone int,
age int
);

CREATE TABLE online_pleer(
id_online_pleer SERIAL PRIMARY KEY,
id_user int references user(id_user) ON DELETE CASCADE,
name varchar,
link varchar
);

CREATE TABLE song(
id_song SERIAL PRIMARY KEY,
name nchar(50),
year int,
song_duration float
  );

CREATE TABLE user_song(
id_user int references user(id_user) ON DELETE CASCADE,
id_song int references song(id_song) ON DELETE CASCADE,
primary key(id_song, id_song)
);

CREATE TABLE song_category(
id_song_category SERIAL PRIMARY KEY,
id_online_pleer int references online_pleer (id_online_pleer) ON DELETE CASCADE,
name varchar
);

CREATE TABLE user_song_category(
id_user int references user(id_user) ON DELETE CASCADE,
id_song_category int references song_category(id_song_category) ON DELETE CASCADE,
primary key(id_user, id_song_category)
);

CREATE TABLE song_song_category(
id_song SERIAL references song(id_song) ON DELETE CASCADE,
id_song_category int references song_category(id_song_category) ON DELETE CASCADE,
primary key(id_song, id_song_category)
);

CREATE TABLE psychological_and_emotional_state(
id_psychological_and_emotional_state SERIAL PRIMARY KEY,
id_song_category int references song_category (id_song_category) ON DELETE CASCADE,
id_user int references user (id_user) ON DELETE CASCADE,
emotion varchar,
emotion_duration int,
emotion_type nchar(50)
);
