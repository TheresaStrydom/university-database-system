from DB_Conn.connection import connection_context


def test_database_connection():
    try:
        connection_context("SELECT 1")
        print("PASS: Database connection successful")
    except:
        print("FAIL: Database connection failed")


def test_tables_exist():

    required_tables = [
        "Students",
        "Courses",
        "Lecturers",
        "Departments",
        "Enrollments"
    ]

    for table in required_tables:

        query = f"""
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'university_records'
        AND table_name = '{table}'
        """

        result = connection_context(query)

        if result:
            print(f"PASS: Table {table} exists")
        else:
            print(f"FAIL: Table {table} is missing")


def test_views_exist():

    required_views = [
        "StudentGradeSummary",
        "LecturerCourseLoad",
        "DepartmentCourseOfferings"
    ]

    for view in required_views:

        query = f"""
        SELECT table_name
        FROM information_schema.views
        WHERE table_schema = 'university_records'
        AND table_name = '{view}'
        """

        result = connection_context(query)

        if result:
            print(f"PASS: View {view} exists")
        else:
            print(f"FAIL: View {view} is missing")


def run_schema_tests():

    print("\n--- Running Schema Tests ---\n")

    test_database_connection()
    test_tables_exist()
    test_views_exist()

    print("\n--- Schema Testing Complete ---\n")