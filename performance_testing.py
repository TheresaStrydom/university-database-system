
import os
import sys
import time
import psutil


# ensure project root is on path so DB_Search can be imported from anywhere
root = os.path.dirname(os.path.dirname(__file__))
if root not in sys.path:
    sys.path.insert(0, root)

from DB_Search.course_search import available_courses, search_courses_per_department_per_lecturer
from DB_Search.department_search import available_departments
from DB_Search.expertise_search import search_expertise
from DB_Search.lectures_search import lectures_search_semester, lecturer_search_per_course, lecturer_search_per_expertise, lecturer_search_per_department
from DB_Search.semester_search import available_semesters
from DB_Search.student_search import student_search_not_enrolled, student_search_last_year_and_results, student_search_per_course_per_lecturer


# reusable performance tester
def measure_performance(function, *args):
    start = time.time()
    result = function(*args)
    end = time.time()
    print(f"Function: {function.__name__}")
    
    if result is None:
        print("Query failed, no rows returned.")
    else:
        print(f"Rows returned: {len(result)}")
    print(f"Execution time: {end - start:.4f} seconds \n")
    process = psutil.Process(os.getpid())
    print(f"Memory used: {process.memory_info().rss / (1024*1024):.2f} MB")
    print(f"CPU percent: {process.cpu_percent(interval=0.1)}%")
    print("--------------------------------")
    
# list of queries to test (function, args)
performance_tests = [
    (available_courses, ()),
    (available_departments, ()),
    (search_expertise, ()),
    (lectures_search_semester, (1,)),  # semester_id
    (lecturer_search_per_course, ("CS101",)),  # course_code
    (lecturer_search_per_expertise, ("AI, Machine Learning",)),  # expertise
    (lecturer_search_per_department, ("Computer Science",)),  # department
    (search_courses_per_department_per_lecturer, ("Computer Science", "Dr. Alice Johnson")),  # department, lecturer
    (available_semesters, ()), 
    (student_search_not_enrolled, ()),
    (student_search_last_year_and_results, ()),
    (student_search_per_course_per_lecturer, ("CS101", "Dr. Alice Johnson"))  # course_code, lecturer_name
]

# run all performance tests
if __name__ == "__main__":
    for test in performance_tests:
        function, args = test
        measure_performance(function, *args)