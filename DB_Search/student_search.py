"""
This module is used by the GUI to execute functions that will search
the database. The functions are:

student_search_per_course_per_lecturer()
student_search_last_year_and_results()
search_courses_per_department_per_lecturer()

They both contain a MySQL query that can be passed to the database via
an imported function.
"""

from DB_Conn.connection import connection_context

def student_search_per_course_per_lecturer(course_code,lecturer_name):
    """
    This function is used by the GUI to search for courses based on given course_code and lecturer_name.
    department and lecturer.
    :param course_code: The course code as passed by the GUI.
    :param lecturer_name: The name of the lecturer as passed by the GUI.
    :return: Returns a list of students
    """
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
    """
    This function is used by the GUI to search for courses based on last year and results.
    :return: All the students to achieve greater than 70% and is in the final year of study.
    """
    query1 = """
    SELECT  a.name
    FROM students AS a
    JOIN enrollments AS b ON a.student_id = b.student_id
    JOIN courses AS c ON b.course_id = c.course_id
    JOIN programcourses AS d ON c.course_id = d.course_id
    JOIN programs AS e ON d.program_id = e.program_id
    WHERE a.year_of_study = e.duration_years AND c.level = e.duration_years 
    AND a.graduation_status = 'Active' AND b.grade_numeric IS NOT NULL
    GROUP BY a.student_id, a.name
    HAVING AVG(b.grade_numeric) > 70.0
    ORDER BY a.name ASC """

    return connection_context(query1)

def student_search_not_enrolled():
    """
    This function is used by the GUI to search for students that have not enrolled in the current semester.
    :return: List of students not enrolled in the current semester.
    """
    query = """select start_date, end_date \
               From semesters \
               where start_date <= CURRENT_DATE \
                 AND end_date >= CURRENT_DATE();"""
    results = connection_context(query)
    start_date = results[0][0]
    end_date = results[0][1]

    query1 = f"""
    SELECT name 
    FROM students 
    WHERE graduation_status = 'Active' and name NOT IN (
    SELECT a.name
    FROM students AS a
    JOIN enrollments AS b ON a.student_id = b.student_id
    JOIN semesters AS c ON b.semester_id = c.semester_id 
    WHERE b.enrollment_date BETWEEN '{start_date}' AND '{end_date}') """
    return connection_context(query1)
