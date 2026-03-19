"""
This module is used by the GUI to execute a function that will search
the database. The function is:

available_departments()

The function contain a MySQL query that can be passed to the database
via an imported query.
"""

from DB_Conn.connection import connection_context

def available_departments():
    """
    This function is used by the GUI to execute a function that will search
    the available departments.
    :return: The names of the departments
    """
    query = """SELECT name FROM departments"""
    return connection_context(query)
