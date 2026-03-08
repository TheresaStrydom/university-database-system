from DB_Conn.connection import connection_context

def available_semesters():
    query = "SELECT semester_id FROM semesters"
    return connection_context(query)

