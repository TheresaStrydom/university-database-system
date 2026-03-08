from DB_Conn.connection import connection_context

def available_departments():
    query = """SELECT name FROM departments"""
    return connection_context(query)