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