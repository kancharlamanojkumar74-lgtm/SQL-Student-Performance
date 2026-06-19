select * from attendance;

CREATE TABLE study_habits ( habit_id SERIAL PRIMARY KEY, student_id INT REFERENCES students(student_id), study_hours_per_week INT, extracurricular_activity VARCHAR(50) );

INSERT INTO study_habits (student_id, study_hours_per_week, extracurricular_activity) VALUES (1, 12, 'Basketball'), (2, 15, 'Music'), (3, 10, 'Soccer'), (4, 18, 'Debate'), (5, 8, 'Art'), (6, 14, 'Basketball'), (7, 11, 'Music'), (8, 20, 'Soccer'), (9, 13, 'Debate'), (10, 16, 'Art'), (11, 9, 'Basketball'), (12, 17, 'Music'), (13, 12, 'Soccer'), (14, 19, 'Debate'), (15, 7, 'Art'), (16, 15, 'Basketball'), (17, 10, 'Music'), (18, 21, 'Soccer'), (19, 11, 'Debate'), (20, 16, 'Art'), (21, 13, 'Basketball'), (22, 18, 'Music'), (23, 9, 'Soccer'), (24, 20, 'Debate'), (25, 8, 'Art'), (26, 14, 'Basketball'), (27, 12, 'Music'), (28, 22, 'Soccer'), (29, 11, 'Debate'), (30, 17, 'Art'), (31, 10, 'Basketball'), (32, 19, 'Music'), (33, 13, 'Soccer'), (34, 21, 'Debate'), (35, 7, 'Art'), (36, 15, 'Basketball'), (37, 12, 'Music'), (38, 23, 'Soccer'), (39, 9, 'Debate'), (40, 18, 'Art'), (41, 11, 'Basketball'), (42, 20, 'Music'), (43, 14, 'Soccer'), (44, 22, 'Debate'), (45, 8, 'Art'), (46, 16, 'Basketball'), (47, 13, 'Music'), (48, 24, 'Soccer'), (49, 10, 'Debate'), (50, 19, 'Art');

select * from study_habits;

SELECT s.first_name, a.attendance_percentage, sh.study_hours_per_week FROM students s JOIN attendance a ON s.student_id = a.student_id JOIN study_habits sh ON s.student_id = sh.student_id;

SELECT s.student_id, s.first_name, s.last_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.student_id, s.first_name, s.last_name ORDER BY s.student_id;

SELECT s.first_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.first_name;

SELECT s.first_name, AVG(sc.score) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.first_name ORDER BY avg_score DESC LIMIT 5;


SELECT s.student_id, s.first_name, s.last_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.student_id, s.first_name, s.last_name ORDER BY avg_score DESC LIMIT 5;

SELECT MAX(attendance_percentage) AS highest_attendance, MIN(attendance_percentage) AS lowest_attendance, ROUND(AVG(attendance_percentage), 2) AS average_attendance FROM attendance;

SELECT MAX(attendance_percentage) AS highest_attendance, MIN(attendance_percentage) AS lowest_attendance, ROUND(AVG(attendance_percentage), 2) AS average_attendance FROM attendance;

SELECT s.student_id, s.first_name, s.last_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.student_id, s.first_name, s.last_name ORDER BY avg_score DESC LIMIT 5;

SELECT s.first_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.first_name;

SELECT s.student_id, s.first_name, s.last_name, ROUND(AVG(sc.score), 2) AS avg_score FROM students s JOIN student_scores sc ON s.student_id = sc.student_id GROUP BY s.student_id, s.first_name, s.last_name ORDER BY s.student_id;

SELECT s.first_name, a.attendance_percentage, sh.study_hours_per_week FROM students s JOIN attendance a ON s.student_id = a.student_id JOIN study_habits sh ON s.student_id = sh.student_id;

select * from study_habits;

select * from attendance;

SELECT * FROM student_dashboard;

SELECT * FROM high_performers;



