/*
Q3: Find the number of students who failed
- Assume that the passing mark for each subject is 40.
- A student is considered failed if he/she has scored less than 40 in any subject.
- Use the schema provided to display the total number of failed students.
*/

SELECT 
    COUNT(DISTINCT student_id) AS total_failed_students --counting unique students who failed
FROM marks
WHERE mark_obtained < 40; --failing criteria

-- Out of 20 students 14 students failed in one or more subjects.
