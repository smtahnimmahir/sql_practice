CREATE DATABASE BOOK_DB;
USE DATABASE BOOK_DB;

CREATE SCHEMA BOOK_SCHEMA;
USE SCHEMA BOOK_SCHEMA;

CREATE OR REPLACE TABLE USERS (
    ID NUMBER (6) AUTOINCREMENT START 100 INCREMENT 1,
    USERNAME VARCHAR (64) NOT NULL,
    ENABLED BOOLEAN DEFAULT TRUE,
    LAST_LOGIN TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID)
);

SELECT * FROM USERS;


INSERT INTO USERS (USERNAME, ENABLED)
VALUES
    ('TAHNIM', TRUE),
    ('MAHIR', FALSE);


CREATE OR REPLACE TABLE BOOKS(
    ID NUMBER (6) AUTOINCREMENT START 1 INCREMENT 1,
    TITLE VARCHAR (150) NOT NULL,
    AUTHOR VARCHAR (100) NOT NULL,
    PUBLISHED_DATE VARCHAR,
    ISBN NUMBER (13) UNIQUE,
    PRIMARY KEY(ID)
);

INSERT INTO BOOKS(TITLE, AUTHOR, PUBLISHED_DATE, ISBN)
VALUES
    ('shabname', 'Sayed Mujtabe Ali', '1960-01-01', 45465456746),
    ('Agun Pakhi', 'Hasan Azizul Haque', '1916-01-01', 45648686876),
    ('Porer Gohin Vitor', 'Sayed Shamsul Haque', NULL, 6741236355);

select * from books;


CREATE OR REPLACE TABLE REVIEWS (
    id number(6) AUTOINCREMENT START 1 INCREMENT 1,
    book_id number (6) not null,
    user_id number (6) not null,
    review_content varchar(255),
    rating decimal,
    published_date timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(ID) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(ID) ON DELETE CASCADE
);
select * from reviews;

INSERT INTO REVIEWS (book_id, user_id, review_content, rating)
values
    (7,100,'A Romantic Novel feels like a poetry', 3.5),
    (8,101, 'Abouyt Partition and love fopr Motherland', 4.8),
    (9, 102, 'Poetry: Love and seperation', 4.9);


-- Add  another column in the user table
alter table users
    add column EMAIL varchar (64);




















