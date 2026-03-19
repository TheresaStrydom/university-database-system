"""
This module is used by the GUI to execute functions that will search
the database. The functions are:

lectures_search_semester(semester_id)
lecturer_search_per_course(course_code)
lecturer_search_per_expertise(exp_area)
lecturer_search_per_department(department)

They all contain a MySQL query that can be passed to the database via
an imported function.
"""

from DB_Conn.connection import connection_context

def lectures_search_semester(semester_id):
    """
    This function is used by the GUI to search the database based on a semester.
    :param semester_id: The ID of the semester that is being searched.
    :return: The name of the lecturers.
    """
    query =f"""
    SELECT a.name
    From lecturers as a 
    Join courselecturers as b ON a.lecturer_id = b.lecturer_id
    Join courses as c ON b.course_id = c.course_id
    Join enrollments as d ON c.course_id = d.course_id
    Where semester_id = {semester_id}
    """

    return connection_context(query)

def lecturer_search_per_course(course_code):
    """
    This function is used by the GUI to search the database based on a course.
    :param course_code: The course code of the course that is being searched.
    :return: The name of the lecturers.
    """
    query = f"""
    select a.name
    From lecturers AS a
    JOIN courselecturers as b ON a.lecturer_id = b.lecturer_id
    JOIN courses as c ON b.course_id = c.course_id  
    WHERE c.course_code = '{course_code}' """

    return connection_context(query)

def lecturer_search_per_expertise(exp_area):
    """
    This function is used by the GUI to search the database based on an expertise.
    :param exp_area: The area of expertise that is being searched.
    :return: The name of the lecturers.
    """
    query = f"""
    SELECT name
    FROM lecturers
    WHERE expertise_areas = '{exp_area}' """

    return connection_context(query)

def lecturer_search_per_department(department):
    """
    This function is used by the GUI to search the database based on a department.
    :param department: The name of the department that is being searched.
    :return: The name of the lecturers.
    """
    query = f"""
    SELECT a.name
    FROM lecturers AS a
    JOIN departments AS b ON a.department_id = b.department_id
    WHERE b.name = '{department}' """

    return connection_context(query)

