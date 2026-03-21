"""
Perfrom Non-functional testing for all queries in DB_Search,
including queries execution time, resources utilisation, non-functional query validation , 
repeat run for checking average execution time to ensure stability.
"""
import os
import time
import psutil
import pytest


from DB_Search.course_search import available_courses, search_courses_per_department_per_lecturer
from DB_Search.department_search import available_departments
from DB_Search.expertise_search import search_expertise
from DB_Search.lectures_search import lectures_search_semester, lecturer_search_per_course, \
    lecturer_search_per_expertise, lecturer_search_per_department
from DB_Search.semester_search import available_semesters
from DB_Search.student_search import student_search_not_enrolled, student_search_last_year_and_results, \
    student_search_per_course_per_lecturer

# Measure performance of a query function, excecute time,memory usage, CPU usage, and number of rows returned.
# Repeat the test 10 times to get an average execution time.


def measure_performance(function,*args):
    times = []
    result = None

    for _ in range(10):
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


# List of queries to test (function, testing arguments depending on the query)
test_queries_list = [
    (available_courses,()),
    (available_departments, ()),
    (search_expertise, ()),
    (lectures_search_semester, ("17",)),
    (lecturer_search_per_course, ("CS101",)),
    (lecturer_search_per_expertise, ("AI, Machine Learning",)),
    (lecturer_search_per_department, ("Computer Science",)),
    (search_courses_per_department_per_lecturer, ("CS401","Database Systems")),
    (available_semesters, ()),
    (student_search_not_enrolled, ()),
    (student_search_last_year_and_results, ()),
    (student_search_per_course_per_lecturer, ("CS101", "Dr. Alice Johnson"))
]

@pytest.mark.parametrize("function,args", test_queries_list)
def test_performance (function, args):
    measure_performance(function, *args)
    