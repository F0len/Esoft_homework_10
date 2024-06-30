CREATE VIEW StudentEnrollments AS
SELECT 
    s.*,
    c.course_name,
    c.credits,
    c.department,
    e.enrollment_date AS enrollment_date_c,
    e.grade
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
JOIN 
    Courses c ON e.course_id = c.course_id;
	
CREATE OR REPLACE PROCEDURE AddStudentAndEnroll(
	_course_id INT,
    _first_name VARCHAR,
    _last_name VARCHAR,
    _date_of_birth DATE,
    _email VARCHAR,
	_enrollment_date DATE,
    _phone_number VARCHAR DEFAULT NULL,
    _address VARCHAR DEFAULT NULL,
    _gpa NUMERIC(5, 2) DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    _student_id INT;
BEGIN
    INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number, address, enrollment_date, gpa)
    VALUES (_first_name, _last_name, _date_of_birth, _email, _phone_number, _address, _enrollment_date, _gpa)
    RETURNING student_id INTO _student_id;
    
    INSERT INTO Enrollments (student_id, course_id, enrollment_date)
    VALUES (_student_id, _course_id, CURRENT_DATE);
END;
$$;