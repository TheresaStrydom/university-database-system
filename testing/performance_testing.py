"""
Perfrom Non-functional testing for all queries in DB_Search,
including queries execution time, resources utilisation, non-functional query validation , repeat run for checking average execution time to ensure stability.
"""
import os
import sys
import time
import psutil

# Get the root directory of the project and add it to sys.path for imports
root = os.path.dirname(os.path.dirname(__file__))
if root not in sys.path:
    sys.path.insert(0, root)

from DB_Search.course_search import available_courses, search_courses_per_department_per_lecturer
from DB_Search.department_search import available_departments
from DB_Search.expertise_search import search_expertise
from DB_Search.lectures_search import lectures_search_semester, lecturer_search_per_course, \
    lecturer_search_per_expertise, lecturer_search_per_department
from DB_Search.semester_search import available_semesters
from DB_Search.student_search import student_search_not_enrolled, student_search_last_year_and_results, \
    student_search_per_course_per_lecturer


# Measure performance of a query function, excecute time, memory usage, CPU usage, and number of rows returned. Repeat the test 10 times to get an average execution time and check for stability.


def measure_performance(function, *args):
    times = []

    for i in range(10):
        start = time.time()
        result = function(*args)
        end = time.time()
        times.append(end - start)

    avg_time = sum(times) / len(times)
    total_time = sum(times)

    print(f"Function: {function.__name__}")

    if result is None:
        print("Query failed, no rows returned.")
    else:
        print(f"Rows returned: {len(result)}")

    process = psutil.Process(os.getpid())
    print(f"Total execution time: {total_time:.4f} seconds")
    print(f"Average execution time: {avg_time:.4f} seconds")
    print(f"Memory used: {process.memory_info().rss / (1024 * 1024):.2f} MB")
    print(f"CPU percent: {process.cpu_percent(interval=0.1)}%")
    print("--------------------------------")


# List of queries to test (function, testing arguments)
performance_tests = [
    (available_courses, ()),  # no arguments needed for this query`
    (available_departments, ()),  # no arguments needed for this query
    (search_expertise, ()),  # no arguments needed for this query
    (lectures_search_semester, (1,)),  # particular semester_id
    (lecturer_search_per_course, ("CS101",)),  # particular course_code
    (lecturer_search_per_expertise, ("AI, Machine Learning",)),  # expertise
    (lecturer_search_per_department, ("Computer Science",)),  # department
    (search_courses_per_department_per_lecturer, ("Computer Science", "Dr. Alice Johnson")),  # department, lecturer
    (available_semesters, ()),  # no arguments needed for this query
    (student_search_not_enrolled, ()),  # no arguments needed for this query
    (student_search_last_year_and_results, ()),  # no arguments needed for this query
    (student_search_per_course_per_lecturer, ("CS101", "Dr. Alice Johnson"))  # course_code, lecturer_name
]

if __name__ == "__main__":
    for function, args in performance_tests:
        measure_performance(function, *args)