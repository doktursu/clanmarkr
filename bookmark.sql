DROP TABLE bookmarks;

CREATE TABLE bookmarks (
  id SERIAL8 primary key,
  url VARCHAR(255) not null,
  title VARCHAR(255) not null,
  genre VARCHAR(255),
  modified timestamp default current_timestamp
);


CREATE OR REPLACE FUNCTION update_modified_column() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';

CREATE TRIGGER update_bookmarks_modtime BEFORE UPDATE ON bookmarks FOR EACH ROW EXECUTE PROCEDURE  update_modified_column();

INSERT INTO bookmarks (url, title, genre) VALUES ('https://google.com', 'Google', 'search engine');
INSERT INTO bookmarks (url, title, genre) VALUES ('https://twitter.com', 'Twitter', 'social media');