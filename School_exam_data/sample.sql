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


/*
Q2: Find the top 5 highest scorers
- Use the schema provided to display the full name of the students.
- Display the total marks and percentage also.
- Order by total marks in descending order.
*/

SELECT 
    CONCAT(students.first_name,' ',students.last_name) AS student_name,
    SUM(marks.mark_obtained) AS total_marks,
    CONCAT(ROUND(SUM(marks.mark_obtained)/1000 * 100.0),'%') AS percentage 
FROM marks
JOIN students ON
    marks.student_id = students.student_id
GROUP BY
    student_name
ORDER BY
    total_marks DESC
LIMIT 5; 

/*
- Daniel Girma leads decisively at 84%, outperforming second place by 9 percentage points - a clear candidate for peer mentoring
- Ranks 2-5 cluster tightly between 70-75%, showing consistent high achievement across multiple students with only 5 points separating them
*/

/*
Q3: Find the number of students who failed
- Assume that the passing mark for each subject is 40.
- A student is considered failed if he/she has scored less than 40 in any subject.
- Use the schema provided to display the total number of failed students.
*/

SELECT 
    COUNT(DISTINCT student_id) AS total_failed_students 
FROM marks
WHERE mark_obtained < 40; 

-- Out of 20 students 14 students failed in one or more subjects.


/*
Q4: Find the names of the subject and the respective teachers who have the highest number of failed students.
- Assume that the passing mark for each subject is 40.
- A student is considered failed in a subject if he/she has scored less than 40.
- Use the schema provided to display the subject name, teacher name and the number of failed students.
- Order by the number of failed students in descending order.
*/

SELECT 
    subjects.subject_name,
    CONCAT(teachers.first_name,' ',teachers.last_name) AS teacher_name, 
    COUNT(*) AS failed_students 
FROM marks
JOIN subjects ON
    marks.subject_id = subjects.subject_id
JOIN teachers ON
    marks.teacher_id = teachers.teacher_id
WHERE
    marks.mark_obtained < 40 
GROUP BY
    subjects.subject_name,
    teacher_name
ORDER BY
    failed_students DESC;


/*
Here are key insights from the analysis of subjects with the highest number of failed students:

High-Risk Subjects

-Geography leads with 5 failed students, requiring immediate attention from Peter Njoroge
-English, Mathematics, and Biology each have 4 failures - a concerning cluster of core subjects

Recommended Actions:

-Focus intervention resources on the top 4 subjects, particularly supporting teachers in Geography 
and the core academic trio. Consider peer learning from Physics and Economics departments where failure rates are minimal.
*/