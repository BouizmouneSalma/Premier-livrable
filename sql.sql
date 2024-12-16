CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role_id INT,
    CONSTRAINT fk_role
    FOREIGN KEY (role_id) REFERENCES roles(id)
);
create table roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_id INT,
    slug VARCHAR(255) NOT NULL UNIQUE,
    comments_count INT DEFAULT 0,
    CONSTRAINT fk_author
    FOREIGN KEY (author_id) REFERENCES users(id)
);
create table comments (
    id INTEGER  AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    article_id INTEGER NOT NULL,
    CONSTRAINT fk_comments FOREIGN KEY (author_id) REFERENCES users(id),
    CONSTRAINT FOREIGN KEY (article_id) REFERENCES articles(id)
);
create table tag (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    article_id INTEGER NOT NULL,
    CONSTRAINT fk_tags FOREIGN KEY (article_id) REFERENCES articles(id)
);

create table tag_article (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_id INTEGER NOT NULL,
    article_id INTEGER NOT NULL,
    CONSTRAINT fk_t FOREIGN KEY (tag_id) REFERENCES tag(id),
    CONSTRAINT fk_A FOREIGN KEY (article_id) REFERENCES articles(id),
    CONSTRAINT unique_tag_article UNIQUE (tag_id, article_id)
);
   
create table likes (
    id INTEGER AUTO_INCREMENT  PRIMARY KEY,
    user_id INTEGER NOT NULL,
    article_id INTEGER NOT NULL,
    CONSTRAINT fk_authors FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_articles FOREIGN KEY (article_id) REFERENCES articles(id)
);