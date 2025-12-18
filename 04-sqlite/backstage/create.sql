CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	login TEXT, 
	name TEXT, 
	email TEXT, 
	birthday TEXT,
	age INTEGER
);

INSERT INTO users (login,name,email,birthday,age) SELECT 
  json_extract(value, '$.login'),
  json_extract(value, '$.name'),
  json_extract(value, '$.email'),
  json_extract(value, '$.birthday'),
  json_extract(value, '$.age')
FROM json_each(readfile('user.json'));


