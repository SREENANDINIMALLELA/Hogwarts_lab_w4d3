
DROP TABLE students;
DROP TABLE houses;
CREATE TABLE houses(
 id SERIAL4 primary key,
 name VARCHAR(255),
 url VARCHAR(255)
);


CREATE TABLE students (
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT4 REFERENCES houses(id),
  age INT4
);
