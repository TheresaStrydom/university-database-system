from DB_Conn.connection import connection_context

def student_search_per_course_per_lecturer(course_code,lecturer_name):
    query = f"""
    SELECT a.name 
    FROM students AS a
    JOIN enrollments AS b ON a.student_id = b.student_id
    JOIN courses AS c ON b.course_id = c.course_id
    JOIN courselecturers AS d ON c.course_id = d.course_id
    JOIN lecturers AS e ON d.lecturer_id = e.lecturer_id
    WHERE e.name = '{lecturer_name}' AND c.course_code = '{course_code}'"""
    return connection_context(query)

def student_search_last_year_and_results():
    query = """
    SELECT DISTINCT a.name
    FROM students AS a
    JOIN enrollments AS b ON a.student_id = b.student_id
    JOIN courses AS c ON b.course_id = c.course_id
    JOIN programcourses AS d ON c.course_id = d.course_id
    JOIN programs AS e ON d.program_id = e.program_id
    WHERE a.year_of_study = e.duration_years AND b.grade_numeric > 70.0"""
    return connection_context(query)

def student_search_not_enrolled():
    query = """
    SELECT name 
    FROM students 
    WHERE name NOT IN (
    SELECT a.name
    FROM students AS a
    JOIN enrollments AS b ON a.student_id = b.student_id
    JOIN semesters AS c ON b.semester_id = c.semester_id 
    WHERE b.enrollment_date BETWEEN (SELECT MAX(start_date) FROM semesters) AND (SELECT MAX(end_date) FROM semesters)) """
    return connection_context(query)