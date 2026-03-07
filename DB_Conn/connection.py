import mysql.connector

# Define your connection details
config = {
    'user': 'root',
    'password': 'root',
    'host': 'localhost',
    'database': 'liverpool_project'
}

def flatten_results(results):
    """
    Removes the unnecessary content in each item of the list.
    """
    return [item[0] if len(item) == 1 else item for item in results]

def connection_context(query):

    try:
        # Establish the connection
        cnx = mysql.connector.connect(**config)

        if cnx.is_connected():
            print("Connection to MySQL DB successful")

        # You can now create a cursor object to execute SQL queries
        cursor = cnx.cursor()

        # Example: Execute a simple query
        cursor.execute(query)

        # Fetch all results and print them
        results = cursor.fetchall()

        return flatten_results(results)


    except mysql.connector.Error as err:
        print(f"Error: {err}")

    finally:
        # Always close the cursor and connection
        if 'cursor' in locals() and cursor is not None:
            cursor.close()
        if 'cnx' in locals() and cnx.is_connected():
            cnx.close()
            print("MySQL connection is closed")