from DB_Conn.connection import connection_context

def available_courses():
    query = """SELECT course_code, name FROM courses"""

    return connection_context(query)

def search_courses_per_department_per_lecturer(department, lecturer):
    query = f"""
        SELECT a.course_code, a.name
        FROM courses AS a
        JOIN courselecturers AS b ON a.course_id = b.course_id
        JOIN lecturers AS c ON b.lecturer_id = c.lecturer_id
        JOIN departments AS d ON c.department_id = d.department_id
        WHERE d.name = '{department}' AND c.name ='{lecturer}' """

    return connection_context(query)


