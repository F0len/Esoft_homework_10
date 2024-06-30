DELETE FROM Students
WHERE student_id = 2;

DELETE FROM Courses
WHERE course_id IN (
    SELECT *
    FROM Courses c
    LEFT JOIN Enrollments e ON c.course_id = e.course_id
    WHERE e.course_id IS NULL
);
