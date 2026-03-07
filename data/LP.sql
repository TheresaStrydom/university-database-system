-- ============================================================================
-- UNIVERSITY RECORD MANAGEMENT SYSTEM - DATABASE SCHEMA (MySQL)
-- ============================================================================

CREATE DATABASE IF NOT EXISTS university_records;
USE university_records;

-- Drop existing tables (reverse dependency order)
DROP TABLE IF EXISTS OrganisationMembers;
DROP TABLE IF EXISTS StudentOrganisations;
DROP TABLE IF EXISTS CommitteeMembers;
DROP TABLE IF EXISTS Committees;
DROP TABLE IF EXISTS LecturerPublications;
DROP TABLE IF EXISTS ResearchProjectTeamMembers;
DROP TABLE IF EXISTS ResearchProjects;
DROP TABLE IF EXISTS CourseMaterials;
DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS ProgramCourses;
DROP TABLE IF EXISTS CourseLecturers;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Programs;
DROP TABLE IF EXISTS NonAcademicStaff;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Lecturers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Semesters;
DROP TABLE IF EXISTS AcademicYears;

-- ============================================================================
-- REFERENCE TABLES
-- ============================================================================

CREATE TABLE AcademicYears (
academic_year_id INT AUTO_INCREMENT PRIMARY KEY,
year_start INT NOT NULL,
year_end INT NOT NULL,
is_current TINYINT(1) DEFAULT 0,
UNIQUE (year_start, year_end)
);

CREATE TABLE Semesters (
semester_id INT AUTO_INCREMENT PRIMARY KEY,
academic_year_id INT NOT NULL,
semester_number INT NOT NULL,
semester_name VARCHAR(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
UNIQUE (academic_year_id, semester_number),
CHECK (semester_number IN (1,2,3)),
FOREIGN KEY (academic_year_id)
REFERENCES AcademicYears(academic_year_id)
ON DELETE CASCADE
);

CREATE TABLE Departments (
department_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
faculty VARCHAR(100),
research_areas TEXT,
head_lecturer_id INT,
phone VARCHAR(20),
email VARCHAR(100),
office_location VARCHAR(100),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================================
-- PEOPLE TABLES
-- ============================================================================

CREATE TABLE Lecturers (
lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department_id INT NOT NULL,
academic_qualifications VARCHAR(255),
expertise_areas VARCHAR(255),
publications TEXT,
office_location VARCHAR(100),
contact_info VARCHAR(100),
phone VARCHAR(20),
course_load INT DEFAULT 0,
research_interests VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE
);

CREATE TABLE NonAcademicStaff (
staff_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
job_title VARCHAR(100) NOT NULL,
department_id INT NOT NULL,
employment_type VARCHAR(50),
contract_start_date DATE,
contract_end_date DATE,
salary_band VARCHAR(50),
contact_info VARCHAR(100),
phone VARCHAR(20),
emergency_contact_name VARCHAR(100),
emergency_contact_phone VARCHAR(20),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE
);

-- ============================================================================
-- PROGRAMS AND COURSES
-- ============================================================================

CREATE TABLE Programs (
program_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
degree_awarded VARCHAR(50) NOT NULL,
duration_years INT,
department_id INT NOT NULL,
course_requirements INT,
total_credits INT,
enrollment_capacity INT,
current_enrollment INT DEFAULT 0,
description TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE
);

CREATE TABLE Courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_code VARCHAR(20) NOT NULL UNIQUE,
name VARCHAR(100) NOT NULL,
description TEXT,
department_id INT NOT NULL,
level INT,
credits INT DEFAULT 20,
prerequisites VARCHAR(255),
enrollment_capacity INT,
enrollment_count INT DEFAULT 0,
schedule VARCHAR(255),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CHECK (level IN (1,2,3)),
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE
);

CREATE TABLE Students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
date_of_birth DATE,
contact_info VARCHAR(100),
phone VARCHAR(20),
address VARCHAR(255),
program_id INT NOT NULL,
year_of_study INT DEFAULT 1,
graduation_status VARCHAR(50) DEFAULT 'Active',
advisor_id INT,
enrollment_date DATE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
UNIQUE (name, date_of_birth),
FOREIGN KEY (program_id)
REFERENCES Programs(program_id)
ON DELETE CASCADE,
FOREIGN KEY (advisor_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE SET NULL
);

-- ============================================================================
-- JUNCTION TABLES
-- ============================================================================

CREATE TABLE CourseLecturers (
course_lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
course_id INT NOT NULL,
lecturer_id INT NOT NULL,
is_primary TINYINT(1) DEFAULT 1,
UNIQUE (course_id, lecturer_id),
FOREIGN KEY (course_id)
REFERENCES Courses(course_id)
ON DELETE CASCADE,
FOREIGN KEY (lecturer_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE CASCADE
);

CREATE TABLE ProgramCourses (
program_course_id INT AUTO_INCREMENT PRIMARY KEY,
program_id INT NOT NULL,
course_id INT NOT NULL,
is_required TINYINT(1) DEFAULT 1,
UNIQUE (program_id, course_id),
FOREIGN KEY (program_id)
REFERENCES Programs(program_id)
ON DELETE CASCADE,
FOREIGN KEY (course_id)
REFERENCES Courses(course_id)
ON DELETE CASCADE
);

CREATE TABLE CourseMaterials (
material_id INT AUTO_INCREMENT PRIMARY KEY,
course_id INT NOT NULL,
material_type VARCHAR(50),
title VARCHAR(200) NOT NULL,
file_path VARCHAR(255),
upload_date DATE,
FOREIGN KEY (course_id)
REFERENCES Courses(course_id)
ON DELETE CASCADE
);

-- ============================================================================
-- ENROLLMENTS
-- ============================================================================

CREATE TABLE Enrollments (
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
semester_id INT NOT NULL,
enrollment_date DATE NOT NULL,
grade VARCHAR(2),
grade_numeric DECIMAL(5,2),
attendance_percentage DECIMAL(5,2),
status VARCHAR(50) DEFAULT 'Active',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
UNIQUE (student_id, course_id, semester_id),
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE,
FOREIGN KEY (course_id)
REFERENCES Courses(course_id)
ON DELETE CASCADE,
FOREIGN KEY (semester_id)
REFERENCES Semesters(semester_id)
ON DELETE CASCADE
);

-- ============================================================================
-- RESEARCH
-- ============================================================================

CREATE TABLE ResearchProjects (
project_id INT AUTO_INCREMENT PRIMARY KEY,
project_title VARCHAR(200) NOT NULL,
principal_investigator_id INT NOT NULL,
department_id INT NOT NULL,
funding_source VARCHAR(100),
funding_amount DECIMAL(12,2),
start_date DATE,
end_date DATE,
description TEXT,
publications TEXT,
outcomes TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (principal_investigator_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE CASCADE,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE
);

CREATE TABLE ResearchProjectTeamMembers (
team_member_id INT AUTO_INCREMENT PRIMARY KEY,
project_id INT NOT NULL,
lecturer_id INT,
staff_id INT,
student_id INT,
role VARCHAR(100),
FOREIGN KEY (project_id)
REFERENCES ResearchProjects(project_id)
ON DELETE CASCADE,
FOREIGN KEY (lecturer_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE CASCADE,
FOREIGN KEY (staff_id)
REFERENCES NonAcademicStaff(staff_id)
ON DELETE CASCADE,
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE
);

CREATE TABLE LecturerPublications (
publication_id INT AUTO_INCREMENT PRIMARY KEY,
lecturer_id INT NOT NULL,
publication_title VARCHAR(255) NOT NULL,
publication_year INT,
publication_type VARCHAR(50),
journal_conference_name VARCHAR(255),
url VARCHAR(255),
FOREIGN KEY (lecturer_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE CASCADE
);

-- ============================================================================
-- COMMITTEES
-- ============================================================================

CREATE TABLE Committees (
committee_id INT AUTO_INCREMENT PRIMARY KEY,
committee_name VARCHAR(100) NOT NULL UNIQUE,
department_id INT,
purpose VARCHAR(255),
meeting_frequency VARCHAR(50),
chair_lecturer_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE,
FOREIGN KEY (chair_lecturer_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE SET NULL
);

CREATE TABLE CommitteeMembers (
committee_member_id INT AUTO_INCREMENT PRIMARY KEY,
committee_id INT NOT NULL,
lecturer_id INT,
staff_id INT,
role VARCHAR(50),
join_date DATE,
FOREIGN KEY (committee_id)
REFERENCES Committees(committee_id)
ON DELETE CASCADE,
FOREIGN KEY (lecturer_id)
REFERENCES Lecturers(lecturer_id)
ON DELETE CASCADE,
FOREIGN KEY (staff_id)
REFERENCES NonAcademicStaff(staff_id)
ON DELETE CASCADE
);

-- ============================================================================
-- STUDENT ORGANISATIONS
-- ============================================================================

CREATE TABLE StudentOrganisations (
organisation_id INT AUTO_INCREMENT PRIMARY KEY,
organisation_name VARCHAR(100) NOT NULL UNIQUE,
organisation_type VARCHAR(50),
department_id INT,
president_student_id INT,
description TEXT,
meeting_day VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
ON DELETE CASCADE,
FOREIGN KEY (president_student_id)
REFERENCES Students(student_id)
ON DELETE SET NULL
);

CREATE TABLE OrganisationMembers (
organisation_member_id INT AUTO_INCREMENT PRIMARY KEY,
organisation_id INT NOT NULL,
student_id INT NOT NULL,
role VARCHAR(50) DEFAULT 'Member',
join_date DATE,
UNIQUE (organisation_id, student_id),
FOREIGN KEY (organisation_id)
REFERENCES StudentOrganisations(organisation_id)
ON DELETE CASCADE,
FOREIGN KEY (student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE
);

-- ============================================================================
-- VIEWS
-- ============================================================================

CREATE VIEW StudentGradeSummary AS
SELECT
s.student_id,
s.name,
p.name AS program_name,
COUNT(e.enrollment_id) AS courses_completed,
ROUND(AVG(CAST(e.grade_numeric AS DECIMAL(5,2))),2) AS average_grade,
MIN(e.grade_numeric) AS lowest_grade,
MAX(e.grade_numeric) AS highest_grade
FROM Students s
INNER JOIN Programs p ON s.program_id = p.program_id
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.grade_numeric IS NOT NULL
GROUP BY s.student_id, s.name, p.name;

CREATE VIEW LecturerCourseLoad AS
SELECT
l.lecturer_id,
l.name,
d.name AS department,
COUNT(DISTINCT cl.course_id) AS courses_teaching,
COUNT(DISTINCT e.student_id) AS total_students
FROM Lecturers l
INNER JOIN Departments d ON l.department_id = d.department_id
LEFT JOIN CourseLecturers cl ON l.lecturer_id = cl.lecturer_id
LEFT JOIN Enrollments e ON cl.course_id = e.course_id
GROUP BY l.lecturer_id, l.name, d.name;

CREATE VIEW DepartmentCourseOfferings AS
SELECT
d.department_id,
d.name AS department,
COUNT(DISTINCT c.course_id) AS total_courses,
SUM(c.enrollment_count) AS total_enrollment,
COUNT(DISTINCT l.lecturer_id) AS lecturer_count
FROM Departments d
LEFT JOIN Courses c ON d.department_id = c.department_id
LEFT JOIN CourseLecturers cl ON c.course_id = cl.course_id
LEFT JOIN Lecturers l ON cl.lecturer_id = l.lecturer_id
GROUP BY d.department_id, d.name;
