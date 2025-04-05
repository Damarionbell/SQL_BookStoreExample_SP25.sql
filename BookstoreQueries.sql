-- Task 1: List Book Details
SELECT
    b.title AS BookTitle,
    CONCAT(a.first_name, ' ', a.last_name) AS AuthorName,
    p.name AS PublisherName,
    b.price AS BookPrice
FROM
    Books b
        JOIN
    Authors a ON b.author_id = a.author_id
        JOIN
    Publishers p ON b.publisher_id = p.publisher_id;

-- Task 2: Books by Category
SELECT
    b.category AS BookCategory,
    COUNT(*) AS NumberOfBooks
FROM
    Books b
GROUP BY
    b.category;

-- Task 3: Top Authors
SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS AuthorName,
    COUNT(b.book_id) AS NumberOfBooks
FROM
    Authors a
        JOIN
    Books b ON a.author_id = b.author_id
GROUP BY
    a.author_id, a.first_name, a.last_name
ORDER BY
    NumberOfBooks DESC
    LIMIT 3;

-- Task 4: Sales Insights (if Sales/Orders data is available)
-- Assuming there's a Sales table with book_id and quantity columns
SELECT
    b.title AS BookTitle,
    SUM(s.quantity) AS TotalSales
FROM
    Sales s
        JOIN
    Books b ON s.book_id = b.book_id
GROUP BY
    b.book_id, b.title
ORDER BY
    TotalSales DESC
    LIMIT 5;

-- Task 5: Price Analysis
SELECT
    p.name AS PublisherName,
    AVG(b.price) AS AveragePrice
FROM
    Books b
        JOIN
    Publishers p ON b.publisher_id = p.publisher_id
GROUP BY
    p.publisher_id, p.name;

-- Task 6: Recent Publications
-- Assuming the publication_date column is a DATE or DATETIME
SELECT
    b.title AS BookTitle,
    b.publication_date AS PublicationDate,
    b.category AS BookCategory
FROM
    Books b
WHERE
    YEAR(CURDATE()) - YEAR(b.publication_date) <= 2;
