# To get the available courses per semester

from DB_Conn.connection import connection_context

def lectures_search(semester_id):

    query =f"""
    select a.name
    From lecturers as a 
    Join courselecturers as b ON a.lecturer_id = b.lecturer_id
    Join courses as c ON b.course_id = c.course_id
    Join enrollments as d ON c.course_id = d.course_id
    Where semester_id = {semester_id}
    """

    results = connection_context(query)
    for row in results:
        print(row)
    return results

lectures_search(1)
