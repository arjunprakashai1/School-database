# Student Performance Analysis SQL Project

A comprehensive SQL-based analysis of student academic performance, examining pass/fail rates, top performers, and subject-specific challenges across a dataset of 20 students and 10 subjects.

## 📊 Project Overview

This project analyzes student performance data to identify:
- Students who excelled across all subjects
- Top academic performers by total marks
- Failure rates and at-risk students
- Subjects requiring instructional intervention

## 📁 Dataset

**Source**: Kaggle

The dataset consists of the following tables:
- **students**: Student demographic information (student_id, first_name, last_name)
- **subjects**: Available subjects (subject_id, subject_name)
- **teachers**: Teaching staff (teacher_id, first_name, last_name)
- **marks**: Student performance records (student_id, subject_id, teacher_id, mark_obtained)

**Dataset Statistics**:
- Total Students: 20
- Total Subjects: 10
- Passing Threshold: 40 marks
- Maximum Marks per Subject: 100

### 🗂️ Database Schema (ER Diagram)

```
┌─────────────────────┐
│     STUDENTS        │
├─────────────────────┤
│ PK student_id       │
│    first_name       │
│    last_name        │
└──────────┬──────────┘
           │
           │ 1
           │
           │
           │ N
┌──────────▼──────────┐
│       MARKS         │
├─────────────────────┤
│ FK student_id       │───────┐
│ FK subject_id       │       │
│ FK teacher_id       │       │
│    mark_obtained    │       │
└─────────────────────┘       │
           │                  │
           │                  │
         N │                N │
           │                  │
           │ 1                │ 1
           │                  │
┌──────────▼──────────┐   ┌───▼──────────────┐
│     SUBJECTS        │   │    TEACHERS      │
├─────────────────────┤   ├──────────────────┤
│ PK subject_id       │   │ PK teacher_id    │
│    subject_name     │   │    first_name    │
└─────────────────────┘   │    last_name     │
                          └──────────────────┘

Relationships:
• One STUDENT can have many MARKS (1:N)
• One SUBJECT can have many MARKS (1:N)
• One TEACHER can have many MARKS (1:N)
• MARKS is a junction table connecting students, subjects, and teachers
```

## 🎯 Analysis Questions

### Q1: Students Who Passed All Subjects
**Objective**: Identify students who scored 40 or above in every subject.

**Methodology**:
- Used CTE (Common Table Expression) for cleaner query structure
- Counted passed subjects per student
- Compared against total subject count
- Ordered results alphabetically

**Key Finding**: Only **6 out of 20 students (30%)** passed all 10 subjects.

---

### Q2: Top 5 Highest Scorers
**Objective**: Rank students by total marks and calculate their overall percentage.

**Metrics Displayed**:
- Full student name
- Total marks obtained
- Percentage score

**Key Insights**:
- **Daniel Girma** leads with 84%, significantly ahead of others (+9 percentage points)
- Ranks 2-5 cluster between 70-75%, showing consistent high achievement
- Top performer could serve as a peer mentor for struggling students

---

### Q3: Failed Student Count
**Objective**: Determine how many students failed at least one subject.

**Definition**: A student is considered "failed" if they scored below 40 in any subject.

**Key Finding**: **14 out of 20 students (70%)** failed in one or more subjects, indicating widespread academic challenges.

---

### Q4: Subjects with Highest Failure Rates
**Objective**: Identify which subjects have the most student failures and their respective teachers.

**Metrics Displayed**:
- Subject name
- Teacher name
- Number of failed students

**Key Insights**:

**High-Risk Subjects**:
- **Geography** (Peter Njoroge): 5 failed students - requires immediate intervention
- **English, Mathematics, Biology**: 4 failures each - concerning cluster of core subjects

**Recommended Actions**:
1. Focus intervention resources on top 4 subjects
2. Provide additional support for Geography and core academic subjects
3. Implement peer learning programs from Physics and Economics departments (minimal failures)

## 🛠️ Technical Implementation

### SQL Techniques Used:
- **JOINs**: INNER JOIN for combining related tables
- **Aggregations**: COUNT, SUM, AVG with GROUP BY
- **CTEs**: Common Table Expressions for readable complex queries
- **Subqueries**: For dynamic comparisons
- **String Functions**: CONCAT for name formatting
- **Filtering**: WHERE and HAVING clauses for conditional logic

### Query Optimization:
- Proper indexing on foreign keys (student_id, subject_id, teacher_id)
- Efficient GROUP BY operations
- Use of DISTINCT where appropriate

## 📈 Key Findings Summary

| Metric | Value | Percentage |
|--------|-------|------------|
| Students Passing All Subjects | 6 | 30% |
| Students with At Least One Failure | 14 | 70% |
| Top Scorer (Daniel Girma) | 840/1000 | 84% |
| Highest Failure Subject | Geography | 5 students |

## 🚀 Getting Started

### Prerequisites
- SQL database (MySQL, PostgreSQL, or SQL Server)
- Dataset imported from Kaggle

### Running the Queries

1. Clone this repository
2. Import the dataset into your SQL database
3. Execute queries in order (Q1 through Q4)
4. Review the results and insights

```sql
-- Example: Running Q1
WITH passed_in_all AS (...)
SELECT student_name FROM passed_in_all
ORDER BY student_name ASC;
```

## 💡 Potential Extensions

- **Temporal Analysis**: Track performance trends over multiple semesters
- **Demographic Analysis**: Correlate performance with student demographics
- **Teacher Effectiveness**: Compare average scores across teachers
- **Predictive Modeling**: Identify at-risk students early
- **Subject Correlation**: Analyze if failures in certain subjects predict failures in others

## 📊 Query Results

### Q1: Students Who Passed All Subjects

| Student Name |
|-------------|
| Daniel Girma |
| Emily Johnson |
| Grace Mutua |
| John Smith |
| Mary Wanjiku |
| Sarah Williams |

**Total**: 6 students passed all 10 subjects

---

### Q2: Top 5 Highest Scorers

| Student Name | Total Marks | Percentage |
|-------------|-------------|------------|
| Daniel Girma | 840 | 84% |
| Sarah Williams | 750 | 75% |
| Emily Johnson | 745 | 75% |
| Grace Mutua | 720 | 72% |
| John Smith | 705 | 71% |

---

### Q3: Failed Student Count

| Total Failed Students |
|----------------------|
| 14 |

**Note**: 70% of students failed in at least one subject

---

### Q4: Subjects with Highest Failure Rates

| Subject Name | Teacher Name | Failed Students |
|-------------|-------------|-----------------|
| Geography | Peter Njoroge | 5 |
| English | Alice Kamau | 4 |
| Mathematics | Robert Ochieng | 4 |
| Biology | Susan Akinyi | 4 |
| History | David Kimani | 3 |
| Chemistry | Patricia Muthoni | 3 |
| Computer Science | James Otieno | 2 |
| Physics | Michael Karanja | 2 |
| Economics | Catherine Njeri | 1 |
| Kiswahili | Joseph Waweru | 1 |

---

## 📝 Recommendations for Stakeholders

### For Administration:
- Allocate additional resources to Geography, English, Mathematics, and Biology
- Implement early warning systems for at-risk students
- Establish peer tutoring programs led by top performers

### For Teachers:
- Peter Njoroge (Geography) may need pedagogical support
- Share best practices from high-performing subject teachers
- Consider differentiated instruction strategies

### For Students:
- 70% failure rate suggests need for better study resources
- Implement structured study groups
- Provide access to supplementary learning materials

---

**Note**: All analysis assumes a passing threshold of 40 marks out of 100. Results may vary if different grading criteria are applied.