import tkinter as tk
from DD_Search.semester_search import available_semesters
from DD_Search.lectures_search import lectures_search


root = tk.Tk()
root.geometry("400x400")

# Dropdown options
semesters = available_semesters()

# Selected option variable
options = tk.StringVar(value="Available Semesters")

# Dropdown menu
option_menu = tk.OptionMenu(root, options, *semesters)
option_menu.pack(pady=20)


# Button to update label
#Button(root, text="Click Me", command=show_lectures()).pack()


def show_lectures():
    semester = options.get()
    results = lectures_search(semester)
    lbl.config(text="Available Lecturer(s): " + ", ".join(results))

button = tk.Button(root, text="Search", command=show_lectures)
button.pack(pady=20)

lbl = tk.Label(root, text="Available Lecturer(s): ")
lbl.pack()


root.mainloop()