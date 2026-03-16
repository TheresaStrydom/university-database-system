"""
University Record Management System - Graphical User Interface
==============================================================
This module provides a tkinter-based GUI for querying the university
database. It supports five query options covering students, lecturers,
courses, departments, and expertise areas.

Module: interface.py
Standard: PEP-8 compliant
"""

import tkinter as tk
from tkinter import ttk

from DB_Search.course_search import available_courses
from DB_Search.course_search import search_courses_per_department_per_lecturer
from DB_Search.department_search import available_departments
from DB_Search.expertise_search import search_expertise
from DB_Search.lectures_search import lecturer_search_per_course
from DB_Search.lectures_search import lecturer_search_per_department
from DB_Search.lectures_search import lecturer_search_per_expertise
from DB_Search.student_search import student_search_last_year_and_results
from DB_Search.student_search import student_search_not_enrolled
from DB_Search.student_search import student_search_per_course_per_lecturer

# ---------------------------------------------------------------------------
# Colour constants (WCAG 2.2 Level AA compliant)
# ---------------------------------------------------------------------------
COLOUR_ERROR = "#B00020"       # Dark red — contrast ratio ~7.5:1 on white
FONT_DEFAULT = ("Arial", 10)
FONT_HEADING = ("Arial", 16)


# ---------------------------------------------------------------------------
# Query helper functions
# ---------------------------------------------------------------------------

def get_courses():
    """Return a formatted list of course codes and names."""
    courses = available_courses()
    return [f"{row[0]} - {row[1]}" for row in courses]


def get_departments():
    """Return a list of department names."""
    return available_departments()


def get_lect(department):
    """Return a list of lecturers for the given department."""
    return lecturer_search_per_department(department)


def get_lecturers(course):
    """Return a list of lecturers for the given course code."""
    course_code = course.split(" - ")[0]
    return lecturer_search_per_course(course_code)


def get_course(department, lecturer):
    """Return a formatted list of courses for a given department and lecturer."""
    courses = search_courses_per_department_per_lecturer(department, lecturer)
    return [f"{row[0]} - {row[1]}" for row in courses]


def get_students(course, lecturer):
    """Return a list of students enrolled in the given course with the given lecturer."""
    course_code = course.split(" - ")[0]
    return student_search_per_course_per_lecturer(course_code, lecturer)


# ---------------------------------------------------------------------------
# Root window setup
# ---------------------------------------------------------------------------

root = tk.Tk()
root.geometry("400x600")
root.title("University System")


# ---------------------------------------------------------------------------
# Frame definitions
# ---------------------------------------------------------------------------

menu_frame = tk.Frame(root)
option1_frame = tk.Frame(root)
option2_frame = tk.Frame(root)
option3_frame = tk.Frame(root)
option4_frame = tk.Frame(root)
option5_frame = tk.Frame(root)

menu_frame.pack(fill="both", expand=True)


# ---------------------------------------------------------------------------
# Navigation functions
# ---------------------------------------------------------------------------

def show_option1():
    """Navigate to the Students by Course page."""
    menu_frame.pack_forget()
    option1_frame.pack(fill="both", expand=True)


def show_option2():
    """Navigate to the Top Graduating Students page."""
    menu_frame.pack_forget()
    option2_frame.pack(fill="both", expand=True)


def show_option3():
    """Navigate to the Unenrolled Students page."""
    menu_frame.pack_forget()
    option3_frame.pack(fill="both", expand=True)


def show_option4():
    """Navigate to the Find Expert Lecturers page."""
    menu_frame.pack_forget()
    option4_frame.pack(fill="both", expand=True)


def show_option5():
    """Navigate to the Department Course Search page."""
    menu_frame.pack_forget()
    option5_frame.pack(fill="both", expand=True)


def go_home():
    """Return to the main menu from Option 1."""
    option1_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


def go_home2():
    """Return to the main menu from Option 2."""
    option2_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


def go_home3():
    """Return to the main menu from Option 3."""
    option3_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


def go_home4():
    """Return to the main menu from Option 4."""
    option4_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


def go_home5():
    """Return to the main menu from Option 5."""
    option5_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


# ---------------------------------------------------------------------------
# MENU PAGE
# ---------------------------------------------------------------------------

tk.Label(menu_frame, text="Select an Option", font=FONT_HEADING).pack(pady=20)

tk.Button(
    menu_frame, text="Students by Course",
    width=30, command=show_option1
).pack(pady=5)

tk.Button(
    menu_frame, text="Top Graduating Students",
    width=30, command=show_option2
).pack(pady=5)

tk.Button(
    menu_frame, text="Unenrolled Students",
    width=30, command=show_option3
).pack(pady=5)

tk.Button(
    menu_frame, text="Find Expert Lecturers",
    width=30, command=show_option4
).pack(pady=5)

tk.Button(
    menu_frame, text="Department Course Search",
    width=30, command=show_option5
).pack(pady=5)


# ---------------------------------------------------------------------------
# OPTION 1 PAGE — Students by Course
# ---------------------------------------------------------------------------

tk.Label(
    option1_frame, text="Course Selection", font=FONT_HEADING
).pack(pady=10)

course_var = tk.StringVar()
lecturer_var = tk.StringVar()


def course_selected(event):
    """Update the lecturer dropdown when a course is selected."""
    course = course_var.get()
    lecturers = get_lecturers(course)

    if not lecturers:
        feedback_label.config(
            text="No lecturers found for this course",
            foreground=COLOUR_ERROR
        )
    else:
        feedback_label.config(text="")  # Clear any previous error message
        lecturer_dropdown["values"] = lecturers
        lecturer_dropdown.config(state="readonly")
        lecturer_var.set("")
        students_text.delete("1.0", "end")


def lecturer_selected(event):
    """Display enrolled students when a lecturer is selected."""
    course = course_var.get()
    lecturer = lecturer_var.get()
    students = get_students(course, lecturer)

    students_text.delete("1.0", "end")
    for student in students:
        students_text.insert("end", f"{student}\n")


# Course dropdown
tk.Label(option1_frame, text="Select Course").pack(pady=10)

course_dropdown = ttk.Combobox(
    option1_frame,
    textvariable=course_var,
    values=get_courses(),
    state="readonly",
    width=35
)
course_dropdown.pack(pady=15, padx=15)
course_dropdown.bind("<<ComboboxSelected>>", course_selected)

# Feedback label for validation messages
feedback_label = tk.Label(
    option1_frame,
    text="",
    foreground=COLOUR_ERROR,
    font=FONT_DEFAULT
)
feedback_label.pack(pady=5)

# Lecturer dropdown
tk.Label(option1_frame, text="Select Lecturer").pack(pady=5)

lecturer_dropdown = ttk.Combobox(
    option1_frame,
    textvariable=lecturer_var,
    state="disabled",
    width=35
)
lecturer_dropdown.pack(pady=5)
lecturer_dropdown.bind("<<ComboboxSelected>>", lecturer_selected)

# Students results display with scrollbar
scrollbar = tk.Scrollbar(option1_frame)
scrollbar.pack(side="right", fill="y")

students_text = tk.Text(
    option1_frame,
    height=13,
    width=30,
    yscrollcommand=scrollbar.set
)
students_text.pack(pady=20)
scrollbar.config(command=students_text.yview)

tk.Button(option1_frame, text="Back", command=go_home).pack(pady=10)


# ---------------------------------------------------------------------------
# OPTION 2 PAGE — Top Graduating Students
# ---------------------------------------------------------------------------

tk.Label(
    option2_frame, text="Top Final Year Students", font=FONT_HEADING
).pack(pady=10)

# Results display with scrollbar
scrollbar2 = tk.Scrollbar(option2_frame, width=20)
scrollbar2.pack(side="right", fill="y")

top_students_text = tk.Text(
    option2_frame,
    height=26,
    width=40,
    yscrollcommand=scrollbar2.set
)
top_students_text.pack(pady=20)
scrollbar2.config(command=top_students_text.yview)

# Populate results on page load
top_student = student_search_last_year_and_results()
for student in top_student:
    top_students_text.insert("end", f"{student}\n")

tk.Button(option2_frame, text="Back", command=go_home2).pack(pady=10)


# ---------------------------------------------------------------------------
# OPTION 3 PAGE — Unenrolled Students
# ---------------------------------------------------------------------------

tk.Label(
    option3_frame,
    text="Unregistered students-Current Semester",
    font=FONT_HEADING
).pack(pady=10)

# Results display with scrollbar
scrollbar3 = tk.Scrollbar(option3_frame, width=20)
scrollbar3.pack(side="right", fill="y")

unreg_students_text = tk.Text(
    option3_frame,
    height=26,
    width=40,
    yscrollcommand=scrollbar3.set
)
unreg_students_text.pack(pady=20)
scrollbar3.config(command=unreg_students_text.yview)

# Populate results on page load
unreg_students_search = student_search_not_enrolled()
for student in unreg_students_search:
    unreg_students_text.insert("end", f"{student}\n")

tk.Button(option3_frame, text="Back", command=go_home3).pack(pady=10)


# ---------------------------------------------------------------------------
# OPTION 4 PAGE — Find Expert Lecturers
# ---------------------------------------------------------------------------

tk.Label(
    option4_frame, text="Expertise per lecturer", font=FONT_HEADING
).pack(pady=10)

# Expertise area dropdown
exp_area_search = search_expertise()
areas = tk.StringVar(value="Select Expertise Area")

areas_dropdown = ttk.Combobox(
    option4_frame,
    textvariable=areas,
    values=exp_area_search if exp_area_search else ["No data available"],
    state="readonly",
    width=35
)
areas_dropdown.pack(pady=10)

# Feedback label for validation messages
feedback_label4 = tk.Label(
    option4_frame,
    text="",
    foreground=COLOUR_ERROR,
    font=FONT_DEFAULT
)
feedback_label4.pack(pady=5)


def show_lecturers():
    """Display lecturers matching the selected expertise area."""
    exp_area_selected = areas.get()

    if not exp_area_selected or exp_area_selected == "Select Expertise Area":
        feedback_label4.config(
            text="Please select an expertise area",
            foreground=COLOUR_ERROR
        )
        return

    lecturers = lecturer_search_per_expertise(exp_area_selected)
    lecturers_text4.delete("1.0", "end")

    if not lecturers:
        feedback_label4.config(
            text="No lecturers found for this area",
            foreground=COLOUR_ERROR
        )
    else:
        feedback_label4.config(text="")  # Clear any previous error message
        for lecturer in lecturers:
            lecturers_text4.insert("end", f"{lecturer}\n")


tk.Button(
    option4_frame, text="Search",
    command=show_lecturers, width=20
).pack(pady=10)

# Results display with scrollbar
scrollbar4 = tk.Scrollbar(option4_frame, width=20)
scrollbar4.pack(side="right", fill="y")

lecturers_text4 = tk.Text(
    option4_frame,
    height=12,
    width=40,
    yscrollcommand=scrollbar4.set
)
lecturers_text4.pack(pady=10)
scrollbar4.config(command=lecturers_text4.yview)

tk.Button(
    option4_frame, text="Back",
    command=go_home4, width=20
).pack(pady=10)


# ---------------------------------------------------------------------------
# OPTION 5 PAGE — Department Course Search
# ---------------------------------------------------------------------------

tk.Label(
    option5_frame, text="Courses by Department", font=FONT_HEADING
).pack(pady=10)

depart_var = tk.StringVar()
lect_var = tk.StringVar()


def depart_selected(event):
    """Update the lecturer dropdown when a department is selected."""
    depart = depart_var.get()
    lecturers = get_lect(depart)

    lect_dropdown["values"] = lecturers
    lect_dropdown.config(state="readonly")
    lect_var.set("")
    courses_text5.delete("1.0", "end")
    feedback_label5.config(text="")


def lect_selected(event):
    """Display courses when a lecturer is selected."""
    depart = depart_var.get()
    lect = lect_var.get()
    courses = get_course(depart, lect)

    courses_text5.delete("1.0", "end")

    if not courses:
        feedback_label5.config(
            text="No courses found for this lecturer",
            foreground=COLOUR_ERROR
        )
    else:
        feedback_label5.config(text="")  # Clear any previous error message
        for course in courses:
            courses_text5.insert("end", f"{course}\n")


# Department dropdown
tk.Label(option5_frame, text="Select Department").pack(pady=10)

depart_dropdown = ttk.Combobox(
    option5_frame,
    textvariable=depart_var,
    values=get_departments(),
    state="readonly",
    width=35
)
depart_dropdown.pack(pady=15, padx=15)
depart_dropdown.bind("<<ComboboxSelected>>", depart_selected)

# Feedback label for validation messages
feedback_label5 = tk.Label(
    option5_frame,
    text="",
    foreground=COLOUR_ERROR,
    font=FONT_DEFAULT
)
feedback_label5.pack(pady=5)

# Lecturer dropdown
tk.Label(option5_frame, text="Select Lecturer").pack(pady=5)

lect_dropdown = ttk.Combobox(
    option5_frame,
    textvariable=lect_var,
    state="disabled",
    width=35
)
lect_dropdown.pack(pady=5)
lect_dropdown.bind("<<ComboboxSelected>>", lect_selected)

# Courses results display with scrollbar
scrollbar5 = tk.Scrollbar(option5_frame, width=20)
scrollbar5.pack(side="right", fill="y")

courses_text5 = tk.Text(
    option5_frame,
    height=12,
    width=40,
    yscrollcommand=scrollbar5.set
)
courses_text5.pack(pady=10)
scrollbar5.config(command=courses_text5.yview)

tk.Button(option5_frame, text="Back", command=go_home5).pack(pady=10)


# ---------------------------------------------------------------------------
# Launch application
# ---------------------------------------------------------------------------

root.mainloop()
