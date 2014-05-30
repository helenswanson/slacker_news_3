CREATE TABLE articles (
  id serial,
  title varchar(100) NOT NULL,
  url varchar(500) NOT NULL,
  description varchar(1000) NOT NULL,
  created_at timestamp NOT NULL,
  completed_at timestamp
);

INSERT INTO articles (title, url, description, created_at, completed_at)
  VALUES ('THE 6 BEST TOOLS FOR CREATIVE WORK, ACCORDING TO SCIENCE', 'http://www.fastcompany.com/3029293/work-smart/the-6-best-tools-for-creative-work-according-to-science', 'see title', NOW(), NOW());
