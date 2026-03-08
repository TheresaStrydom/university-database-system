from DB_Conn.connection import connection_context

def search_expertise():
    query = "SELECT expertise_areas FROM lecturers"
    return connection_context(query)

