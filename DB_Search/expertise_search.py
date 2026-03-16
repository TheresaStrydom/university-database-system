"""
This module is used by the GUI to execute a function that will search
the database. The function:

search_expertise()

The function contain a MySQL query that can be passed to the database
via an imported query.
"""
from DB_Conn.connection import connection_context

def search_expertise():
    """
    This function is used by the GUI to execute a function that will
    search for expertise found in the lecturers table.
    :return: The areas of expertise.
    """
    query = "SELECT expertise_areas FROM lecturers"
    return connection_context(query)
