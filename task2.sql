-- Простите, лень было придумывать, тестовые данные сгенерил с помощью GPT

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
VALUES
('John', 'Doe', '2000-01-15', 'john.doe@example.com', '1234567890', '123 Main St', '2019-09-01', 3.5),
('Jane', 'Smith', '1999-05-23', 'jane.smith@example.com', NULL, '456 Elm St', '2018-09-01', 3.8),
('Alice', 'Johnson', '2001-07-30', 'alice.johnson@example.com', '9876543210', '789 Maple Ave', '2020-09-01', NULL),
('Bob', 'Brown', '2000-02-14', 'bob.brown@example.com', '5555555555', '321 Oak St', '2019-09-01', 3.2),
('Charlie', 'Davis', '1998-11-20', 'charlie.davis@example.com', NULL, '654 Pine Rd', '2017-09-01', 3.9);

INSERT INTO Courses (course_name, description, credits, department)
VALUES
('Introduction to Psychology', 'Basic concepts in psychology', 3, 'Psychology'),
('Calculus I', 'Introduction to differential and integral calculus', 4, 'Mathematics'),
('World History', 'Survey of world history from ancient to modern times', 3, 'History');


INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2019-09-01', 92),
(2, 1, '2018-09-01', 67),
(3, 2, '2020-09-01', 78),
(4, 3, '2019-09-01', NULL),
(5, 2, '2017-09-01', 61);
