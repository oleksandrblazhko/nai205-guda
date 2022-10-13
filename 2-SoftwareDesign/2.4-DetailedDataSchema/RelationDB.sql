
CREATE TABLE Користувачка(
id_користувачки SERIAL PRIMARY KEY,
Нік varchar,
Телефон int,
Вік int
);

CREATE TABLE Онлайн-плеєр(
id_онлайн-плеєру SERIAL PRIMARY KEY,
id_користувачки int references Користувачка(id_користувачки) ON DELETE CASCADE,
Назва varchar,
Посилання varchar
);

CREATE TABLE Пісня(
id_пісні SERIAL PRIMARY KEY,
назва nchar(50),
рік виходу int,
тривалість пісні float
  );

CREATE TABLE user_song(
id_користувачки int references Користувачка(id_користувачки) ON DELETE CASCADE,
id_пісні int references Пісня(id_пісні) ON DELETE CASCADE,
primary key(id_користувачки, id_пісні)
);

CREATE TABLE Категорія_пісень(
id_категорія_пісні SERIAL PRIMARY KEY,
id_онлайн_плеєру int references Онлайн-плеєр (id_онлайн_плеєру) ON DELETE CASCADE,
назва varchar
);

CREATE TABLE user_song_category(
id_користувачки int references Користувачка(id_користувачки) ON DELETE CASCADE,
id_категорія_пісні int references Категорія_пісень(id_категорія_пісні) ON DELETE CASCADE,
primary key(id_користувачки, id_категорія_пісні)
);

CREATE TABLE song_song_category(
id_пісні SERIAL references Пісня(id_пісні) ON DELETE CASCADE,
id_категорія_пісні int references Категорія_пісень(id_категорія_пісні) ON DELETE CASCADE,
primary key(id_пісні, id_категорія_пісні)
);

CREATE TABLE Психологічно-емоційний стан(
id_психологічного_і_емоційного стану SERIAL PRIMARY KEY,
id_категорія_пісні int references Категорія_пісень (id_категорія_пісні) ON DELETE CASCADE,
id_користувачки int references Користувачка (id_користувачки) ON DELETE CASCADE,
емоція varchar,
тривалість емоції int,
тип емоції nchar(50)
);
