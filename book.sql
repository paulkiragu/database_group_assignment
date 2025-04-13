-- Table: book_language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

-- Table: book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    language_id INT,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Table: book_author (junction table for many-to-many relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

-- Insert data into book_language table
INSERT INTO book_language (language_name) VALUES 
('English'),
('Spanish'),
('French');

-- Insert data into author table
INSERT INTO author (first_name, last_name, birth_date) VALUES 
('John', 'Doe', '1980-05-14'),
('Jane', 'Smith', '1975-10-22'),
('Albert', 'Camus', '1913-11-07');

-- Insert data into book table
INSERT INTO book (title, publication_year, language_id, isbn) VALUES 
('The Stranger', 1942, 3, '123-4567890123'),
('The Catcher in the Rye', 1951, 1, '456-1234567890'),
('Don Quixote', 1605, 2, '789-0123456789');

-- Insert data into book_author table
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 3), -- 'The Stranger' by Albert Camus
(2, 1), -- 'The Catcher in the Rye' by John Doe
(3, 2); -- 'Don Quixote' by Jane Smith
