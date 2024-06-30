CREATE DATABASE UniversityDB;

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT,
    enrollment_date DATE NOT NULL,
    gpa NUMERIC(5, 2)
);
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    credits INTEGER NOT NULL,
    department VARCHAR(100) NOT NULL
);
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES Students(student_id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES Courses(course_id) ON DELETE CASCADE,
    enrollment_date DATE NOT NULL,
    grade NUMERIC(5, 2)
);
