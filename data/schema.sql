-- ============================================================================
-- UNIVERSITY RECORD MANAGEMENT SYSTEM - DATABASE SCHEMA (SQLite)
-- ============================================================================
-- This schema implements a normalised relational database for managing:
-- Students, Lecturers, Non-Academic Staff, Courses, Departments, Programs,
-- and Research Projects
--
-- Database: university_records
-- DBMS: SQLite 
-- Created: March 2026
-- ============================================================================



-- Drop existing tables if they exist (for clean reinstall)
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
-- REFERENCE TABLES (Independent tables with no foreign keys)
-- ============================================================================

-- Academic Years (e.g., 2024-2025, 2025-2026)
CREATE TABLE AcademicYears (
    academic_year_id INTEGER PRIMARY KEY AUTOINCREMENT,
    year_start INTEGER NOT NULL,                    -- e.g., 2025
    year_end INTEGER NOT NULL,                      -- e.g., 2026
    is_current BOOLEAN DEFAULT 0,               -- 1 if current academic year
    UNIQUE (year_start, year_end)
    
);

-- Semesters (Spring, Summer, Autumn in each academic year)
CREATE TABLE Semesters (
    semester_id INTEGER PRIMARY KEY AUTOINCREMENT,
    academic_year_id INTEGER NOT NULL,
    semester_number INTEGER NOT NULL,               -- 1, 2, or 3
    semester_name VARCHAR(50) NOT NULL,         -- 'Autumn', 'Spring', 'Summer'
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (academic_year_id) 
        REFERENCES AcademicYears(academic_year_id) ON DELETE CASCADE,
    UNIQUE (academic_year_id, semester_number),
    CHECK (semester_number IN (1, 2, 3))
    
);

-- Departments
CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    faculty VARCHAR(100),                       -- e.g., 'Faculty of Science'
    research_areas TEXT,                        -- Comma-separated research INTEGERerests
    head_lecturer_id INTEGER,                       -- FK to Lecturers (one lecturer heads department)
    phone VARCHAR(20),
    email VARCHAR(100),
    office_location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);

-- ============================================================================
-- PEOPLE TABLES (Core entities)
-- ============================================================================

-- Lecturers
CREATE TABLE Lecturers (
    lecturer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    department_id INTEGER NOT NULL,
    academic_qualifications VARCHAR(255),       -- Comma-separated (e.g., "BSc, MSc, PhD")
    expertise_areas VARCHAR(255),                -- Comma-separated research interests
    publications TEXT,                          -- Comma-separated publication titles
    office_location VARCHAR(100),
    contact_info VARCHAR(100),                  -- Email address
    phone VARCHAR(20),
    course_load INTEGER DEFAULT 0,                  -- Number of courses taught
    research_inerests VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE
    
);


-- Non-Academic Staff
CREATE TABLE NonAcademicStaff (
    staff_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,            -- e.g., 'Administrator', 'Technician'
    department_id INTEGER NOT NULL,
    employment_type VARCHAR(50),                -- 'Full-time', 'Part-time', 'Contract'
    contract_start_date DATE,
    contract_end_date DATE,
    salary_band VARCHAR(50),                    -- e.g., 'Band A', 'Band B'
    contact_info VARCHAR(100),
    phone VARCHAR(20),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY  (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE
    
);

-- ============================================================================
-- ACADEMIC PROGRAM TABLES
-- ============================================================================

-- Programs (e.g., BSc Computer Science, MSc Data Science)
CREATE TABLE Programs (
    program_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,          -- e.g., 'BSc Computer Science'
    degree_awarded VARCHAR(50) NOT NULL,        -- e.g., 'BSc', 'MSc', 'PhD'
    duration_years INTEGER,                         -- e.g., 3 or 4
    department_id INTEGER NOT NULL,
    course_requirements INTEGER,                    -- Total credits required
    total_credits INTEGER,                          -- Sum of all course credits
    enrollment_capacity INTEGER,
    current_enrollment INTEGER DEFAULT 0,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE
    
);

-- Courses
CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code VARCHAR(20) NOT NULL UNIQUE,    -- e.g., 'CS101', 'CS201'
    name VARCHAR(100) NOT NULL,
    description TEXT,
    department_id INTEGER NOT NULL,
    level INTEGER,                                  -- 1 (Foundation), 2 (intermediate), 3 (Advanced)
    credits INTEGER DEFAULT 20,                     -- Credit value
    prerequisites VARCHAR(255),                 -- Comma-separated course codes
    enrollment_capacity INTEGER,
    enrollment_count INTEGER DEFAULT 0,
    schedule VARCHAR(255),                      -- e.g., 'Mon 10:00, Wed 14:00'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE,
    CHECK (level IN (1, 2, 3))
    
);

-- Students
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    contact_info VARCHAR(100),                  -- Email address
    phone VARCHAR(20),
    address VARCHAR(255),
    program_id INTEGER NOT NULL,
    year_of_study INTEGER DEFAULT 1,                -- 1, 2, 3 (year of study)
    graduation_status VARCHAR(50) DEFAULT 'Active',  -- 'Active', 'Graduated', 'Withdrawn'
    advisor_id INTEGER,                             -- FK to Lecturers (faculty advisor)
    enrollment_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (program_id) 
        REFERENCES Programs(program_id) ON DELETE CASCADE,
    FOREIGN KEY (advisor_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE SET NULL,
    UNIQUE (name, date_of_birth)
    
);


-- Links Courses to Lecturers (many-to-many)
-- A course can have multiple lecturers, a lecturer can teach multiple courses
CREATE TABLE CourseLecturers (
    course_lecturer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_id INTEGER NOT NULL,
    lecturer_id INTEGER NOT NULL,
    is_primary BOOLEAN DEFAULT 1,               -- 1 if primary lecturer, 0 if supporting
    FOREIGN KEY  (course_id) 
        REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (lecturer_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE CASCADE,
    UNIQUE(course_id, lecturer_id)
  
);

-- Links Programs to Courses (many-to-many)
-- A program requires specific courses
CREATE TABLE ProgramCourses (
    program_course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    program_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    is_required BOOLEAN DEFAULT 1,              -- 1 if required, 0 if elective
    FOREIGN KEY  (program_id) 
        REFERENCES Programs(program_id) ON DELETE CASCADE,
    FOREIGN KEY  (course_id) 
        REFERENCES Courses(course_id) ON DELETE CASCADE,
    UNIQUE (program_id, course_id)
   
);


-- Course Materials (lecture notes, slides, readings, etc.)
CREATE TABLE CourseMaterials (
    material_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_id INTEGER NOT NULL,
    material_type VARCHAR(50),                  -- 'Lecture Notes', 'Slides', 'Reading List'
    title VARCHAR(200) NOT NULL,
    file_path VARCHAR(255),                     -- Path to file or resource URL
    upload_date DATE,
    FOREIGN KEY (course_id) 
        REFERENCES Courses(course_id) ON DELETE CASCADE
    
);


-- ============================================================================
-- ENROLLMENT TABLE (Student-Course junction with grades)
-- ============================================================================

-- Enrollments (tracks student enrollment in courses with grades)
CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    semester_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),                           -- A, B, C, D, F or numeric (0-100)
    grade_numeric DECIMAL(5,2),                 -- Numeric equivalent (0-100)
    attendance_percentage DECIMAL(5,2),         -- 0-100
    status VARCHAR(50) DEFAULT 'Active',        -- 'Active', 'Completed', 'Withdrawn'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY  (student_id) 
        REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY  (course_id) 
        REFERENCES Courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY  (semester_id) 
        REFERENCES Semesters(semester_id) ON DELETE CASCADE,
    UNIQUE (student_id, course_id, semester_id)
    
);

-- ============================================================================
-- RESEARCH TABLES
-- ============================================================================

-- Research Projects
CREATE TABLE ResearchProjects (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_title VARCHAR(200) NOT NULL,
    principal_investigator_id INTEGER NOT NULL,     -- FK to Lecturers
    department_id INTEGER NOT NULL,
    funding_source VARCHAR(100),                -- e.g., 'EPSRC', 'EU Horizon'
    funding_amount DECIMAL(12,2),
    start_date DATE,
    end_date DATE,
    description TEXT,
    publications TEXT,                          -- Comma-separated publication titles
    outcomes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY  (principal_investigator_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE
    
);

-- Research Project Team Members (many-to-many)
CREATE TABLE ResearchProjectTeamMembers (
    team_member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER NOT NULL,
    lecturer_id INTEGER,                            -- Can be NULL for non-lecturer members
    staff_id INTEGER,                               -- Can be NULL for non-staff members
    student_id INTEGER,                             -- Can be NULL for non-student members
    role VARCHAR(100),                          -- 'Co-Investigator', 'Researcher', 'PhD Student'
    FOREIGN KEY (project_id) 
        REFERENCES ResearchProjects(project_id) ON DELETE CASCADE,
    FOREIGN KEY (lecturer_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE CASCADE,
    FOREIGN KEY  (staff_id) 
        REFERENCES NonAcademicStaff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY  (student_id) 
        REFERENCES Students(student_id) ON DELETE CASCADE
    
);

-- ============================================================================
-- PUBLICATIONS TABLE (Separate from research projects)
-- ============================================================================

CREATE TABLE LecturerPublications (
    publication_id INTEGER PRIMARY KEY AUTOINCREMENT,
    lecturer_id INTEGER NOT NULL,
    publication_title VARCHAR(255) NOT NULL,
    publication_year INTEGER,
    publication_type VARCHAR(50),               -- 'Journal', 'Conference', 'Book'
    journal_conference_name VARCHAR(255),
    url VARCHAR(255),
    FOREIGN KEY (lecturer_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE CASCADE
    
);

-- ============================================================================
-- COMMITTEE TABLES
-- ============================================================================

-- Committees (e.g., Departmental Board, Curriculum Committee)
CREATE TABLE Committees (
    committee_id INTEGER PRIMARY KEY AUTOINCREMENT,
    committee_name VARCHAR(100) NOT NULL UNIQUE,
    department_id INTEGER,
    purpose VARCHAR(255),
    meeting_frequency VARCHAR(50),              -- 'Monthly', 'Quarterly'
    chair_lecturer_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY  (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE,
    FOREIGN KEY (chair_lecturer_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE SET NULL
    
);

-- Committee Members (many-to-many)
CREATE TABLE CommitteeMembers (
    committee_member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    committee_id INTEGER NOT NULL,
    lecturer_id INTEGER,
    staff_id INTEGER,
    role VARCHAR(50),                           -- 'Chair', 'Member', 'Secretary'
    join_date DATE,
    FOREIGN KEY  (committee_id) 
        REFERENCES Committees(committee_id) ON DELETE CASCADE,
    FOREIGN KEY  (lecturer_id) 
        REFERENCES Lecturers(lecturer_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) 
        REFERENCES NonAcademicStaff(staff_id) ON DELETE CASCADE
    
);

-- ============================================================================
-- STUDENT ORGANISATIONS
-- ================= ===========================================================

CREATE TABLE StudentOrganisations (
    organisation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    organisation_name VARCHAR(100) NOT NULL UNIQUE,
    organisation_type VARCHAR(50),              -- 'Academic', 'Sports', 'Social'
    department_id INTEGER,
    president_student_id INTEGER,
    description TEXT,
    meeting_day VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY  (department_id) 
        REFERENCES Departments(department_id) ON DELETE CASCADE,
    FOREIGN KEY  (president_student_id) 
        REFERENCES Students(student_id) ON DELETE SET NULL
    
);

-- Organisation Members (many-to-many)
CREATE TABLE OrganisationMembers (
    organisation_member_id INTEGER PRIMARY KEY AUTOINCREMENT,
    organisation_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    role VARCHAR(50) DEFAULT 'Member',          -- 'President', 'Vice-President', 'Member'
    join_date DATE,
    FOREIGN KEY (organisation_id) 
        REFERENCES StudentOrganisations(organisation_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) 
        REFERENCES Students(student_id) ON DELETE CASCADE,
    UNIQUE (organisation_id, student_id)
    
);

-- ============================================================================
-- VIEWS 
-- ============================================================================

-- View: Student Grade Summary
CREATE VIEW StudentGradeSummary AS
SELECT
    s.student_id,
    s.name,
    p.name as program_name,
    COUNT(e.enrollment_id) as courses_completed,
    ROUND(AVG(CAST(e.grade_numeric AS DECIMAL)), 2) as average_grade,
    MIN(e.grade_numeric) as lowest_grade,
    MAX(e.grade_numeric) as highest_grade
FROM Students s
INNER JOIN Programs p ON s.program_id = p.program_id
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.grade_numeric IS NOT NULL
GROUP BY s.student_id, s.name, p.name;

-- View: Lecturer Course Load
CREATE VIEW LecturerCourseLoad AS
SELECT
    l.lecturer_id,
    l.name,
    d.name as department,
    COUNT(DISTINCT cl.course_id) as courses_teaching,
    COUNT(DISTINCT e.student_id) as total_students
FROM Lecturers l
INNER JOIN Departments d ON l.department_id = d.department_id
LEFT JOIN CourseLecturers cl ON l.lecturer_id = cl.lecturer_id
LEFT JOIN Enrollments e ON cl.course_id = e.course_id
GROUP BY l.lecturer_id, l.name, d.name;

-- View: Department Course Offerings
CREATE VIEW DepartmentCourseOfferings AS
SELECT
    d.department_id,
    d.name as department,
    COUNT(DISTINCT c.course_id) as total_courses,
    SUM(c.enrollment_count) as total_enrollment,
    COUNT(DISTINCT l.lecturer_id) as lecturer_count
FROM Departments d
LEFT JOIN Courses c ON d.department_id = c.department_id
LEFT JOIN CourseLecturers cl ON c.course_id = cl.course_id
LEFT JOIN Lecturers l ON cl.lecturer_id = l.lecturer_id
GROUP BY d.department_id, d.name;

-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
-- Notes:
-- 1. All timestamps use CURRENT_TIMESTAMP for audit trail
-- 2. Foreign key cascade deletes ensure referential integrity
-- 3. UNIQUE constraints prevent duplicate entries where appropriate
-- 4. Views provide simplified access to complex queries
-- 5. This schema is normalised to 3NF (Third Normal Form)
-- ============================================================================