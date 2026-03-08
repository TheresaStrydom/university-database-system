import tkinter as tk
from tkinter import ttk
from DB_Search.course_search import available_courses
from DB_Search.lectures_search import lecturer_search_per_course
from DB_Search.student_search import student_search_per_course_per_lecturer
from DB_Search.student_search import student_search_last_year_and_results
from DB_Search.student_search import student_search_not_enrolled
from DB_Search.expertise_search import search_expertise
from DB_Search.lectures_search import lecturer_search_per_expertise
from DB_Search.department_search import available_departments
from DB_Search.lectures_search import lecturer_search_per_department
from DB_Search.course_search import search_courses_per_department_per_lecturer

# Example query functions
def get_courses():
    courses = available_courses()
    courses = [f"{row[0]} - {row[1]}" for row in courses]
    return courses

def get_departments():
    depart = available_departments()
    return depart

def get_lect(department):
    lecturer = lecturer_search_per_department(department)
    return lecturer

def get_lecturers(course):
    course_code = course.split(" - ")[0]
    lecturers = lecturer_search_per_course(course_code)
    return lecturers

def get_course(department, lecturer):
    courses = search_courses_per_department_per_lecturer(department, lecturer)
    courses = [f"{row[0]} - {row[1]}" for row in courses]
    return courses

def get_students(course, lecturer):
    course_code = course.split(" - ")[0]
    students = student_search_per_course_per_lecturer(course_code, lecturer)
    return students

root = tk.Tk()
root.geometry("500x400")
root.title("University System")

# -------------------------
# Frames
# -------------------------
menu_frame = tk.Frame(root)
option1_frame = tk.Frame(root)
option2_frame = tk.Frame(root)
option3_frame = tk.Frame(root)
option4_frame = tk.Frame(root)
option5_frame = tk.Frame(root)


menu_frame.pack(fill="both", expand=True)

# -------------------------
# Function to change pages
# -------------------------

def show_option5():
    menu_frame.pack_forget()
    option5_frame.pack(fill="both", expand=True)

def show_option4():
    menu_frame.pack_forget()
    option4_frame.pack(fill="both", expand=True)

def show_option3():
    menu_frame.pack_forget()
    option3_frame.pack(fill="both", expand=True)

def show_option2():
    menu_frame.pack_forget()
    option2_frame.pack(fill="both", expand=True)

def go_home5():
    option5_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)

def go_home4():
    option4_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)

def go_home3():
    option3_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)

def go_home2():
    option2_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)

def show_option1():
    menu_frame.pack_forget()
    option1_frame.pack(fill="both", expand=True)

def go_home():
    option1_frame.pack_forget()
    menu_frame.pack(fill="both", expand=True)


# -------------------------
# MENU PAGE
# -------------------------
tk.Label(menu_frame, text="Select an Option", font=("Arial", 16)).pack(pady=20)

tk.Button(menu_frame, text="Option 1 - View Courses", width=30, command=show_option1).pack(pady=5)
tk.Button(menu_frame, text="Option 2 - Top Final Year Students", width=30, command=show_option2).pack(pady=5)
tk.Button(menu_frame, text="Option 3 - Unregistered Students", width=30, command=show_option3).pack(pady=5)
tk.Button(menu_frame, text="Option 4 - Expertise per lecturer", width=30, command=show_option4).pack(pady=5)
tk.Button(menu_frame, text="Option 5 - Courses by department", width=30,command=show_option5).pack(pady=5)

# -------------------------
# OPTION 1 PAGE
# -------------------------
tk.Label(option1_frame, text="Course Selection", font=("Arial", 16)).pack(pady=10)

course_var = tk.StringVar()
lecturer_var = tk.StringVar()

# -------------------
# Update lecturers
# -------------------
def course_selected(event):

    course = course_var.get()

    lecturers = get_lecturers(course)

    lecturer_dropdown["values"] = lecturers
    lecturer_dropdown.config(state="readonly")

    lecturer_var.set("")
    students_label.config(text="")

# -------------------
# Show students
# -------------------
def lecturer_selected(event):

    course = course_var.get()
    lecturer = lecturer_var.get()

    students = get_students(course, lecturer)

    students_label.config(text="\n".join(students))

# -------------------
# Course Dropdown
# -------------------
tk.Label(option1_frame, text="Select Course").pack(pady=10)

course_dropdown = ttk.Combobox(
    option1_frame,
    textvariable=course_var,
    values=get_courses(),
    state="readonly",
    width=35
)

course_dropdown.pack(pady=15,padx=15)
course_dropdown.bind("<<ComboboxSelected>>", course_selected)

# -------------------
# Lecturer Dropdown
# -------------------

tk.Label(option1_frame, text="Select Lecturer").pack(pady=5)

lecturer_dropdown = ttk.Combobox(
    option1_frame,
    textvariable=lecturer_var,
    state="disabled",
    width=35
)

lecturer_dropdown.pack(pady=5)
lecturer_dropdown.bind("<<ComboboxSelected>>", lecturer_selected)

# -------------------
# Students Display
# -------------------
students_label = tk.Label(option1_frame, text="")
students_label.pack(pady=20)


tk.Button(option1_frame, text="Back", command=go_home).pack(pady=10)



# -------------------------
# OPTION 2 PAGE
# -------------------------
tk.Label(option2_frame, text="Top Final Year Students", font=("Arial", 16)).pack(pady=10)

top_students = tk.Label(option2_frame, text="Results")
top_students.pack(pady=20)

top_student = student_search_last_year_and_results()
top_students.config(text="\n".join(top_student))

tk.Button(option2_frame, text="Back", command=go_home2).pack(pady=10)

# -------------------------
# OPTION 3 PAGE
# -------------------------
tk.Label(option3_frame, text="Unregistered students in Current Semester", font=("Arial", 16)).pack(pady=10)

unreg_students = tk.Label(option3_frame, text="Unregistered students")
unreg_students.pack(pady=20)

unreg_students_search = student_search_not_enrolled()
unreg_students.config(text="\n".join(unreg_students_search))

tk.Button(option3_frame, text="Back", command=go_home3).pack(pady=10)

# -------------------------
# OPTION 4 PAGE
# -------------------------
tk.Label(option4_frame, text="Expertise per lecturer", font=("Arial", 16)).pack(pady=10)

exp_area_search = search_expertise()
areas = tk.StringVar(value='Available Areas')

areas_dropdown = tk.OptionMenu(option4_frame,areas,*exp_area_search)
areas_dropdown.pack(pady=5)

def show_lecturers():
    exp_area_selected = areas.get()
    lecturers = lecturer_search_per_expertise(exp_area_selected)
    label.config(text="\n".join(lecturers))

tk.Button(option4_frame, text="Search", command=show_lecturers).pack(pady=10)

label = tk.Label(option4_frame, text="Expert Lecturer(s): ")
label.pack(pady=5)

tk.Button(option4_frame, text="Back", command=go_home4).pack(pady=50)

# -------------------------
# OPTION 5 PAGE
# -------------------------
tk.Label(option5_frame, text="Next Filter", font=("Arial", 16)).pack(pady=10)

depart_var = tk.StringVar()
lect_var = tk.StringVar()

# -------------------
# Update lecturers
# -------------------

def depart_selected(event):
    depart = depart_var.get()
    lecturer = get_lect(depart)

    lect_dropdown["values"] = lecturer
    lect_dropdown.config(state="readonly")

    lect_var.set("")
    label_course.config(text="")

# -------------------
# Show courses
# -------------------

def lect_selected(event):
    depart = depart_var.get()
    lect = lect_var.get()

    courses = get_course(depart, lect)

    if isinstance(courses, str):
        label_course.config(text=courses)
    else:
        label_course.config(text="\n".join(courses))

# -------------------
# Department Dropdown
# -------------------

tk.Label(option5_frame, text="Select Department").pack(pady=10)

depart_dropdown = ttk.Combobox(
    option5_frame,
    textvariable=depart_var,
    values=get_departments(),
    state="readonly",
    width =35
)

depart_dropdown.pack(pady=15,padx=15)
depart_dropdown.bind("<<ComboboxSelected>>", depart_selected)

# -------------------
# Department Lecturer
# -------------------

tk.Label(option5_frame, text="Select Lecturer").pack(pady=5)

lect_dropdown = ttk.Combobox(
    option5_frame,
    textvariable=lect_var,
    state="disabled",
    width=35
)

lect_dropdown.pack(pady=5)
lect_dropdown.bind("<<ComboboxSelected>>", lect_selected)

# -------------------
# Courses Display
# -------------------

label_course = tk.Label(option5_frame, text="")
label_course.pack(pady=20)

tk.Button(option5_frame, text="Back", command=go_home5).pack(pady=50)

root.mainloop()