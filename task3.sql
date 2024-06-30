UPDATE Students
SET address = '999 New Address St', phone_number = '1987654321'
WHERE student_id = 1;

UPDATE Courses
SET description = 'Updated description for Introduction to Psychology'
WHERE course_id = 1;

UPDATE Enrollments
SET grade = 'A'
WHERE enrollment_id = 4;
