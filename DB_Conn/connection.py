"""
This module is where the configuration for the local database is
stored and changed if necessary.

It also provides function that sends queries to the database
and returns the result connection_context.

Another function cleans the result from the database by removing
commas and brackets and places them in an iterable list.
"""

import mysql.connector
config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': 'liverpool_project'
}

def flatten_results(results):
    """
    Removes the unnecessary characters in each item of the list.
    :param results: list of results from a database query
    :return: a cleaned list of results from a database query
    """
    result =[item[0] if len(item) == 1 else item for item in results]
    return result

def connection_context(query):
    """
    The function that handles the connection to the database
    :param query: An SQL query that is passed to the function to execute
    :return: Result from the database query.
    """
    try:
        # Establish the connection
        connect = mysql.connector.connect(**config)

        if connect.is_connected():
            print("Connection to MySQL DB successful")

        # You can now create a cursor object to execute SQL queries
        cursor = connect.cursor()

        # Example: Execute a simple query
        cursor.execute(query)

        # Fetch all results and print them
        result = cursor.fetchall()
        cleaned_result = flatten_results(result)
        return cleaned_result


    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Always close the cursor and connection
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if 'cnx' in locals() and connect.is_connected():
            connect.close()
            print("MySQL connection is closed")
