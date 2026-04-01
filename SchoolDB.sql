CREATE DATABASE SchoolDB;
GO

USE SchoolDB;
GO


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Budget DECIMAL(18, 2) NOT NULL,
    StartDate DATE NOT NULL
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    EnrollmentDate DATE NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Grade DECIMAL(3, 2)
);


-- INSERT SAMPLE DATA

INSERT INTO Departments (Name, Budget, StartDate) VALUES
('Computer Science', 120000.00, '2023-01-01'),
('Mathematics', 80000.00, '2023-01-01'),
('Physics', 90000.00, '2022-09-01'),
('Engineering', 150000.00, '2021-06-01');

INSERT INTO Instructors (FirstName, LastName, HireDate) VALUES
('John', 'Doe', '2020-08-15'),
('Jane', 'Smith', '2019-05-20'),
('Robert', 'Brown', '2021-03-10'),
('Emily', 'Davis', '2018-09-01');

INSERT INTO Courses (Title, Credits, DepartmentID) VALUES
('Introduction to Programming', 3, 1),
('Data Structures', 3, 1),
('Calculus I', 4, 2),
('Physics I', 4, 3),
('Database Systems', 3, 1),
('Linear Algebra', 3, 2);

INSERT INTO Students (FirstName, LastName, EnrollmentDate) VALUES
('Jane', 'Smith', '2023-09-01'),
('Michael', 'Johnson', '2023-09-01'),
('Emily', 'Williams', '2022-09-01'),
('Daniel', 'Jones', '2022-09-01'),
('Sophia', 'Brown', '2024-01-15');

INSERT INTO Enrollments (CourseID, StudentID, Grade) VALUES
(1, 1, 3.50),
(1, 2, 3.20),
(2, 1, 3.80),
(3, 3, 3.00),
(4, 4, 2.80),
(5, 2, 3.60),
(5, 5, NULL),
(6, 3, 3.40);

SELECT 'Database SchoolDB created successfully!' AS Status;