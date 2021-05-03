CREATE TABLE users
(
    id int NOT NULL
    AUTO_INCREMENT,
    email varchar
    (255) NOT NULL,
    username varchar
    (255),
    password varchar
    (255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
    (id)
);

-- CREATE TABLE images
-- (
--     id int NOT NULL
--     AUTO_INCREMENT,
--     image varchar
--     (255) NOT NULL,
--     aboutImage varchar
--     (255),
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     PRIMARY KEY
--     (id)
-- );
