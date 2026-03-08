# To get the available courses per semester

from DB_Conn.connection import connection_context

def lectures_search_semester(semester_id):
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
    query = f"""
    select a.name
    From lecturers AS a
    JOIN courselecturers as b ON a.lecturer_id = b.lecturer_id
    JOIN courses as c ON b.course_id = c.course_id  
    WHERE c.course_code = '{course_code}' """

    return connection_context(query)

def lecturer_search_per_expertise(exp_area):
    query = f"""
    SELECT name
    FROM lecturers
    WHERE expertise_areas = '{exp_area}' """

    return connection_context(query)

def lecturer_search_per_department(department):
    query = f"""
    SELECT a.name
    FROM lecturers AS a
    JOIN departments AS b ON a.department_id = b.department_id
    WHERE b.name = '{department}' """

    return connection_context(query)
