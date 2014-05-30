CREATE TABLE articles (
  id serial,
  title varchar(100) NOT NULL,
  url varchar(500) NOT NULL,
  description varchar(1000) NOT NULL,
  created_at timestamp NOT NULL,
  completed_at timestamp
);
