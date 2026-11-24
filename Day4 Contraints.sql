USE Practice;
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(30)
);

-- Create Employees table with constraints.
CREATE TABLE Employees1 (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(30) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Age INT CHECK (Age >= 18),
    City VARCHAR(30) DEFAULT 'Agra',
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');


INSERT INTO Employees1 (Emp_ID, Emp_Name, Email, Age, City, Dept_ID)
VALUES
(101, 'Aamir', 'aamir@example.com', 23, 'Agra', 1),
(102, 'Rahul', 'rahul@example.com', 25, 'Delhi', 2),
(103, 'Sameer', 'sameer@example.com', 22, 'Agra', 1),
(104, 'Aman', 'aman@example.com', 26, 'Jaipur', 3),
(105, 'Rohit', 'rohit@example.com', 24, 'Delhi', 2);

-- View records.
SELECT * FROM Departments;
SELECT * FROM Employees1;

INSERT INTO Employees1 (Emp_ID, Emp_Name, Email, Age, Dept_ID)
VALUES (106, 'Karan', 'karan@example.com', 27, 1);

SELECT * FROM Employees1 WHERE Emp_ID = 106;

-- TEST THESE ONE AT A TIME (uncomment a query to see its constraint error).

-- PRIMARY KEY: duplicate Emp_ID is not allowed.
-- INSERT INTO Employees VALUES (101, 'Test', 'test1@example.com', 23, 'Agra', 1);

-- NOT NULL: Emp_Name cannot be NULL.
-- INSERT INTO Employees VALUES (107, NULL, 'test2@example.com', 23, 'Agra', 1);

-- UNIQUE: duplicate Email is not allowed.
-- INSERT INTO Employees VALUES (108, 'Test', 'aamir@example.com', 23, 'Agra', 1);

-- CHECK: Age must be 18 or above.
-- INSERT INTO Employees VALUES (109, 'Test', 'test3@example.com', 16, 'Agra', 1);

-- FOREIGN KEY: Dept_ID 99 does not exist in Departments.
-- INSERT INTO Employees VALUES (110, 'Test', 'test4@example.com', 23, 'Agra', 99);

-- PRACTICE TASKS
-- 1. Add a new department.
-- 2. Add an employee to that department.
-- 3. Test duplicate email.
-- 4. Test age below 18.
-- 5. Insert an employee without City and check DEFAULT.
