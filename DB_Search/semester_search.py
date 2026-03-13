
"""
This module is used by the GUI to execute a function that will search
the database. The function:

available_semesters()

The function contain a MySQL query that can be passed to the database
via an imported query.
"""

from DB_Conn.connection import connection_context

def available_semesters():
    """
    This function is used by the GUI to execute a function that will search for the available semesters.
    :return: All of the available semesters.
    """
    query = "SELECT semester_id FROM semesters"
    return connection_context(query)
