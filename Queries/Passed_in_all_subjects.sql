/*
Q1: Find the names of students who have passed in all subjects.
- Assume that the passing marks for each subject is 40.
- A student is considered to have passed in a subject if they have scored 40 or more marks in that subject.     
- Use the provided database schema and data to write the SQL query.
*/

SELECT 
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    COUNT(subjects.subject_name) AS subjects_passed
FROM marks
INNER JOIN students ON
    marks.student_id = students.student_id
INNER JOIN subjects ON
    marks.subject_id = subjects.subject_id
WHERE 
    marks.marks_obtained >= 40
GROUP BY
    student_name;

SELECT 
    marks.mark_id,
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    subjects.subject_name,
    marks.marks_obtained
FROM marks
INNER JOIN students ON
    marks.student_id = students.student_id
INNER JOIN subjects ON
    marks.subject_id = subjects.subject_id;

SELECT *
FROM marks;


SELECT 
    student_id
FROM marks;



