 -- Project Tasks --

-- Task 1. Create a New Book Record.
-- "('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')".

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;


-- Task 2: Update an Existing Member's Address.

UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';
SELECT * FROM members;


-- Task 3: Delete a Record from the Issued Status Table.
-- (Objective: Delete the record with issued_id = 'IS121' from the issued_status table).

DELETE FROM issued_status
WHERE issued_id = 'IS140';
SELECT * FROM issued_status;


-- Task 4: Retrieve All Books Issued by a Specific Employee.
-- (Objective: Select all books issued by the employee with emp_id = 'E101').

SELECT *
FROM issued_status
WHERE issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book.
-- (Objective: Use GROUP BY to find members who have issued more than one book).

SELECT 
	issued_member_id,
	COUNT(*) AS total_books_issued
FROM issued_status
GROUP BY issued_member_id
HAVING COUNT(*) > 1
ORDER BY total_books_issued DESC;

-- Task 6: Find Total Rental Income by Category.

SELECT 
	b.category,
	SUM(b.rental_price) AS total_rental_income
FROM books AS b
JOIN issued_status AS i
ON b.isbn = i.issued_book_isbn
GROUP BY 1
ORDER BY 2 DESC;

-- Task 9: Retrieve the List of Books Not Yet Returned.

SELECT 
	i.issued_id,
	i.issued_book_name,
	i.issued_date,
	r.return_date
FROM issued_status AS i
LEFT JOIN return_status AS r
ON i.issued_id = r.issued_id
WHERE r.return_date IS NUll;


-- Task 10: Create a Table of Books with Rental Price Above a Certain Threshold.

CREATE TABLE premium_books AS
SELECT *
FROM books
WHERE rental_price >= 7;

SELECT *
FROM premium_books;

