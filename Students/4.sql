select student.name, avg(marks.mark) as AvgMarks from student, marks where student.name = 'Петров' and student.student_id = marks.student_id