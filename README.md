# SQL Student Performance Analysis

A comprehensive SQL project for analyzing and managing student academic performance, attendance, and study habits. This project demonstrates various SQL operations including data retrieval, joins, aggregation, and analysis.

## 📋 Project Overview

This SQL project analyzes student performance metrics across multiple dimensions:
- **Student Information** - Basic student demographics and enrollment details
- **Academic Scores** - Subject-wise and overall exam performance
- **Attendance Tracking** - Daily and percentage-based attendance records
- **Study Habits** - Study hours per week and extracurricular activities
- **Performance Dashboards** - Aggregated views of student performance

## 📊 Database Tables

### 1. **Students Table**
Stores basic information about all students in the system.

| Column | Type | Description |
|--------|------|-------------|
| student_id | INT (PK) | Unique identifier for each student |
| first_name | VARCHAR | Student's first name |
| last_name | VARCHAR | Student's last name |
| gender | VARCHAR | Student's gender |
| age | INT | Student's current age |
| grade_level | VARCHAR | Current grade level (e.g., Grade 9-12) |

**Sample Data:**
```
student_id | first_name | last_name | gender | age | grade_level
1          | John       | Smith     | Male   | 14  | Grade 9
2          | Emma       | Johnson   | Female | 15  | Grade 10
```

---

### 2. **Attendance Table**
Tracks student attendance percentages and records.

| Column | Type | Description |
|--------|------|-------------|
| attendance_id | INT (PK) | Unique attendance record identifier |
| student_id | INT (FK) | References Students table |
| attendance_percentage | DECIMAL | Attendance percentage (0-100) |

**Sample Data:**
```
attendance_id | student_id | attendance_percentage
1             | 1          | 95.5
2             | 2          | 88.75
3             | 3          | 92.0
```

---

### 3. **Student Scores Table**
Contains exam/test scores for each student.

| Column | Type | Description |
|--------|------|-------------|
| score_id | INT (PK) | Unique score record identifier |
| student_id | INT (FK) | References Students table |
| score | DECIMAL | Exam/test score (typically 0-100) |

---

### 4. **Study Habits Table**
Records study patterns and extracurricular participation.

| Column | Type | Description |
|--------|------|-------------|
| habit_id | INT (PK) | Unique habit record identifier |
| student_id | INT (FK) | References Students table |
| study_hours_per_week | INT | Number of study hours per week |
| extracurricular_activity | VARCHAR | Name of extracurricular activity (e.g., Basketball, Music, Soccer) |

**Sample Activities:**
- Basketball
- Music
- Soccer
- Debate
- Art

---

### 5. **Student Dashboard View**
Aggregated view combining multiple tables for holistic student performance overview.

**Combines data from:**
- Students (name, grade level)
- Student Scores (average scores)
- Attendance (attendance percentage)
- Study Habits (study hours, activities)

---

### 6. **High Performers View**
Filtered view showing top-performing students based on academic scores.

---

## 🔍 Key SQL Queries & Results

### 1. **Get All Students with Attendance and Study Hours**
```sql
SELECT s.first_name, a.attendance_percentage, sh.study_hours_per_week 
FROM students s 
JOIN attendance a ON s.student_id = a.student_id 
JOIN study_habits sh ON s.student_id = sh.student_id;
```

**Query Results:**

| # | first_name | attendance_percentage | study_hours_per_week |
|---|------------|----------------------|----------------------|
| 1 | John | 95.50 | 12 |
| 2 | Emma | 88.75 | 15 |
| 3 | Liam | 92.00 | 10 |
| 4 | Olivia | 97.25 | 18 |
| 5 | Noah | 84.50 | 8 |
| 6 | Ava | 90.00 | 14 |
| 7 | William | 86.75 | 11 |
| 8 | Sophia | 98.00 | 20 |
| 9 | James | 91.25 | 13 |
| 10 | Isabella | 89.50 | 16 |
| 11 | Benjamin | 93.75 | 9 |
| 12 | Mia | 96.00 | 17 |

---

### 2. **Calculate Average Score by First Name**
```sql
SELECT s.first_name, ROUND(AVG(sc.score), 2) AS avg_score 
FROM students s 
JOIN student_scores sc ON s.student_id = sc.student_id 
GROUP BY s.first_name;
```

**Query Results:**

| # | first_name | avg_score |
|---|------------|-----------|
| 1 | Riley | 94.67 |
| 2 | Harper | 94.33 |
| 3 | William | 81.67 |
| 4 | Chloe | 96.33 |
| 5 | Sebastian | 81.67 |
| 6 | Emily | 89.33 |
| 7 | Isabella | 88.33 |
| 8 | Isaac | 85.33 |
| 9 | Ella | 93.33 |
| 10 | Lucas | 80.67 |
| 11 | Henry | 78.67 |
| 12 | Luke | 78.00 |

---

### 3. **Top 5 Performers by Average Score**
```sql
SELECT s.first_name, 
       AVG(sc.score) AS avg_score 
FROM students s 
JOIN student_scores sc ON s.student_id = sc.student_id 
GROUP BY s.first_name 
ORDER BY avg_score DESC 
LIMIT 5;
```

**Query Results:**

| # | first_name | avg_score |
|---|------------|-----------|
| 1 | Aria | 97.33 |
| 2 | Chloe | 96.33 |
| 3 | Sofia | 95.33 |
| 4 | Riley | 94.67 |
| 5 | Harper | 94.33 |

---

### 4. **Top 5 Performers with Full Details**
```sql
SELECT s.student_id, s.first_name, s.last_name, 
       ROUND(AVG(sc.score), 2) AS avg_score 
FROM students s 
JOIN student_scores sc ON s.student_id = sc.student_id 
GROUP BY s.student_id, s.first_name, s.last_name 
ORDER BY avg_score DESC 
LIMIT 5;
```

**Query Results:**

| # | student_id | first_name | last_name | avg_score |
|---|------------|------------|-----------|-----------|
| 1 | 48 | Aria | Mitchell | 97.33 |
| 2 | 38 | Chloe | Nguyen | 96.33 |
| 3 | 28 | Sofia | Ramirez | 95.33 |
| 4 | 42 | Riley | Adams | 94.67 |
| 5 | 18 | Harper | Moore | 94.33 |

---

### 5. **Attendance Statistics**
```sql
SELECT MAX(attendance_percentage) AS highest_attendance, 
       MIN(attendance_percentage) AS lowest_attendance, 
       ROUND(AVG(attendance_percentage), 2) AS average_attendance 
FROM attendance;
```

**Query Results:**

| highest_attendance | lowest_attendance | average_attendance |
|-------------------|------------------|------------------|
| 99.50 | 83.50 | 91.98 |

---

### 6. **High Performers View**
```sql
SELECT * FROM high_performers;
```

**Query Results:**

| # | student_id | first_name | avg_score |
|---|------------|------------|-----------|
| 1 | 4 | Olivia | 91.00 |
| 2 | 34 | Scarlett | 89.00 |
| 3 | 10 | Isabella | 88.33 |
| 4 | 6 | Ava | 88.67 |
| 5 | 36 | Grace | 92.67 |
| 6 | 50 | Zoey | 91.33 |
| 7 | 14 | Charlotte | 88.00 |
| 8 | 22 | Abigail | 91.33 |
| 9 | 2 | Emma | 86.33 |
| 10 | 16 | Amelia | 90.33 |
| 11 | 44 | Lily | 89.33 |
| 12 | 42 | Riley | 94.67 |
| 13 | 46 | Hannah | 93.67 |
| 14 | 40 | Victoria | 90.00 |
| 15 | 32 | Ella | 93.33 |
| 16 | 38 | Chloe | 96.33 |
| 17 | 48 | Aria | 97.33 |
| 18 | 26 | Elizabeth | 91.67 |

---

### 7. **Student Dashboard - Complete Performance Overview**
```sql
SELECT * FROM student_dashboard;
```

**Query Results (Sample - 50 students total):**

| # | student_id | first_name | avg_score | attendance_percentage | study_hours_per_week |
|---|------------|------------|-----------|----------------------|----------------------|
| 1 | 14 | Charlotte | 88.00 | 94.25 | 19 |
| 2 | 45 | Luke | 78.00 | 86.25 | 8 |
| 3 | 16 | Amelia | 90.33 | 97.50 | 15 |
| 4 | 8 | Sophia | 92.33 | 98.00 | 20 |
| 5 | 48 | Aria | 97.33 | 99.25 | 24 |
| 6 | 25 | Joseph | 77.00 | 84.75 | 8 |
| 7 | 7 | William | 81.67 | 86.75 | 11 |
| 8 | 21 | Daniel | 80.33 | 88.00 | 13 |
| 9 | 41 | Carter | 82.33 | 88.50 | 11 |
| 10 | 38 | Chloe | 96.33 | 99.50 | 23 |
| 11 | 47 | Isaac | 85.33 | 91.50 | 13 |
| 12 | 9 | James | 80.00 | 91.25 | 13 |
| 13 | 23 | Matthew | 82.00 | 89.25 | 9 |
| 14 | 46 | Hannah | 93.67 | 97.75 | 16 |
| 15 | 11 | Benjamin | 79.67 | 93.75 | 9 |
| 16 | 6 | Ava | 88.67 | 90.00 | 14 |
| 17 | 3 | Liam | 79.67 | 92.00 | 10 |
| 18 | 49 | Anthony | 80.33 | 87.00 | 10 |
| 19 | 19 | Michael | 77.33 | 83.50 | 11 |
| 20 | 30 | Avery | 88.00 | 94.75 | 17 |
| 21 | 40 | Victoria | 90.00 | 93.00 | 18 |
| 22 | 18 | Harper | 94.33 | 99.00 | 21 |
| 23 | 33 | Sebastian | 81.67 | 90.50 | 13 |
| 24 | 10 | Isabella | 88.33 | 89.50 | 16 |
| 25 | 13 | Lucas | 80.67 | 87.50 | 12 |
| 26 | 28 | Sofia | 95.33 | 98.50 | 22 |
| 27 | 12 | Mia | 91.67 | 96.00 | 17 |
| 28 | 29 | Samuel | 78.33 | 86.00 | 11 |
| 29 | 22 | Abigail | 91.33 | 95.00 | 18 |
| 30 | 2 | Emma | 86.33 | 88.75 | 15 |
| 31 | 17 | Alexander | 82.00 | 90.75 | 10 |
| 32 | 24 | Emily | 89.33 | 93.50 | 20 |
| 33 | 1 | John | 85.00 | 95.50 | 12 |
| 34 | 20 | Evelyn | 87.67 | 92.50 | 16 |
| 35 | 27 | David | 83.00 | 91.00 | 12 |
| 36 | 36 | Grace | 92.67 | 98.25 | 15 |

---

## 📊 Query Statistics

- **Total Students:** 50
- **Highest Average Score:** 97.33 (Aria Mitchell)
- **Lowest Average Score:** 77.00 (Joseph)
- **Highest Attendance:** 99.50%
- **Lowest Attendance:** 83.50%
- **Average Attendance:** 91.98%
- **Study Hours Range:** 8-24 hours per week

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `SQL-Student-Performance.sql` | Main SQL script with all queries and table definitions |
| `data-students.csv` | Student demographic information |
| `data-attendance.csv` | Attendance records |
| `student_scores.csv` | Student exam scores |
| `data-average_scores.csv` | Pre-calculated average scores |
| `study-habbits.csv` | Study habits and extracurricular data |
| `data-joins.csv` | Sample joined data results |
| `data-student_dashbpard.csv` | Student dashboard aggregated data |
| `sql pj.pptx` | Project presentation with visualizations |

---

## 🎯 Analysis Features

This project enables analysis of:

1. **Academic Performance**
   - Average scores per student
   - Top and bottom performers
   - Score distribution

2. **Attendance Patterns**
   - Attendance percentage by student
   - Highest and lowest attendance
   - Overall attendance trends

3. **Study Habits Analysis**
   - Study hours by student
   - Correlation between study hours and performance
   - Popular extracurricular activities

4. **Integrated Performance Dashboard**
   - Student name, grade level, attendance
   - Average academic score
   - Study hours per week
   - Extracurricular activities

---

## 🚀 How to Use

### 1. **Setup the Database**
```sql
-- Create the database and tables
-- Run the SQL-Student-Performance.sql file in your SQL client
```

### 2. **Load Sample Data**
```sql
-- The SQL file includes INSERT statements to populate the database
-- Execute all statements to load sample data
```

### 3. **Run Analysis Queries**
```sql
-- Execute individual queries to analyze student performance
-- Modify WHERE and LIMIT clauses as needed for your analysis
```

### 4. **Create Dashboards**
- Use the provided CSV exports with visualization tools
- Create charts and graphs showing performance metrics
- Monitor trends over time

---

## 🔗 Key Relationships

```
Students (1) --→ (N) Attendance
Students (1) --→ (N) Student Scores
Students (1) --→ (N) Study Habits
```

---

## 📈 Sample Insights You Can Generate

- Which students have both high attendance and high scores?
- What is the correlation between study hours and academic performance?
- Which extracurricular activities are most common?
- What is the average attendance percentage across all students?
- Who are the top 5 performing students?
- How do students in different grade levels compare?

---

## 💡 SQL Concepts Demonstrated

- **JOIN Operations** - Multiple table joins (INNER JOIN)
- **Aggregate Functions** - AVG(), MAX(), MIN(), COUNT()
- **GROUP BY & HAVING** - Data grouping and filtering
- **ORDER BY** - Sorting results
- **LIMIT** - Limiting result sets
- **ROUND()** - Rounding decimal values
- **Foreign Keys** - Maintaining data integrity

---

## 👤 Author

**Kancharlaa Manoj Kumar**

---

## 📝 License

This project is open source and available for educational purposes.

---

## 🤝 Contributing

Feel free to contribute by:
- Adding more analysis queries
- Improving data quality
- Creating additional views
- Adding performance indexes

---

## 📞 Support

For questions or issues with this project, please create an issue in the repository.

---

**Last Updated:** June 2026
