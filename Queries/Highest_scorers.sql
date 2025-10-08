/*
Q2: Find the top 5 highest scorers
- Use the schema provided to display the full name of the students.
- Display the total marks and percentage also.
- Order by total marks in descending order.
*/

SELECT 
    CONCAT(students.first_name,' ',students.last_name) AS student_name, --full name
    SUM(marks.mark_obtained) AS total_marks,
    CONCAT(ROUND(SUM(marks.mark_obtained)/1000 * 100.0),'%') AS percentage --assuming total marks is 1000
FROM marks
JOIN students ON
    marks.student_id = students.student_id
GROUP BY
    student_name
ORDER BY
    total_marks DESC
LIMIT 5; --top 5 highest scorers

/*
- Daniel Girma leads decisively at 84%, outperforming second place by 9 percentage points - a clear candidate for peer mentoring
- Ranks 2-5 cluster tightly between 70-75%, showing consistent high achievement across multiple students with only 5 points separating them
*/