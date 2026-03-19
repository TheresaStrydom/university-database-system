"""
This module is used by the GUI to execute functions that will search
the database. The functions are:

available_courses()
search_courses_per_department_per_lecturer()

They both contain a MySQL query that can be passed to the database via
an imported function.
"""

from DB_Conn.connection import connection_context

def available_courses():
    """
    This function is used by the GUI to populate a dropdown
    to show all the available courses.
    :return: The available courses.
    """
    query = """SELECT course_code, name FROM courses"""
    return connection_context(query)

def search_courses_per_department_per_lecturer(department, lecturer):
    """
    This function is used by the GUI to search for courses based on given
    department and lecturer.
    :param department: The name of the department as passed by the GUI.
    :param lecturer: The name of the lecturer as passed by the GUI.
    :return: The course code and name.
    """
    query = f"""
        SELECT a.course_code, a.name
        FROM courses AS a
        JOIN courselecturers AS b ON a.course_id = b.course_id
        JOIN lecturers AS c ON b.lecturer_id = c.lecturer_id
        JOIN departments AS d ON c.department_id = d.department_id
        WHERE d.name = '{department}' AND c.name ='{lecturer}' """

    return connection_context(query)
