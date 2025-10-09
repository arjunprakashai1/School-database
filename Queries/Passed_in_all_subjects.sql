/*
Q1: Find the name of the students who passed in all subject.
- Assume that the passing mark for each subject is 40.
- A student is passed in a subject if he/she has scored 40 or more.
- Use the schema provided to display the full name of the students.
- Order by student name in ascending order.
*/

WITH passed_in_all AS 
(
SELECT 
    CONCAT(students.first_name,' ',students.last_name) AS student_name, 
    COUNT(*) AS passed_subjects 
FROM marks
INNER JOIN students ON
    marks.student_id = students.student_id
INNER JOIN subjects ON
    marks.subject_id = subjects.subject_id
WHERE 
    marks.mark_obtained >= 40 
GROUP BY
    student_name
HAVING
    passed_subjects = 
        (SELECT COUNT(DISTINCT subject_name) FROM subjects) 
)
SELECT 
    student_name 
FROM passed_in_all
ORDER BY student_name ASC;


-- Out of 20 students only 6 students passed in all 10 subjects.
