# checks if query runs successfully, results are returned, result type is correct

from DB_Search.course_search import available_courses
from DB_Search.department_search import available_departments
from DB_Search.student_search import student_search_not_enrolled
from DB_Search.student_search import student_search_last_year_and_results

# tests for available course query:

def test_available_courses():

    print("\nTesting available_courses()")

    try:
        result = available_courses()

        if isinstance(result, list) and len(result) > 0:
            print("PASS: available_courses returned course data")
        else:
            print("FAIL: available_courses returned no results")

    except Exception as e:
        print("FAIL: available_courses crashed:", e)

# test for department query

def test_available_departments():

    print("\nTesting available_departments()")

    try:
        result = available_departments()

        if isinstance(result, list) and len(result) > 0:
            print("PASS: available_departments returned department data")
        else:
            print("FAIL: available_departments returned no results")

    except Exception as e:
        print("FAIL: available_departments crashed:", e)

# tests for student not entrolled

def test_students_not_enrolled():

    print("\nTesting student_search_not_enrolled()")

    try:
        result = student_search_not_enrolled()

        if isinstance(result, list):
            print("PASS: student_search_not_enrolled executed successfully")
        else:
            print("FAIL: student_search_not_enrolled returned invalid result")

    except Exception as e:
        print("FAIL: student_search_not_enrolled crashed:", e)


# tests for final year student query:

def test_top_students():

    print("\nTesting student_search_last_year_and_results()")

    try:
        result = student_search_last_year_and_results()

        if isinstance(result, list):
            print("PASS: student_search_last_year_and_results executed successfully")
        else:
            print("FAIL: student_search_last_year_and_results returned invalid result")

    except Exception as e:
        print("FAIL: student_search_last_year_and_results crashed:", e)


#

def run_query_tests():

    print("\n--- Running Query Tests ---\n")

    test_available_courses()
    test_available_departments()
    test_students_not_enrolled()
    test_top_students()

    print("\n--- Query Testing Complete ---\n")

run_query_tests()