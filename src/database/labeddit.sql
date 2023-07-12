-- Active: 1689203438281@@127.0.0.1@3306

CREATE TABLE
    users (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT NOT NULL
    );

CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER NOT NULL,
        dislikes INTEGER NOT NULL,
        comments INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    );

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    );

CREATE TABLE
    coments (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        coment TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) 
            ON UPDATE CASCADE 
            ON DELETE CASCADE
    );