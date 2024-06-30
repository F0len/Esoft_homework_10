--Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии.
SELECT s.*
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 2
ORDER BY s.last_name;

--Получите список курсов с указанием количества студентов, зачисленных на каждый курс.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
--Получите список студентов, которые имеют средний балл (GPA) выше определенного значения.
SELECT *
FROM Students
WHERE gpa > 3.6
--Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.
SELECT s.first_name, s.last_name, c.course_name, e.enrollment_date, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.enrollment_date >= CURRENT_DATE - INTERVAL '1 month';

--Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления.
SELECT *
FROM Students
WHERE phone_number IS NULL
ORDER BY enrollment_date;

--Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов.
SELECT *
FROM Courses
WHERE department = 'Psychology'
ORDER BY credits DESC;
--Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам.
SELECT s.*, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;
--Получите список студентов, которые зачислены более чем на один курс.
SELECT s.*
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING COUNT(e.course_id) > 1;
--Получите список студентов, которые зачислены на курсы из разных департаментов.
SELECT s.*
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id
HAVING COUNT(DISTINCT c.department) > 1;
--Получите список курсов, на которые не зачислен ни один студент.
SELECT c.*
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
--Получите список студентов, которые зачислены на все курсы из определенного департамента.
SELECT s.*, COUNT(DISTINCT c.course_id)
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.department = 'Psychology'
GROUP BY s.student_id
HAVING COUNT(DISTINCT c.course_id) = (SELECT COUNT(*) FROM Courses WHERE department = 'Psychology');
--Найдите студентов, которые зачислены на курс с наибольшим количеством кредитов.
SELECT s.*
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.credits = (SELECT MAX(credits) FROM Courses);
--Получите средний балл (GPA) для каждого студента, который зачислен на курсы, и отсортируйте студентов по этому среднему баллу.
SELECT s.*, AVG(e.grade) AS average_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY average_grade DESC NULLS LAST;
--Получите список студентов, которые были зачислены на курсы в течение последнего года.
SELECT DISTINCT s.*
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_date >= CURRENT_DATE - INTERVAL '1 year';
--Получите список студентов и их количество курсов, на которые они зачислены, отсортированный по количеству курсов.
SELECT s.*, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY course_count DESC;
