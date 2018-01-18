
CREATE DATABASE ausab;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(300),
  email VARCHAR(300),
  password_digest VARCHAR(400) NOT NULL,
  img_url VARCHAR(400)
);


CREATE TABLE houses (
  id SERIAL PRIMARY KEY,
  city TEXT,
  address TEXT,
  title TEXT,
  guest TEXT,
  beds TEXT,
  bath TEXT,
  kitchen TEXT,
  headlines TEXT,
  about_space TEXT,
  guest_access TEXT,
  cancellations TEXT,
  house_rules TEXT,
  house_image1 TEXT,
  house_image2 TEXT,
  house_image3 TEXT,
  house_image4 TEXT,
  house_image5 TEXT,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id)
  REFERENCES users (id)
  ON DELETE RESTRICT,
  city_id INTEGER NOT NULL,
  FOREIGN KEY (city_id)
  REFERENCES cities (id)
  ON DELETE RESTRICT
);
-- #drop table houses cascade;

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name VARCHAR(300)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body VARCHAR(500) NOT NULL,
  house_id INTEGER NOT NULL,
  FOREIGN KEY (house_id)
  REFERENCES houses (id)
  ON DELETE RESTRICT,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id)
  REFERENCES users (id)
  ON DELETE RESTRICT
);

ALTER TABLE comments ADD COLUMN created_at TIMESTAMP;
comment = Comment.new
comment.body
comment.user_id
comment.house_id
comment.save
comment.created_at.strftime('%y %m %d')
comment.created_at.to_s(:long)
comment.created_at.to_s(:short)



--
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   email VARCHAR(300) NOT NULL,
--   password_digest VARCHAR(400) NOT NULL
-- );

INSERT INTO dishes (name, img_url) VALUES ('pudding',
  'http://housebeautiful.cdnds.net/15/51/1450289315-image0032.png');
