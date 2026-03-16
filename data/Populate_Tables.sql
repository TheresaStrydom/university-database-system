-- ============================================================================
-- DUMMY DATA POPULATION SCRIPT (MySQL)
-- ============================================================================
-- This script assumes the schema (Create_Tables.sql) has been executed first.
-- Run this after creating the database and tables.
-- Inserts are in dependency order to avoid foreign key errors.

USE liverpool_project;

-- ============================================================================
-- REFERENCE TABLES
-- ============================================================================

INSERT INTO AcademicYears (year_start, year_end, is_current)
VALUES
(2020, 2021, 0),
(2021, 2022, 0),
(2022, 2023, 0),
(2023, 2024, 0),
(2024, 2025, 0),
(2025, 2026, 1),  -- Current year
(2026, 2027, 0),
(2027, 2028, 0),
(2028, 2029, 0),
(2029, 2030, 0);

INSERT INTO Semesters (academic_year_id, semester_number, semester_name, start_date, end_date)
VALUES
(1, 1, 'Fall 2020', '2020-09-01', '2020-12-31'),
(1, 2, 'Spring 2021', '2021-01-01', '2021-05-31'),
(1, 3, 'Summer 2021', '2021-06-01', '2021-08-31'),
(2, 1, 'Fall 2021', '2021-09-01', '2021-12-31'),
(2, 2, 'Spring 2022', '2022-01-01', '2022-05-31'),
(2, 3, 'Summer 2022', '2022-06-01', '2022-08-31'),
(3, 1, 'Fall 2022', '2022-09-01', '2022-12-31'),
(3, 2, 'Spring 2023', '2023-01-01', '2023-05-31'),
(3, 3, 'Summer 2023', '2023-06-01', '2023-08-31'),
(4, 1, 'Fall 2023', '2023-09-01', '2023-12-31'),
(4, 2, 'Spring 2024', '2024-01-01', '2024-05-31'),
(4, 3, 'Summer 2024', '2024-06-01', '2024-08-31'),
(5, 1, 'Fall 2024', '2024-09-01', '2024-12-31'),
(5, 2, 'Spring 2025', '2025-01-01', '2025-05-31'),
(5, 3, 'Summer 2025', '2025-06-01', '2025-08-31'),
(6, 1, 'Fall 2025', '2025-09-01', '2025-12-31'),
(6, 2, 'Spring 2026', '2026-01-01', '2026-04-30'),
(6, 3, 'Summer 2026', '2026-06-01', '2026-08-31'),
(7, 1, 'Fall 2026', '2026-09-01', '2026-12-31'),
(7, 2, 'Spring 2027', '2027-01-01', '2027-05-31'),
(7, 3, 'Summer 2027', '2027-06-01', '2027-08-31'),
(8, 1, 'Fall 2027', '2027-09-01', '2027-12-31'),
(8, 2, 'Spring 2028', '2028-01-01', '2028-05-31'),
(8, 3, 'Summer 2028', '2028-06-01', '2028-08-31'),
(9, 1, 'Fall 2028', '2028-09-01', '2028-12-31'),
(9, 2, 'Spring 2029', '2029-01-01', '2029-05-31'),
(9, 3, 'Summer 2029', '2029-06-01', '2029-08-31'),
(10, 1, 'Fall 2029', '2029-09-01', '2029-12-31'),
(10, 2, 'Spring 2030', '2030-01-01', '2030-05-31'),
(10, 3, 'Summer 2030', '2030-06-01', '2030-08-31');

INSERT INTO Departments (name, faculty, research_areas, head_lecturer_id, phone, email, office_location)
VALUES
('Computer Science', 'Engineering', 'AI, Machine Learning, Databases, Cybersecurity', NULL, '123-456-7890', 'cs@uni.edu', 'Building A, Room 101'),
('Electrical Engineering', 'Engineering', 'Power Systems, Electronics, Signal Processing', NULL, '234-567-8901', 'ee@uni.edu', 'Building A, Room 201'),
('Mechanical Engineering', 'Engineering', 'Robotics, Thermodynamics, Materials Science', NULL, '345-678-9012', 'me@uni.edu', 'Building A, Room 301'),
('Biology', 'Science', 'Genetics, Ecology, Microbiology, Biotechnology', NULL, '456-789-0123', 'bio@uni.edu', 'Building B, Room 101'),
('Chemistry', 'Science', 'Organic Chemistry, Inorganic Chemistry, Physical Chemistry', NULL, '567-890-1234', 'chem@uni.edu', 'Building B, Room 201'),
('Physics', 'Science', 'Quantum Mechanics, Astrophysics, Particle Physics', NULL, '678-901-2345', 'phys@uni.edu', 'Building B, Room 301'),
('Mathematics', 'Science', 'Algebra, Calculus, Statistics, Number Theory', NULL, '789-012-3456', 'math@uni.edu', 'Building B, Room 401'),
('Business Administration', 'Business', 'Finance, Marketing, Management, Entrepreneurship', NULL, '890-123-4567', 'biz@uni.edu', 'Building C, Room 101'),
('Economics', 'Business', 'Microeconomics, Macroeconomics, Econometrics', NULL, '901-234-5678', 'econ@uni.edu', 'Building C, Room 201'),
('Law', 'Law', 'Constitutional Law, Criminal Law, International Law', NULL, '012-345-6789', 'law@uni.edu', 'Building D, Room 101'),
('History', 'Humanities', 'Ancient History, Modern History, Cultural Studies', NULL, '123-456-7891', 'hist@uni.edu', 'Building E, Room 101'),
('English Literature', 'Humanities', 'Shakespeare, Modern Fiction, Poetry', NULL, '234-567-8902', 'eng@uni.edu', 'Building E, Room 201'),
('Psychology', 'Social Sciences', 'Cognitive Psychology, Clinical Psychology, Social Behavior', NULL, '345-678-9013', 'psych@uni.edu', 'Building F, Room 101'),
('Sociology', 'Social Sciences', 'Social Theory, Urban Studies, Inequality', NULL, '456-789-0124', 'soc@uni.edu', 'Building F, Room 201'),
('Art and Design', 'Arts', 'Graphic Design, Painting, Sculpture', NULL, '567-890-1235', 'art@uni.edu', 'Building G, Room 101');

-- ============================================================================
-- PEOPLE TABLES
-- ============================================================================

INSERT INTO Lecturers (name, department_id, academic_qualifications, expertise_areas, publications, office_location, contact_info, phone, course_load, research_interests)
VALUES
('Dr. Alice Johnson', 1, 'PhD in Computer Science', 'AI, Machine Learning', 'Paper on Neural Networks (2023), AI Ethics Review (2024)', 'A101', 'alice.j@uni.edu', '111-222-3333', 3, 'Deep Learning'),
('Prof. Bob Smith', 1, 'MSc in Data Science, PhD', 'Databases, Cybersecurity', 'Database Optimization (2022), Security Protocols (2025)', 'A102', 'bob.s@uni.edu', '222-333-4444', 4, 'Big Data Analytics'),
('Dr. Carol Davis', 1, 'PhD in AI', 'Natural Language Processing', 'NLP Models (2021), Sentiment Analysis (2023)', 'A103', 'carol.d@uni.edu', '333-444-5555', 2, 'Computational Linguistics'),
('Prof. David Wilson', 2, 'PhD in Electrical Engineering', 'Power Systems, Electronics', 'Renewable Energy Systems (2024), Circuit Design (2022)', 'A201', 'david.w@uni.edu', '444-555-6666', 3, 'Smart Grids'),
('Dr. Eva Martinez', 2, 'MEng, PhD', 'Signal Processing', 'Digital Signals (2023), Wireless Comm (2025)', 'A202', 'eva.m@uni.edu', '555-666-7777', 4, 'IoT Devices'),
('Prof. Frank Lee', 2, 'PhD in Electronics', 'Embedded Systems', 'Microcontrollers (2021), Robotics Interfaces (2024)', 'A203', 'frank.l@uni.edu', '666-777-8888', 2, 'Automation'),
('Dr. Grace Kim', 3, 'PhD in Mechanical Engineering', 'Robotics, Thermodynamics', 'Robot Kinematics (2022), Heat Transfer (2023)', 'A301', 'grace.k@uni.edu', '777-888-9999', 3, 'Mechatronics'),
('Prof. Henry Chen', 3, 'MSc, PhD', 'Materials Science', 'Nanomaterials (2024), Composite Structures (2025)', 'A302', 'henry.c@uni.edu', '888-999-0000', 4, 'Sustainable Materials'),
('Dr. Isabella Rodriguez', 3, 'PhD in Thermodynamics', 'Fluid Dynamics', 'CFD Simulations (2021), Energy Efficiency (2023)', 'A303', 'isabella.r@uni.edu', '999-000-1111', 2, 'Renewable Energy'),
('Prof. Jack Thompson', 4, 'PhD in Biology', 'Genetics, Ecology', 'Gene Editing (2022), Biodiversity Studies (2024)', 'B101', 'jack.t@uni.edu', '000-111-2222', 3, 'Evolutionary Biology'),
('Dr. Karen White', 4, 'MSc in Microbiology, PhD', 'Biotechnology', 'CRISPR Applications (2023), Microbial Genomics (2025)', 'B102', 'karen.w@uni.edu', '111-222-3334', 4, 'Synthetic Biology'),
('Prof. Liam Harris', 4, 'PhD in Ecology', 'Environmental Science', 'Ecosystem Modeling (2021), Climate Impact (2024)', 'B103', 'liam.h@uni.edu', '222-333-4445', 2, 'Conservation'),
('Dr. Mia Clark', 5, 'PhD in Chemistry', 'Organic Chemistry', 'Synthesis Methods (2022), Drug Discovery (2023)', 'B201', 'mia.c@uni.edu', '333-444-5556', 3, 'Medicinal Chemistry'),
('Prof. Noah Lewis', 5, 'PhD in Inorganic Chemistry', 'Catalysis', 'Metal Complexes (2024), Reaction Kinetics (2025)', 'B202', 'noah.l@uni.edu', '444-555-6667', 4, 'Nanochemistry'),
('Dr. Olivia Walker', 5, 'MSc, PhD', 'Physical Chemistry', 'Quantum Chemistry (2021), Spectroscopy (2023)', 'B203', 'olivia.w@uni.edu', '555-666-7778', 2, 'Theoretical Chemistry'),
('Prof. Patrick Young', 6, 'PhD in Physics', 'Quantum Mechanics', 'Quantum Computing (2022), Particle Theory (2024)', 'B301', 'patrick.y@uni.edu', '666-777-8889', 3, 'High-Energy Physics'),
('Dr. Quinn Adams', 6, 'PhD in Astrophysics', 'Cosmology', 'Black Holes (2023), Galaxy Formation (2025)', 'B302', 'quinn.a@uni.edu', '777-888-9990', 4, 'Observational Astronomy'),
('Prof. Rachel Baker', 6, 'MSc in Particle Physics, PhD', 'Experimental Physics', 'LHC Experiments (2021), Detector Design (2024)', 'B303', 'rachel.b@uni.edu', '888-999-0001', 2, 'Nuclear Physics'),
('Dr. Samuel Carter', 7, 'PhD in Mathematics', 'Algebra, Calculus', 'Group Theory (2022), Differential Equations (2023)', 'B401', 'samuel.c@uni.edu', '999-000-1112', 3, 'Applied Math'),
('Prof. Tina Diaz', 7, 'PhD in Statistics', 'Probability', 'Bayesian Methods (2024), Data Modeling (2025)', 'B402', 'tina.d@uni.edu', '000-111-2223', 4, 'Machine Learning Stats'),
('Dr. Umar Evans', 7, 'MSc, PhD', 'Number Theory', 'Prime Numbers (2021), Cryptography (2023)', 'B403', 'umar.e@uni.edu', '111-222-3335', 2, 'Computational Math'),
('Prof. Victoria Flores', 8, 'MBA, PhD in Management', 'Finance, Marketing', 'Corporate Finance (2022), Consumer Behavior (2024)', 'C101', 'victoria.f@uni.edu', '222-333-4446', 3, 'Strategic Management'),
('Dr. William Green', 8, 'PhD in Entrepreneurship', 'Business Innovation', 'Startup Ecosystems (2023), Venture Capital (2025)', 'C102', 'william.g@uni.edu', '333-444-5557', 4, 'Innovation'),
('Prof. Xena Hall', 8, 'MSc in Marketing, PhD', 'Digital Marketing', 'Social Media Strategies (2021), Branding (2024)', 'C103', 'xena.h@uni.edu', '444-555-6668', 2, 'Market Research'),
('Dr. Yusuf Ibrahim', 9, 'PhD in Economics', 'Microeconomics', 'Game Theory (2022), Labor Economics (2023)', 'C201', 'yusuf.i@uni.edu', '555-666-7779', 3, 'Development Economics'),
('Prof. Zoe Jackson', 9, 'PhD in Macroeconomics', 'Econometrics', 'Forecasting Models (2024), Policy Analysis (2025)', 'C202', 'zoe.j@uni.edu', '666-777-8890', 4, 'International Trade'),
('Dr. Aaron King', 9, 'MSc, PhD', 'Behavioral Economics', 'Decision Making (2021), Experimental Econ (2023)', 'C203', 'aaron.k@uni.edu', '777-888-9991', 2, 'Public Policy'),
('Prof. Bella Lopez', 10, 'JD, PhD in Law', 'Constitutional Law', 'Human Rights (2022), Judicial Review (2024)', 'D101', 'bella.l@uni.edu', '888-999-0002', 3, 'Legal Theory'),
('Dr. Charles Miller', 10, 'LLM, PhD', 'Criminal Law', 'Forensic Evidence (2023), Sentencing (2025)', 'D102', 'charles.m@uni.edu', '999-000-1113', 4, 'Criminology'),
('Prof. Diana Nelson', 10, 'PhD in International Law', 'Treaties', 'International Disputes (2021), Trade Law (2024)', 'D103', 'diana.n@uni.edu', '000-111-2224', 2, 'Humanitarian Law'),
('Dr. Ethan Oliver', 11, 'PhD in History', 'Ancient History', 'Roman Empire (2022), Archaeology (2023)', 'E101', 'ethan.o@uni.edu', '111-222-3336', 3, 'Cultural Heritage'),
('Prof. Fiona Patel', 11, 'MA, PhD', 'Modern History', 'World Wars (2024), Colonialism (2025)', 'E102', 'fiona.p@uni.edu', '222-333-4447', 4, 'Global History'),
('Dr. George Quinn', 11, 'PhD in Cultural Studies', 'Social Movements', 'Civil Rights (2021), Identity Politics (2024)', 'E103', 'george.q@uni.edu', '333-444-5558', 2, 'Historiography'),
('Prof. Hannah Roberts', 12, 'PhD in English Literature', 'Shakespeare', 'Renaissance Lit (2022), Drama (2023)', 'E201', 'hannah.r@uni.edu', '444-555-6669', 3, 'Literary Criticism'),
('Dr. Isaac Sanchez', 12, 'MA in Modern Fiction, PhD', 'Contemporary Novels', 'Postmodernism (2024), Narrative Theory (2025)', 'E202', 'isaac.s@uni.edu', '555-666-7780', 4, 'Creative Writing'),
('Prof. Julia Taylor', 12, 'PhD in Poetry', 'Verse Forms', 'Romantic Poetry (2021), Modern Verse (2024)', 'E203', 'julia.t@uni.edu', '666-777-8891', 2, 'Literary Analysis'),
('Dr. Kevin Underwood', 13, 'PhD in Psychology', 'Cognitive Psychology', 'Memory Studies (2022), Perception (2023)', 'F101', 'kevin.u@uni.edu', '777-888-9992', 3, 'Neuroscience'),
('Prof. Laura Vargas', 13, 'PsyD', 'Clinical Psychology', 'Therapy Methods (2024), Mental Health (2025)', 'F102', 'laura.v@uni.edu', '888-999-0003', 4, 'Counseling'),
('Dr. Michael Walker', 13, 'PhD in Social Behavior', 'Group Dynamics', 'Social Influence (2021), Attitudes (2024)', 'F103', 'michael.w@uni.edu', '999-000-1114', 2, 'Experimental Psych'),
('Prof. Nora Xavier', 14, 'PhD in Sociology', 'Social Theory', 'Inequality Studies (2022), Urban Sociology (2023)', 'F201', 'nora.x@uni.edu', '000-111-2225', 3, 'Social Change'),
('Dr. Oscar Young', 14, 'MA, PhD', 'Cultural Sociology', 'Media Impact (2024), Globalization (2025)', 'F202', 'oscar.y@uni.edu', '111-222-3337', 4, 'Ethnography'),
('Prof. Paula Zimmerman', 14, 'PhD in Inequality', 'Social Stratification', 'Class Dynamics (2021), Gender Studies (2024)', 'F203', 'paula.z@uni.edu', '222-333-4448', 2, 'Policy Sociology'),
('Dr. Quentin Adams', 15, 'MFA, PhD in Design', 'Graphic Design', 'Visual Communication (2022), UI/UX (2023)', 'G101', 'quentin.a@uni.edu', '333-444-5559', 3, 'Digital Art'),
('Prof. Riley Brown', 15, 'PhD in Fine Arts', 'Painting, Sculpture', 'Abstract Art (2024), Installation (2025)', 'G102', 'riley.b@uni.edu', '444-555-6670', 4, 'Contemporary Art'),
('Dr. Sophia Clark', 15, 'MA in Sculpture, PhD', '3D Modeling', 'Digital Sculpture (2021), Materials (2024)', 'G103', 'sophia.c@uni.edu', '555-666-7781', 2, 'Art History');

UPDATE Departments SET head_lecturer_id = 1 WHERE department_id = 1;
UPDATE Departments SET head_lecturer_id = 4 WHERE department_id = 2;
UPDATE Departments SET head_lecturer_id = 7 WHERE department_id = 3;
UPDATE Departments SET head_lecturer_id = 10 WHERE department_id = 4;
UPDATE Departments SET head_lecturer_id = 13 WHERE department_id = 5;
UPDATE Departments SET head_lecturer_id = 16 WHERE department_id = 6;
UPDATE Departments SET head_lecturer_id = 19 WHERE department_id = 7;
UPDATE Departments SET head_lecturer_id = 22 WHERE department_id = 8;
UPDATE Departments SET head_lecturer_id = 25 WHERE department_id = 9;
UPDATE Departments SET head_lecturer_id = 28 WHERE department_id = 10;
UPDATE Departments SET head_lecturer_id = 31 WHERE department_id = 11;
UPDATE Departments SET head_lecturer_id = 34 WHERE department_id = 12;
UPDATE Departments SET head_lecturer_id = 37 WHERE department_id = 13;
UPDATE Departments SET head_lecturer_id = 40 WHERE department_id = 14;
UPDATE Departments SET head_lecturer_id = 43 WHERE department_id = 15;

INSERT INTO NonAcademicStaff (name, job_title, department_id, employment_type, contract_start_date, contract_end_date, salary_band, contact_info, phone, emergency_contact_name, emergency_contact_phone)
VALUES
('John Doe', 'Admin Assistant', 1, 'Full-time', '2023-01-01', '2027-06-15', 'Band A', 'john.d@uni.edu', '123-456-7890', 'Jane Doe', '987-654-3210'),
('Emily Carter', 'IT Support Specialist', 1, 'Full-time', '2022-06-15', '2028-03-20', 'Band B', 'emily.c@uni.edu', '234-567-8901', 'Michael Carter', '876-543-2109'),
('Robert Brown', 'Lab Technician', 1, 'Part-time', '2024-03-01', '2025-03-01', 'Band C', 'robert.b@uni.edu', '345-678-9012', 'Sarah Brown', '765-432-1098'),
('Anna Lee', 'Office Manager', 2, 'Full-time', '2021-09-01', '2026-12-10', 'Band A', 'anna.l@uni.edu', '456-789-0123', 'David Lee', '654-321-0987'),
('Michael Green', 'Maintenance Engineer', 2, 'Contract', '2023-05-01', '2024-05-01', 'Band B', 'michael.g@uni.edu', '567-890-1234', 'Laura Green', '543-210-9876'),
('Sophia Harris', 'HR Coordinator', 2, 'Full-time', '2022-11-01', '2029-09-05', 'Band C', 'sophia.h@uni.edu', '678-901-2345', 'James Harris', '432-109-8765'),
('William Thompson', 'Finance Clerk', 3, 'Part-time', '2024-01-15', '2027-04-25', 'Band A', 'william.t@uni.edu', '789-012-3456', 'Emma Thompson', '321-098-7654'),
('Olivia Martinez', 'Research Assistant', 3, 'Full-time', '2023-07-01', '2028-11-30', 'Band B', 'olivia.m@uni.edu', '890-123-4567', 'Carlos Martinez', '210-987-6543'),
('Daniel Wilson', 'Custodian', 3, 'Full-time', '2022-04-01', '2026-07-18', 'Band C', 'daniel.w@uni.edu', '901-234-5678', 'Mia Wilson', '109-876-5432'),
('Isabella Taylor', 'Librarian', 4, 'Full-time', '2021-10-01', '2029-02-12', 'Band A', 'isabella.t@uni.edu', '012-345-6789', 'Ethan Taylor', '098-765-4321'),
('James Anderson', 'Security Officer', 4, 'Part-time', '2023-02-01', '2024-02-01', 'Band B', 'james.a@uni.edu', '123-456-7891', 'Ava Anderson', '987-654-3210'),
('Mia Thomas', 'Event Coordinator', 4, 'Contract', '2024-05-01', '2025-05-01', 'Band C', 'mia.t@uni.edu', '234-567-8902', 'Noah Thomas', '876-543-2109'),
('Alexander Jackson', 'Admissions Officer', 5, 'Full-time', '2022-08-01', '2027-10-08', 'Band A', 'alexander.j@uni.edu', '345-678-9013', 'Sophia Jackson', '765-432-1098'),
('Charlotte White', 'Counselor', 5, 'Full-time', '2023-04-01', '2028-05-22', 'Band B', 'charlotte.w@uni.edu', '456-789-0124', 'Benjamin White', '654-321-0987'),
('Benjamin Harris', 'IT Technician', 5, 'Part-time', '2021-12-01', '2026-08-14', 'Band C', 'benjamin.h@uni.edu', '567-890-1235', 'Amelia Harris', '543-210-9876'),
('Amelia Martin', 'Accountant', 6, 'Full-time', '2024-02-01', '2029-01-19', 'Band A', 'amelia.m@uni.edu', '678-901-2346', 'Lucas Martin', '432-109-8765'),
('Lucas Lee', 'Facilities Manager', 6, 'Full-time', '2023-09-01', '2027-03-07', 'Band B', 'lucas.l@uni.edu', '789-012-3457', 'Ella Lee', '321-098-7654'),
('Ella Walker', 'Receptionist', 6, 'Part-time', '2022-03-01', '2028-12-03', 'Band C', 'ella.w@uni.edu', '890-123-4568', 'Mason Walker', '210-987-6543'),
('Mason Clark', 'Marketing Specialist', 7, 'Contract', '2024-06-01', '2025-06-01', 'Band A', 'mason.c@uni.edu', '901-234-5679', 'Avery Clark', '109-876-5432'),
('Avery Lewis', 'Data Analyst', 7, 'Full-time', '2021-05-01', '2026-09-28', 'Band B', 'avery.l@uni.edu', '012-345-6790', 'Elijah Lewis', '098-765-4321'),
('Elijah Robinson', 'Procurement Officer', 7, 'Full-time', '2023-11-01', '2029-04-16', 'Band C', 'elijah.r@uni.edu', '123-456-7892', 'Sofia Robinson', '987-654-3211'),
('Sofia Hall', 'Health and Safety Officer', 8, 'Part-time', '2022-07-01', '2027-11-11', 'Band A', 'sofia.h@uni.edu', '234-567-8903', 'Jackson Hall', '876-543-2110'),
('Jackson Allen', 'Transport Coordinator', 8, 'Full-time', '2024-04-01', '2028-07-24', 'Band B', 'jackson.a@uni.edu', '345-678-9014', 'Victoria Allen', '765-432-1099'),
('Victoria Young', 'Cafeteria Manager', 8, 'Contract', '2023-01-01', '2024-01-01', 'Band C', 'victoria.y@uni.edu', '456-789-0125', 'Sebastian Young', '654-321-0988'),
('Sebastian Hernandez', 'Groundskeeper', 9, 'Full-time', '2022-10-01', '2026-02-09', 'Band A', 'sebastian.h@uni.edu', '567-890-1236', 'Luna Hernandez', '543-210-9877'),
('Luna King', 'Bookstore Clerk', 9, 'Part-time', '2024-07-01', '2029-05-30', 'Band B', 'luna.k@uni.edu', '678-901-2347', 'Matthew King', '432-109-8766'),
('Matthew Scott', 'Audio-Visual Technician', 9, 'Full-time', '2021-02-01', '2027-08-17', 'Band C', 'matthew.s@uni.edu', '789-012-3458', 'Scarlett Scott', '321-098-7655'),
('Scarlett Green', 'Registrar Assistant', 10, 'Full-time', '2023-08-01', '2028-10-04', 'Band A', 'scarlett.g@uni.edu', '890-123-4569', 'Andrew Green', '210-987-6544'),
('Andrew Adams', 'Alumni Relations Officer', 10, 'Contract', '2022-12-01', '2023-12-01', 'Band B', 'andrew.a@uni.edu', '901-234-5680', 'Grace Adams', '109-876-5433'),
('Grace Mitchell', 'Sports Coach', 10, 'Part-time', '2024-03-01', '2026-06-21', 'Band C', 'grace.m@uni.edu', '012-345-6791', 'Ryan Mitchell', '098-765-4322'),
('Ryan Turner', 'Wellness Coordinator', 11, 'Full-time', '2021-11-01', '2029-09-13', 'Band A', 'ryan.t@uni.edu', '123-456-7893', 'Lily Turner', '987-654-3212'),
('Lily Phillips', 'Career Advisor', 11, 'Full-time', '2023-06-01', '2027-01-26', 'Band B', 'lily.p@uni.edu', '234-567-8904', 'Nathan Phillips', '876-543-2111'),
('Nathan Campbell', 'International Student Advisor', 11, 'Part-time', '2022-02-01', '2028-04-08', 'Band C', 'nathan.c@uni.edu', '345-678-9015', 'Zoe Campbell', '765-432-1100'),
('Zoe Parker', 'Disability Support Specialist', 12, 'Full-time', '2024-08-01', '2026-11-02', 'Band A', 'zoe.p@uni.edu', '456-789-0126', 'Dylan Parker', '654-321-0989'),
('Dylan Evans', 'Volunteer Coordinator', 12, 'Contract', '2023-03-01', '2024-03-01', 'Band B', 'dylan.e@uni.edu', '567-890-1237', 'Hannah Evans', '543-210-9878'),
('Hannah Edwards', 'Media Relations Officer', 12, 'Full-time', '2021-07-01', '2029-12-19', 'Band C', 'hannah.e@uni.edu', '678-901-2348', 'Gabriel Edwards', '432-109-8767'),
('Gabriel Collins', 'Fundraising Coordinator', 13, 'Part-time', '2024-01-01', '2027-05-05', 'Band A', 'gabriel.c@uni.edu', '789-012-3459', 'Addison Collins', '321-098-7656'),
('Addison Stewart', 'Public Relations Specialist', 13, 'Full-time', '2022-09-01', '2028-02-28', 'Band B', 'addison.s@uni.edu', '890-123-4570', 'Julian Stewart', '210-987-6545'),
('Julian Sanchez', 'Web Developer', 13, 'Full-time', '2023-05-01', '2026-10-11', 'Band C', 'julian.s@uni.edu', '901-234-5681', 'Aurora Sanchez', '109-876-5434'),
('Aurora Ramirez', 'Graphic Designer', 14, 'Contract', '2021-04-01', '2022-04-01', 'Band A', 'aurora.r@uni.edu', '012-345-6792', 'Kayden Ramirez', '098-765-4323'),
('Kayden Torres', 'Network Administrator', 14, 'Full-time', '2024-09-01', '2029-03-23', 'Band B', 'kayden.t@uni.edu', '123-456-7894', 'Brooklyn Torres', '987-654-3213'),
('Brooklyn Flores', 'Software Support', 14, 'Part-time', '2022-05-01', '2027-07-07', 'Band C', 'brooklyn.f@uni.edu', '234-567-8905', 'Christian Flores', '876-543-2112'),
('Christian Gomez', 'Data Entry Clerk', 15, 'Full-time', '2023-10-01', '2028-08-29', 'Band A', 'christian.g@uni.edu', '345-678-9016', 'Maya Gomez', '765-432-1101'),
('Maya Rivera', 'Archivist', 15, 'Full-time', '2021-01-01', '2026-04-14', 'Band B', 'maya.r@uni.edu', '456-789-0127', 'Evan Rivera', '654-321-0990'),
('Evan Morales', 'Tour Guide', 15, 'Part-time', '2024-04-01', '2029-11-06', 'Band C', 'evan.m@uni.edu', '567-890-1238', 'Nora Morales', '543-210-9879');

-- ============================================================================
-- PROGRAMS AND COURSES
-- ============================================================================

INSERT INTO Programs (name, degree_awarded, duration_years, department_id, course_requirements, total_credits, enrollment_capacity, current_enrollment, description)
VALUES
('BSc in Computer Science', 'BSc', 3, 1, 40, 120, 200, 150, 'Undergraduate program in core computing principles, programming, and algorithms.'),
('MSc in Artificial Intelligence', 'MSc', 1, 1, 10, 60, 50, 40, 'Advanced study in AI, machine learning, and data science.'),
('PhD in Data Science', 'PhD', 4, 1, 8, 180, 20, 15, 'Research-focused doctorate in big data, analytics, and AI applications.'),
('BSc in Electrical Engineering', 'BSc', 4, 2, 45, 140, 150, 120, 'Fundamentals of circuits, power systems, and electronics.'),
('MSc in Signal Processing', 'MSc', 2, 2, 12, 70, 40, 30, 'Specialization in digital signals, communications, and embedded systems.'),
('PhD in Power Systems', 'PhD', 4, 2, 6, 160, 15, 10, 'Advanced research in renewable energy and smart grids.'),
('BSc in Mechanical Engineering', 'BSc', 4, 3, 42, 130, 180, 140, 'Core mechanics, thermodynamics, and design principles.'),
('MSc in Robotics', 'MSc', 1, 3, 10, 60, 50, 35, 'Hands-on program in robot design, control, and automation.'),
('PhD in Materials Science', 'PhD', 4, 3, 8, 180, 20, 12, 'Research in advanced materials and nanotechnology.'),
('BSc in Biology', 'BSc', 3, 4, 38, 120, 150, 110, 'Study of life sciences, genetics, and ecology.'),
('MSc in Biotechnology', 'MSc', 2, 4, 12, 70, 40, 25, 'Applications of biology in industry and medicine.'),
('PhD in Ecology', 'PhD', 4, 4, 6, 160, 15, 8, 'Environmental research and conservation studies.'),
('BSc in Chemistry', 'BSc', 3, 5, 40, 120, 120, 90, 'Organic, inorganic, and physical chemistry fundamentals.'),
('MSc in Organic Chemistry', 'MSc', 1, 5, 10, 60, 30, 20, 'Synthesis and analysis of organic compounds.'),
('PhD in Physical Chemistry', 'PhD', 4, 5, 8, 180, 10, 7, 'Theoretical and experimental studies in chemical physics.'),
('BSc in Physics', 'BSc', 3, 6, 35, 110, 100, 80, 'Classical and modern physics, including quantum mechanics.'),
('MSc in Astrophysics', 'MSc', 2, 6, 12, 70, 25, 18, 'Study of stars, galaxies, and cosmology.'),
('PhD in Particle Physics', 'PhD', 4, 6, 6, 160, 12, 9, 'High-energy physics and experimental research.'),
('BSc in Mathematics', 'BSc', 3, 7, 36, 120, 80, 60, 'Pure and applied mathematics, statistics.'),
('MSc in Statistics', 'MSc', 1, 7, 10, 60, 40, 30, 'Advanced statistical methods and data analysis.'),
('PhD in Applied Mathematics', 'PhD', 4, 7, 8, 180, 15, 10, 'Modeling and computational mathematics research.'),
('BSc in Business Administration', 'BSc', 3, 8, 40, 120, 250, 200, 'Management, finance, and marketing basics.'),
('MBA in Management', 'MBA', 2, 8, 15, 90, 100, 80, 'Executive program in strategic business leadership.'),
('PhD in Entrepreneurship', 'PhD', 4, 8, 8, 180, 20, 15, 'Research in innovation and business startups.'),
('BSc in Economics', 'BSc', 3, 9, 35, 110, 150, 120, 'Micro and macroeconomics, econometrics.'),
('MSc in Econometrics', 'MSc', 1, 9, 10, 60, 50, 35, 'Quantitative economic modeling and forecasting.'),
('PhD in Macroeconomics', 'PhD', 4, 9, 6, 160, 15, 10, 'Policy and global economics research.'),
('LLB in Law', 'LLB', 3, 10, 42, 130, 100, 80, 'Core legal principles and case studies.'),
('LLM in International Law', 'LLM', 1, 10, 10, 60, 30, 25, 'Specialization in global treaties and disputes.'),
('PhD in Constitutional Law', 'PhD', 4, 10, 8, 180, 10, 7, 'Advanced legal theory and jurisprudence.'),
('BA in History', 'BA', 3, 11, 30, 90, 80, 60, 'Ancient to modern historical analysis.'),
('MA in Modern History', 'MA', 1, 11, 8, 50, 40, 30, 'Focus on 20th-21st century events.'),
('PhD in Cultural Studies', 'PhD', 4, 11, 6, 160, 15, 10, 'Interdisciplinary cultural research.'),
('BA in English Literature', 'BA', 3, 12, 32, 100, 100, 75, 'Literary works from various eras.'),
('MA in Creative Writing', 'MA', 1, 12, 10, 60, 30, 20, 'Fiction, poetry, and narrative techniques.'),
('PhD in Literary Criticism', 'PhD', 4, 12, 8, 180, 10, 6, 'Theoretical approaches to literature.'),
('BSc in Psychology', 'BSc', 3, 13, 38, 120, 150, 110, 'Human behavior, cognition, and mental health.'),
('MSc in Clinical Psychology', 'MSc', 2, 13, 12, 70, 40, 30, 'Therapy and assessment methods.'),
('PhD in Cognitive Psychology', 'PhD', 4, 13, 6, 160, 15, 8, 'Research in memory and perception.'),
('BA in Sociology', 'BA', 3, 14, 35, 110, 120, 90, 'Social structures, inequality, and change.'),
('MA in Urban Studies', 'MA', 1, 14, 10, 60, 50, 35, 'City planning and social dynamics.'),
('PhD in Social Theory', 'PhD', 4, 14, 8, 180, 20, 12, 'Theoretical sociology research.'),
('BFA in Graphic Design', 'BFA', 3, 15, 40, 120, 80, 60, 'Visual communication and design principles.'),
('MFA in Fine Arts', 'MFA', 2, 15, 12, 70, 30, 20, 'Advanced studio practice in art.'),
('PhD in Art History', 'PhD', 4, 15, 6, 160, 10, 5, 'Research in artistic movements and criticism.');

INSERT INTO Courses (course_code, name, description, department_id, level, credits, prerequisites, enrollment_capacity, enrollment_count, schedule)
VALUES
('CS101', 'Introduction to Programming', 'Basics of programming in Python and Java.', 1, 1, 20, NULL, 100, 80, 'MWF 9:00-10:00 AM'),
('CS201', 'Data Structures', 'Arrays, linked lists, trees, and graphs.', 1, 2, 20, 'CS101', 80, 65, 'TTh 10:30-12:00 PM'),
('CS301', 'Machine Learning', 'Supervised and unsupervised learning algorithms.', 1, 3, 20, 'CS201', 50, 40, 'MWF 1:00-2:00 PM'),
('CS401', 'Database Systems', 'SQL, relational models, and NoSQL.', 1, 4, 25, 'CS201', 60, 45, 'TTh 2:30-4:00 PM'),
('EE101', 'Circuit Theory', 'Basic electrical circuits and analysis.', 2, 1, 20, NULL, 90, 75, 'MWF 9:00-10:00 AM'),
('EE201', 'Digital Electronics', 'Logic gates, flip-flops, and digital design.', 2, 2, 20, 'EE101', 70, 55, 'TTh 10:30-12:00 PM'),
('EE301', 'Power Systems', 'Transmission, distribution, and renewable energy.', 2, 3, 25, 'EE201', 50, 35, 'MWF 1:00-2:00 PM'),
('EE401', 'Signal Processing', 'Fourier transforms and digital filters.', 2, 4, 20, 'EE201', 40, 30, 'TTh 2:30-4:00 PM'),
('ME101', 'Engineering Mechanics', 'Statics and dynamics principles.', 3, 1, 20, NULL, 100, 85, 'MWF 9:00-10:00 AM'),
('ME201', 'Thermodynamics', 'Laws of thermodynamics and heat transfer.', 3, 2, 20, 'ME101', 80, 60, 'TTh 10:30-12:00 PM'),
('ME301', 'Robotics', 'Kinematics, control, and robot programming.', 3, 3, 25, 'ME201', 50, 40, 'MWF 1:00-2:00 PM'),
('ME401', 'Materials Engineering', 'Properties and applications of materials.', 3, 4, 20, 'ME201', 60, 45, 'TTh 2:30-4:00 PM'),
('BIO101', 'General Biology', 'Cells, genetics, and evolution.', 4, 1, 20, NULL, 120, 100, 'MWF 9:00-10:00 AM'),
('BIO201', 'Microbiology', 'Bacteria, viruses, and immune systems.', 4, 2, 20, 'BIO101', 90, 70, 'TTh 10:30-12:00 PM'),
('BIO301', 'Ecology', 'Ecosystems, biodiversity, and conservation.', 4, 3, 20, 'BIO201', 60, 45, 'MWF 1:00-2:00 PM'),
('BIO401', 'Biotechnology', 'Genetic engineering and applications.', 4, 4, 25, 'BIO201', 40, 30, 'TTh 2:30-4:00 PM'),
('CHEM101', 'General Chemistry', 'Atoms, molecules, and reactions.', 5, 1, 20, NULL, 100, 80, 'MWF 9:00-10:00 AM'),
('CHEM201', 'Organic Chemistry', 'Carbon compounds and synthesis.', 5, 2, 20, 'CHEM101', 80, 60, 'TTh 10:30-12:00 PM'),
('CHEM301', 'Physical Chemistry', 'Thermodynamics and quantum mechanics in chemistry.', 5, 3, 25, 'CHEM201', 50, 35, 'MWF 1:00-2:00 PM'),
('CHEM401', 'Inorganic Chemistry', 'Coordination compounds and metals.', 5, 4, 20, 'CHEM201', 40, 25, 'TTh 2:30-4:00 PM'),
('PHYS101', 'Introductory Physics', 'Mechanics, heat, and sound.', 6, 1, 20, NULL, 90, 75, 'MWF 9:00-10:00 AM'),
('PHYS201', 'Electromagnetism', 'Electric fields, magnetism, and circuits.', 6, 2, 20, 'PHYS101', 70, 55, 'TTh 10:30-12:00 PM'),
('PHYS301', 'Quantum Physics', 'Wave functions and particles.', 6, 3, 20, 'PHYS201', 50, 35, 'MWF 1:00-2:00 PM'),
('PHYS401', 'Astrophysics', 'Stars, galaxies, and cosmology.', 6, 4, 25, 'PHYS201', 40, 30, 'TTh 2:30-4:00 PM'),
('MATH101', 'Calculus I', 'Limits, derivatives, and integrals.', 7, 1, 20, NULL, 100, 85, 'MWF 9:00-10:00 AM'),
('MATH201', 'Linear Algebra', 'Vectors, matrices, and systems.', 7, 2, 20, 'MATH101', 80, 65, 'TTh 10:30-12:00 PM'),
('MATH301', 'Statistics', 'Probability, distributions, and inference.', 7, 3, 20, 'MATH201', 60, 45, 'MWF 1:00-2:00 PM'),
('MATH401', 'Number Theory', 'Primes, congruences, and cryptography.', 7, 4, 25, 'MATH201', 40, 25, 'TTh 2:30-4:00 PM'),
('BUS101', 'Introduction to Business', 'Management, finance, and operations.', 8, 1, 20, NULL, 150, 120, 'MWF 9:00-10:00 AM'),
('BUS201', 'Marketing Principles', 'Consumer behavior and strategies.', 8, 2, 20, 'BUS101', 100, 80, 'TTh 10:30-12:00 PM'),
('BUS301', 'Finance Management', 'Investments, budgeting, and analysis.', 8, 3, 25, 'BUS201', 80, 60, 'MWF 1:00-2:00 PM'),
('BUS401', 'Entrepreneurship', 'Starting and managing new ventures.', 8, 4, 20, 'BUS201', 60, 45, 'TTh 2:30-4:00 PM'),
('ECON101', 'Microeconomics', 'Supply, demand, and markets.', 9, 1, 20, NULL, 120, 100, 'MWF 9:00-10:00 AM'),
('ECON201', 'Macroeconomics', 'GDP, inflation, and policy.', 9, 2, 20, 'ECON101', 90, 70, 'TTh 10:30-12:00 PM'),
('ECON301', 'Econometrics', 'Regression and economic modeling.', 9, 3, 20, 'ECON201', 50, 35, 'MWF 1:00-2:00 PM'),
('ECON401', 'International Economics', 'Trade, exchange rates, and globalization.', 9, 4, 25, 'ECON201', 40, 30, 'TTh 2:30-4:00 PM'),
('LAW101', 'Introduction to Law', 'Legal systems and principles.', 10, 1, 20, NULL, 80, 60, 'MWF 9:00-10:00 AM'),
('LAW201', 'Constitutional Law', 'Rights, government, and judiciary.', 10, 2, 20, 'LAW101', 60, 45, 'TTh 10:30-12:00 PM'),
('LAW301', 'Criminal Law', 'Crimes, defenses, and procedures.', 10, 3, 25, 'LAW201', 50, 35, 'MWF 1:00-2:00 PM'),
('LAW401', 'International Law', 'Treaties and global disputes.', 10, 4, 20, 'LAW201', 40, 25, 'TTh 2:30-4:00 PM'),
('HIST101', 'World History', 'Ancient civilizations to modern era.', 11, 1, 20, NULL, 100, 80, 'MWF 9:00-10:00 AM'),
('HIST201', 'European History', 'Middle Ages to Enlightenment.', 11, 2, 20, 'HIST101', 70, 55, 'TTh 10:30-12:00 PM'),
('HIST301', 'American History', 'Colonial to contemporary US.', 11, 3, 20, 'HIST201', 50, 35, 'MWF 1:00-2:00 PM'),
('HIST401', 'Cultural History', 'Art, society, and traditions.', 11, 4, 25, 'HIST201', 40, 30, 'TTh 2:30-4:00 PM'),
('ENG101', 'English Composition', 'Writing and rhetoric skills.', 12, 1, 20, NULL, 120, 100, 'MWF 9:00-10:00 AM'),
('ENG201', 'British Literature', 'Chaucer to modern authors.', 12, 2, 20, 'ENG101', 80, 60, 'TTh 10:30-12:00 PM'),
('ENG301', 'American Literature', 'Colonial to contemporary works.', 12, 3, 20, 'ENG201', 60, 45, 'MWF 1:00-2:00 PM'),
('ENG401', 'Creative Writing', 'Fiction and poetry workshops.', 12, 4, 25, 'ENG201', 40, 25, 'TTh 2:30-4:00 PM'),
('PSY101', 'Introduction to Psychology', 'Behavior, mind, and mental processes.', 13, 1, 20, NULL, 150, 120, 'MWF 9:00-10:00 AM'),
('PSY201', 'Cognitive Psychology', 'Memory, perception, and thinking.', 13, 2, 20, 'PSY101', 100, 80, 'TTh 10:30-12:00 PM'),
('PSY301', 'Social Psychology', 'Group behavior and attitudes.', 13, 3, 25, 'PSY201', 70, 50, 'MWF 1:00-2:00 PM'),
('PSY401', 'Clinical Psychology', 'Diagnosis and therapy methods.', 13, 4, 20, 'PSY201', 50, 35, 'TTh 2:30-4:00 PM'),
('SOC101', 'Introduction to Sociology', 'Society, culture, and institutions.', 14, 1, 20, NULL, 120, 90, 'MWF 9:00-10:00 AM'),
('SOC201', 'Social Inequality', 'Class, race, and gender dynamics.', 14, 2, 20, 'SOC101', 80, 60, 'TTh 10:30-12:00 PM'),
('SOC301', 'Urban Sociology', 'Cities, communities, and development.', 14, 3, 20, 'SOC201', 60, 45, 'MWF 1:00-2:00 PM'),
('SOC401', 'Global Sociology', 'International issues and globalization.', 14, 4, 25, 'SOC201', 40, 30, 'TTh 2:30-4:00 PM'),
('ART101', 'Introduction to Art', 'Art history and appreciation.', 15, 1, 20, NULL, 80, 60, 'MWF 9:00-10:00 AM'),
('ART201', 'Graphic Design', 'Digital tools and visual communication.', 15, 2, 20, 'ART101', 60, 45, 'TTh 10:30-12:00 PM'),
('ART301', 'Painting Techniques', 'Oils, acrylics, and composition.', 15, 3, 25, 'ART201', 40, 30, 'MWF 1:00-2:00 PM'),
('ART401', 'Sculpture', '3D forms and materials.', 15, 4, 20, 'ART201', 30, 20, 'TTh 2:30-4:00 PM');

INSERT INTO Students (name, date_of_birth, contact_info, phone, address, program_id, year_of_study, graduation_status, advisor_id, enrollment_date)
VALUES
('Alice Smith', '2000-01-15', 'alice.s@uni.edu', '123-456-7890', '123 Main St, City A', 1, 3, 'Active', 1, '2023-09-01'),
('Bob Johnson', '1999-02-20', 'bob.j@uni.edu', '234-567-8901', '456 Elm St, City B', 1, 3, 'Active', 2, '2023-09-01'),
('Carol Davis', '2001-03-25', 'carol.d@uni.edu', '345-678-9012', '789 Oak St, City C', 1, 2, 'Active', 3, '2024-09-01'),
('David Wilson', '2002-04-10', 'david.w@uni.edu', '456-789-0123', '101 Pine St, City D', 2, 1, 'Active', 1, '2024-09-01'),
('Eva Martinez', '1998-05-05', 'eva.m@uni.edu', '567-890-1234', '202 Maple St, City E', 2, 1, 'Active', 2, '2024-09-01'),
('Frank Lee', '2003-06-30', 'frank.l@uni.edu', '678-901-2345', '303 Birch St, City F', 3, 4, 'Graduated', 3, '2020-09-01'),
('Grace Kim', '2004-07-15', 'grace.k@uni.edu', '789-012-3456', '404 Cedar St, City G', 3, 3, 'Active', 1, '2023-09-01'),
('Henry Chen', '1997-08-20', 'henry.c@uni.edu', '890-123-4567', '505 Walnut St, City H', 4, 4, 'Active', 4, '2022-09-01'),
('Isabella Rodriguez', '2005-09-25', 'isabella.r@uni.edu', '901-234-5678', '606 Chestnut St, City I', 4, 3, 'Active', 5, '2023-09-01'),
('Jack Thompson', '1996-10-10', 'jack.t@uni.edu', '012-345-6789', '707 Spruce St, City J', 4, 2, 'On Leave', 6, '2024-09-01'),
('Karen White', '2000-11-05', 'karen.w@uni.edu', '123-456-7891', '808 Fir St, City K', 5, 2, 'Active', 4, '2024-09-01'),
('Liam Harris', '2001-12-30', 'liam.h@uni.edu', '234-567-8902', '909 Hemlock St, City L', 5, 1, 'Active', 5, '2024-09-01'),
('Mia Clark', '2002-01-15', 'mia.c@uni.edu', '345-678-9013', '1010 Aspen St, City M', 6, 4, 'Graduated', 6, '2021-09-01'),
('Noah Lewis', '2003-02-20', 'noah.l@uni.edu', '456-789-0124', '1111 Poplar St, City N', 6, 3, 'Active', 4, '2023-09-01'),
('Olivia Walker', '1999-03-25', 'olivia.w@uni.edu', '567-890-1235', '1212 Willow St, City O', 7, 4, 'Active', 7, '2022-09-01'),
('Patrick Young', '2004-04-10', 'patrick.y@uni.edu', '678-901-2346', '1313 Beech St, City P', 7, 3, 'Active', 8, '2023-09-01'),
('Quinn Adams', '2005-05-05', 'quinn.a@uni.edu', '789-012-3457', '1414 Alder St, City Q', 7, 2, 'Active', 9, '2024-09-01'),
('Rachel Baker', '1998-06-30', 'rachel.b@uni.edu', '890-123-4568', '1515 Sycamore St, City R', 8, 1, 'Active', 7, '2024-09-01'),
('Samuel Carter', '1997-07-15', 'samuel.c@uni.edu', '901-234-5679', '1616 Redwood St, City S', 8, 1, 'Active', 8, '2024-09-01'),
('Tina Diaz', '2000-08-20', 'tina.d@uni.edu', '012-345-6790', '1717 Cypress St, City T', 9, 4, 'Graduated', 9, '2020-09-01'),
('Umar Evans', '2001-09-25', 'umar.e@uni.edu', '123-456-7892', '1818 Palm St, City U', 9, 3, 'Active', 7, '2023-09-01'),
('Victoria Flores', '2002-10-10', 'victoria.f@uni.edu', '234-567-8903', '1919 Olive St, City V', 10, 3, 'Active', 10, '2023-09-01'),
('William Green', '2003-11-05', 'william.g@uni.edu', '345-678-9014', '2020 Magnolia St, City W', 10, 2, 'Active', 11, '2024-09-01'),
('Xena Hall', '1999-12-30', 'xena.h@uni.edu', '456-789-0125', '2121 Laurel St, City X', 10, 1, 'Active', 12, '2024-09-01'),
('Yusuf Ibrahim', '2004-01-15', 'yusuf.i@uni.edu', '567-890-1236', '2222 Holly St, City Y', 11, 1, 'Active', 10, '2024-09-01'),
('Zoe Jackson', '2005-02-20', 'zoe.j@uni.edu', '678-901-2347', '2323 Ivy St, City Z', 11, 4, 'Graduated', 11, '2021-09-01'),
('Aaron King', '1998-03-25', 'aaron.k@uni.edu', '789-012-3458', '2424 Jasmine St, City AA', 12, 3, 'Active', 12, '2023-09-01'),
('Bella Lopez', '1997-04-10', 'bella.l@uni.edu', '890-123-4569', '2525 Rose St, City AB', 12, 4, 'Active', 10, '2022-09-01'),
('Charles Miller', '2000-05-05', 'charles.m@uni.edu', '901-234-5680', '2626 Tulip St, City AC', 13, 3, 'Active', 13, '2023-09-01'),
('Diana Nelson', '2001-06-30', 'diana.n@uni.edu', '012-345-6791', '2727 Daisy St, City AD', 13, 2, 'Active', 14, '2024-09-01'),
('Ethan Oliver', '2002-07-15', 'ethan.o@uni.edu', '123-456-7893', '2828 Lily St, City AE', 13, 1, 'Active', 15, '2024-09-01'),
('Fiona Patel', '2003-08-20', 'fiona.p@uni.edu', '234-567-8904', '2929 Orchid St, City AF', 14, 1, 'Active', 13, '2024-09-01'),
('George Quinn', '1999-09-25', 'george.q@uni.edu', '345-678-9015', '3030 Violet St, City AG', 14, 4, 'Graduated', 14, '2020-09-01'),
('Hannah Roberts', '2004-10-10', 'hannah.r@uni.edu', '456-789-0126', '3131 Iris St, City AH', 15, 3, 'Active', 15, '2023-09-01'),
('Isaac Sanchez', '2005-11-05', 'isaac.s@uni.edu', '567-890-1237', '3232 Lavender St, City AI', 15, 4, 'Active', 13, '2022-09-01'),
('Julia Taylor', '1998-12-30', 'julia.t@uni.edu', '678-901-2348', '3333 Marigold St, City AJ', 16, 3, 'Active', 16, '2023-09-01'),
('Kevin Underwood', '1997-01-15', 'kevin.u@uni.edu', '789-012-3459', '3434 Sunflower St, City AK', 16, 2, 'Active', 17, '2024-09-01'),
('Laura Vargas', '2000-02-20', 'laura.v@uni.edu', '890-123-4570', '3535 Daffodil St, City AL', 16, 1, 'Active', 18, '2024-09-01'),
('Michael Walker', '2001-03-25', 'michael.w@uni.edu', '901-234-5681', '3636 Hyacinth St, City AM', 17, 1, 'Active', 16, '2024-09-01'),
('Nora Xavier', '2002-04-10', 'nora.x@uni.edu', '012-345-6792', '3737 Carnation St, City AN', 17, 4, 'Graduated', 17, '2021-09-01'),
('Oscar Young', '2003-05-05', 'oscar.y@uni.edu', '123-456-7894', '3838 Peony St, City AO', 18, 3, 'Active', 18, '2023-09-01'),
('Paula Zimmerman', '1999-06-30', 'paula.z@uni.edu', '234-567-8905', '3939 Azalea St, City AP', 18, 4, 'Active', 16, '2022-09-01'),
('Quentin Adams', '2004-07-15', 'quentin.a@uni.edu', '345-678-9016', '4040 Begonia St, City AQ', 19, 3, 'Active', 19, '2023-09-01'),
('Riley Brown', '2005-08-20', 'riley.b@uni.edu', '456-789-0127', '4141 Camellia St, City AR', 19, 2, 'Active', 20, '2024-09-01'),
('Sophia Clark', '1998-09-25', 'sophia.c@uni.edu', '567-890-1238', '4242 Dahlia St, City AS', 19, 1, 'Active', 21, '2024-09-01'),
('Thomas Davis', '1997-10-10', 'thomas.d@uni.edu', '678-901-2349', '4343 Elderberry St, City AT', 20, 1, 'Active', 19, '2024-09-01'),
('Uma Evans', '2000-11-05', 'uma.e@uni.edu', '789-012-3460', '4444 Forsythia St, City AU', 20, 4, 'Graduated', 20, '2020-09-01'),
('Victor Flores', '2001-12-30', 'victor.f@uni.edu', '890-123-4571', '4545 Gardenia St, City AV', 21, 3, 'Active', 21, '2023-09-01'),
('Wendy Green', '2002-01-15', 'wendy.g@uni.edu', '901-234-5682', '4646 Hibiscus St, City AW', 21, 4, 'Active', 19, '2022-09-01'),
('Xavier Hall', '2003-02-20', 'xavier.h@uni.edu', '012-345-6793', '4747 Iris St, City AX', 22, 3, 'Active', 22, '2023-09-01');

-- ============================================================================
-- JUNCTION TABLES
-- ============================================================================

INSERT INTO CourseLecturers (course_id, lecturer_id, is_primary)
VALUES
-- Dept 1 (Computer Science), Courses 1-4, Lecturers 1-3
(1, 1, 1), (1, 2, 0),
(2, 2, 1), (2, 3, 0),
(3, 3, 1), (3, 1, 0), (3, 2, 0),
(4, 1, 1), (4, 3, 0),
-- Dept 2 (Electrical Engineering), Courses 5-8, Lecturers 4-6
(5, 4, 1), (5, 5, 0),
(6, 5, 1), (6, 6, 0),
(7, 6, 1), (7, 4, 0), (7, 5, 0),
(8, 4, 1), (8, 6, 0),
-- Dept 3 (Mechanical Engineering), Courses 9-12, Lecturers 7-9
(9, 7, 1), (9, 8, 0),
(10, 8, 1), (10, 9, 0),
(11, 9, 1), (11, 7, 0), (11, 8, 0),
(12, 7, 1), (12, 9, 0),
-- Dept 4 (Biology), Courses 13-16, Lecturers 10-12
(13, 10, 1), (13, 11, 0),
(14, 11, 1), (14, 12, 0),
(15, 12, 1), (15, 10, 0), (15, 11, 0),
(16, 10, 1), (16, 12, 0),
-- Dept 5 (Chemistry), Courses 17-20, Lecturers 13-15
(17, 13, 1), (17, 14, 0),
(18, 14, 1), (18, 15, 0),
(19, 15, 1), (19, 13, 0), (19, 14, 0),
(20, 13, 1), (20, 15, 0),
-- Dept 6 (Physics), Courses 21-24, Lecturers 16-18
(21, 16, 1), (21, 17, 0),
(22, 17, 1), (22, 18, 0),
(23, 18, 1), (23, 16, 0), (23, 17, 0),
(24, 16, 1), (24, 18, 0),
-- Dept 7 (Mathematics), Courses 25-28, Lecturers 19-21
(25, 19, 1), (25, 20, 0),
(26, 20, 1), (26, 21, 0),
(27, 21, 1), (27, 19, 0), (27, 20, 0),
(28, 19, 1), (28, 21, 0),
-- Dept 8 (Business Administration), Courses 29-32, Lecturers 22-24
(29, 22, 1), (29, 23, 0),
(30, 23, 1), (30, 24, 0),
(31, 24, 1), (31, 22, 0), (31, 23, 0),
(32, 22, 1), (32, 24, 0),
-- Dept 9 (Economics), Courses 33-36, Lecturers 25-27
(33, 25, 1), (33, 26, 0),
(34, 26, 1), (34, 27, 0),
(35, 27, 1), (35, 25, 0), (35, 26, 0),
(36, 25, 1), (36, 27, 0),
-- Dept 10 (Law), Courses 37-40, Lecturers 28-30
(37, 28, 1), (37, 29, 0),
(38, 29, 1), (38, 30, 0),
(39, 30, 1), (39, 28, 0), (39, 29, 0),
(40, 28, 1), (40, 30, 0),
-- Dept 11 (History), Courses 41-44, Lecturers 31-33
(41, 31, 1), (41, 32, 0),
(42, 32, 1), (42, 33, 0),
(43, 33, 1), (43, 31, 0), (43, 32, 0),
(44, 31, 1), (44, 33, 0),
-- Dept 12 (English Literature), Courses 45-48, Lecturers 34-36
(45, 34, 1), (45, 35, 0),
(46, 35, 1), (46, 36, 0),
(47, 36, 1), (47, 34, 0), (47, 35, 0),
(48, 34, 1), (48, 36, 0),
-- Dept 13 (Psychology), Courses 49-52, Lecturers 37-39
(49, 37, 1), (49, 38, 0),
(50, 38, 1), (50, 39, 0),
(51, 39, 1), (51, 37, 0), (51, 38, 0),
(52, 37, 1), (52, 39, 0),
-- Dept 14 (Sociology), Courses 53-56, Lecturers 40-42
(53, 40, 1), (53, 41, 0),
(54, 41, 1), (54, 42, 0),
(55, 42, 1), (55, 40, 0), (55, 41, 0),
(56, 40, 1), (56, 42, 0),
-- Dept 15 (Art and Design), Courses 57-60, Lecturers 43-45
(57, 43, 1), (57, 44, 0),
(58, 44, 1), (58, 45, 0),
(59, 45, 1), (59, 43, 0), (59, 44, 0),
(60, 43, 1), (60, 45, 0);

INSERT INTO ProgramCourses (program_id, course_id, is_required)
VALUES
-- Dept 1 Programs 1-3, assign courses 1-4 (all required) + optional from Math (25-28)
(1, 1, 1), (1, 2, 1), (1, 3, 1), (1, 4, 1), (1, 25, 0), (1, 26, 0),
(2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1), (2, 27, 0), (2, 28, 0),
(3, 1, 1), (3, 2, 1), (3, 3, 1), (3, 4, 1), (3, 25, 0), (3, 26, 0),
-- Dept 2 Programs 4-6, courses 5-8 + optional from Physics (21-24)
(4, 5, 1), (4, 6, 1), (4, 7, 1), (4, 8, 1), (4, 21, 0), (4, 22, 0),
(5, 5, 1), (5, 6, 1), (5, 7, 1), (5, 8, 1), (5, 23, 0), (5, 24, 0),
(6, 5, 1), (6, 6, 1), (6, 7, 1), (6, 8, 1), (6, 21, 0), (6, 22, 0),
-- Dept 3 Programs 7-9, courses 9-12 + optional from Engineering (1-4 or 5-8, pick EE)
(7, 9, 1), (7, 10, 1), (7, 11, 1), (7, 12, 1), (7, 5, 0), (7, 6, 0),
(8, 9, 1), (8, 10, 1), (8, 11, 1), (8, 12, 1), (8, 7, 0), (8, 8, 0),
(9, 9, 1), (9, 10, 1), (9, 11, 1), (9, 12, 1), (9, 5, 0), (9, 6, 0),
-- Dept 4 Programs 10-12, courses 13-16 + optional from Chemistry (17-20)
(10, 13, 1), (10, 14, 1), (10, 15, 1), (10, 16, 1), (10, 17, 0), (10, 18, 0),
(11, 13, 1), (11, 14, 1), (11, 15, 1), (11, 16, 1), (11, 19, 0), (11, 20, 0),
(12, 13, 1), (12, 14, 1), (12, 15, 1), (12, 16, 1), (12, 17, 0), (12, 18, 0),
-- Dept 5 Programs 13-15, courses 17-20 + optional from Physics (21-24)
(13, 17, 1), (13, 18, 1), (13, 19, 1), (13, 20, 1), (13, 21, 0), (13, 22, 0),
(14, 17, 1), (14, 18, 1), (14, 19, 1), (14, 20, 1), (14, 23, 0), (14, 24, 0),
(15, 17, 1), (15, 18, 1), (15, 19, 1), (15, 20, 1), (15, 21, 0), (15, 22, 0),
-- Dept 6 Programs 16-18, courses 21-24 + optional from Math (25-28)
(16, 21, 1), (16, 22, 1), (16, 23, 1), (16, 24, 1), (16, 25, 0), (16, 26, 0),
(17, 21, 1), (17, 22, 1), (17, 23, 1), (17, 24, 1), (17, 27, 0), (17, 28, 0),
(18, 21, 1), (18, 22, 1), (18, 23, 1), (18, 24, 1), (18, 25, 0), (18, 26, 0),
-- Dept 7 Programs 19-21, courses 25-28 + optional from CS (1-4)
(19, 25, 1), (19, 26, 1), (19, 27, 1), (19, 28, 1), (19, 1, 0), (19, 2, 0),
(20, 25, 1), (20, 26, 1), (20, 27, 1), (20, 28, 1), (20, 3, 0), (20, 4, 0),
(21, 25, 1), (21, 26, 1), (21, 27, 1), (21, 28, 1), (21, 1, 0), (21, 2, 0),
-- Dept 8 Programs 22-24, courses 29-32 + optional from Econ (33-36)
(22, 29, 1), (22, 30, 1), (22, 31, 1), (22, 32, 1), (22, 33, 0), (22, 34, 0),
(23, 29, 1), (23, 30, 1), (23, 31, 1), (23, 32, 1), (23, 35, 0), (23, 36, 0),
(24, 29, 1), (24, 30, 1), (24, 31, 1), (24, 32, 1), (24, 33, 0), (24, 34, 0),
-- Dept 9 Programs 25-27, courses 33-36 + optional from Business (29-32)
(25, 33, 1), (25, 34, 1), (25, 35, 1), (25, 36, 1), (25, 29, 0), (25, 30, 0),
(26, 33, 1), (26, 34, 1), (26, 35, 1), (26, 36, 1), (26, 31, 0), (26, 32, 0),
(27, 33, 1), (27, 34, 1), (27, 35, 1), (27, 36, 1), (27, 29, 0), (27, 30, 0),
-- Dept 10 Programs 28-30, courses 37-40 + optional from History (41-44)
(28, 37, 1), (28, 38, 1), (28, 39, 1), (28, 40, 1), (28, 41, 0), (28, 42, 0),
(29, 37, 1), (29, 38, 1), (29, 39, 1), (29, 40, 1), (29, 43, 0), (29, 44, 0),
(30, 37, 1), (30, 38, 1), (30, 39, 1), (30, 40, 1), (30, 41, 0), (30, 42, 0),
-- Dept 11 Programs 31-33, courses 41-44 + optional from English (45-48)
(31, 41, 1), (31, 42, 1), (31, 43, 1), (31, 44, 1), (31, 45, 0), (31, 46, 0),
(32, 41, 1), (32, 42, 1), (32, 43, 1), (32, 44, 1), (32, 47, 0), (32, 48, 0),
(33, 41, 1), (33, 42, 1), (33, 43, 1), (33, 44, 1), (33, 45, 0), (33, 46, 0),
-- Dept 12 Programs 34-36, courses 45-48 + optional from History (41-44)
(34, 45, 1), (34, 46, 1), (34, 47, 1), (34, 48, 1), (34, 41, 0), (34, 42, 0),
(35, 45, 1), (35, 46, 1), (35, 47, 1), (35, 48, 1), (35, 43, 0), (35, 44, 0),
(36, 45, 1), (36, 46, 1), (36, 47, 1), (36, 48, 1), (36, 41, 0), (36, 42, 0),
-- Dept 13 Programs 37-39, courses 49-52 + optional from Sociology (53-56)
(37, 49, 1), (37, 50, 1), (37, 51, 1), (37, 52, 1), (37, 53, 0), (37, 54, 0),
(38, 49, 1), (38, 50, 1), (38, 51, 1), (38, 52, 1), (38, 55, 0), (38, 56, 0),
(39, 49, 1), (39, 50, 1), (39, 51, 1), (39, 52, 1), (39, 53, 0), (39, 54, 0),
-- Dept 14 Programs 40-42, courses 53-56 + optional from Psychology (49-52)
(40, 53, 1), (40, 54, 1), (40, 55, 1), (40, 56, 1), (40, 49, 0), (40, 50, 0),
(41, 53, 1), (41, 54, 1), (41, 55, 1), (41, 56, 1), (41, 51, 0), (41, 52, 0),
(42, 53, 1), (42, 54, 1), (42, 55, 1), (42, 56, 1), (42, 49, 0), (42, 50, 0),
-- Dept 15 Programs 43-45, courses 57-60 + optional from general (e.g., English 45-48)
(43, 57, 1), (43, 58, 1), (43, 59, 1), (43, 60, 1), (43, 45, 0), (43, 46, 0),
(44, 57, 1), (44, 58, 1), (44, 59, 1), (44, 60, 1), (44, 47, 0), (44, 48, 0),
(45, 57, 1), (45, 58, 1), (45, 59, 1), (45, 60, 1), (45, 45, 0), (45, 46, 0);

INSERT INTO CourseMaterials (course_id, material_type, title, file_path, upload_date)
VALUES
-- Course 1 (CS101)
(1, 'Lecture Notes', 'Week 1: Python Basics', '/materials/cs101/week1_notes.pdf', '2025-09-05'),
(1, 'Video', 'Intro to Programming Lecture', '/materials/cs101/intro_video.mp4', '2025-09-10'),
(1, 'Assignment', 'Programming Exercise 1', '/materials/cs101/assignment1.docx', '2025-09-15'),
-- Course 2 (CS201)
(2, 'Lecture Notes', 'Arrays and Linked Lists', '/materials/cs201/arrays_notes.pdf', '2025-09-05'),
(2, 'Video', 'Data Structures Overview', '/materials/cs201/ds_video.mp4', '2025-09-10'),
(2, 'Textbook', 'Introduction to Algorithms', '/materials/cs201/algo_textbook.pdf', '2025-09-15'),
-- Course 3 (CS301)
(3, 'Lecture Notes', 'Supervised Learning', '/materials/cs301/supervised_notes.pdf', '2025-09-05'),
(3, 'Video', 'ML Algorithms Demo', '/materials/cs301/ml_demo.mp4', '2025-09-10'),
(3, 'Assignment', 'KNN Implementation', '/materials/cs301/knn_assignment.py', '2025-09-15'),
-- Course 4 (CS401)
(4, 'Lecture Notes', 'Relational Databases', '/materials/cs401/relational_notes.pdf', '2025-09-05'),
(4, 'Video', 'SQL Tutorial', '/materials/cs401/sql_tutorial.mp4', '2025-09-10'),
(4, 'Textbook', 'Database Systems Book', '/materials/cs401/db_book.pdf', '2025-09-15'),
-- Course 5 (EE101)
(5, 'Lecture Notes', 'Basic Circuits', '/materials/ee101/circuits_notes.pdf', '2025-09-05'),
(5, 'Video', 'Ohm''s Law Explanation', '/materials/ee101/ohms_video.mp4', '2025-09-10'),
(5, 'Assignment', 'Circuit Analysis Lab', '/materials/ee101/lab1.docx', '2025-09-15'),
-- Course 6 (EE201)
(6, 'Lecture Notes', 'Logic Gates', '/materials/ee201/gates_notes.pdf', '2025-09-05'),
(6, 'Video', 'Digital Design Basics', '/materials/ee201/digital_video.mp4', '2025-09-10'),
(6, 'Textbook', 'Digital Electronics Guide', '/materials/ee201/digital_guide.pdf', '2025-09-15'),
-- Course 7 (EE301)
(7, 'Lecture Notes', 'Power Transmission', '/materials/ee301/power_notes.pdf', '2025-09-05'),
(7, 'Video', 'Renewable Energy Sources', '/materials/ee301/renewable_video.mp4', '2025-09-10'),
(7, 'Assignment', 'Grid Simulation', '/materials/ee301/grid_assignment.xlsx', '2025-09-15'),
-- Course 8 (EE401)
(8, 'Lecture Notes', 'Fourier Transforms', '/materials/ee401/fourier_notes.pdf', '2025-09-05'),
(8, 'Video', 'Signal Filtering Demo', '/materials/ee401/filter_demo.mp4', '2025-09-10'),
(8, 'Textbook', 'Signal Processing Textbook', '/materials/ee401/signal_book.pdf', '2025-09-15'),
-- Course 9 (ME101)
(9, 'Lecture Notes', 'Statics Principles', '/materials/me101/statics_notes.pdf', '2025-09-05'),
(9, 'Video', 'Force Equilibrium', '/materials/me101/equilibrium_video.mp4', '2025-09-10'),
(9, 'Assignment', 'Mechanics Problem Set', '/materials/me101/problem_set.docx', '2025-09-15'),
-- Course 10 (ME201)
(10, 'Lecture Notes', 'Thermodynamic Cycles', '/materials/me201/cycles_notes.pdf', '2025-09-05'),
(10, 'Video', 'Heat Transfer Basics', '/materials/me201/heat_video.mp4', '2025-09-10'),
(10, 'Textbook', 'Thermodynamics Fundamentals', '/materials/me201/thermo_book.pdf', '2025-09-15'),
-- Course 11 (ME301)
(11, 'Lecture Notes', 'Robot Kinematics', '/materials/me301/kinematics_notes.pdf', '2025-09-05'),
(11, 'Video', 'Robot Control Systems', '/materials/me301/control_video.mp4', '2025-09-10'),
(11, 'Assignment', 'Robotics Project', '/materials/me301/robot_project.pdf', '2025-09-15'),
-- Course 12 (ME401)
(12, 'Lecture Notes', 'Material Properties', '/materials/me401/properties_notes.pdf', '2025-09-05'),
(12, 'Video', 'Nanomaterials Intro', '/materials/me401/nano_video.mp4', '2025-09-10'),
(12, 'Textbook', 'Materials Science Guide', '/materials/me401/materials_guide.pdf', '2025-09-15'),
-- Course 13 (BIO101)
(13, 'Lecture Notes', 'Cell Biology', '/materials/bio101/cell_notes.pdf', '2025-09-05'),
(13, 'Video', 'Genetics Overview', '/materials/bio101/genetics_video.mp4', '2025-09-10'),
(13, 'Assignment', 'Biology Lab Report', '/materials/bio101/lab_report.docx', '2025-09-15'),
-- Course 14 (BIO201)
(14, 'Lecture Notes', 'Bacterial Structures', '/materials/bio201/bacteria_notes.pdf', '2025-09-05'),
(14, 'Video', 'Immune System Function', '/materials/bio201/immune_video.mp4', '2025-09-10'),
(14, 'Textbook', 'Microbiology Textbook', '/materials/bio201/micro_book.pdf', '2025-09-15'),
-- Course 15 (BIO301)
(15, 'Lecture Notes', 'Ecosystem Dynamics', '/materials/bio301/ecosystem_notes.pdf', '2025-09-05'),
(15, 'Video', 'Biodiversity Conservation', '/materials/bio301/bio_video.mp4', '2025-09-10'),
(15, 'Assignment', 'Ecology Field Study', '/materials/bio301/field_study.pdf', '2025-09-15'),
-- Course 16 (BIO401)
(16, 'Lecture Notes', 'CRISPR Technology', '/materials/bio401/crispr_notes.pdf', '2025-09-05'),
(16, 'Video', 'Genetic Engineering Demo', '/materials/bio401/genetic_video.mp4', '2025-09-10'),
(16, 'Textbook', 'Biotech Applications', '/materials/bio401/biotech_book.pdf', '2025-09-15'),
-- Course 17 (CHEM101)
(17, 'Lecture Notes', 'Atomic Structure', '/materials/chem101/atomic_notes.pdf', '2025-09-05'),
(17, 'Video', 'Chemical Reactions', '/materials/chem101/reactions_video.mp4', '2025-09-10'),
(17, 'Assignment', 'Chemistry Problem Set', '/materials/chem101/problem_set.docx', '2025-09-15'),
-- Course 18 (CHEM201)
(18, 'Lecture Notes', 'Organic Reactions', '/materials/chem201/organic_notes.pdf', '2025-09-05'),
(18, 'Video', 'Synthesis Techniques', '/materials/chem201/synthesis_video.mp4', '2025-09-10'),
(18, 'Textbook', 'Organic Chemistry Guide', '/materials/chem201/organic_guide.pdf', '2025-09-15'),
-- Course 19 (CHEM301)
(19, 'Lecture Notes', 'Quantum Chemistry', '/materials/chem301/quantum_notes.pdf', '2025-09-05'),
(19, 'Video', 'Thermodynamics in Chem', '/materials/chem301/thermo_video.mp4', '2025-09-10'),
(19, 'Assignment', 'Physical Chem Lab', '/materials/chem301/lab.docx', '2025-09-15'),
-- Course 20 (CHEM401)
(20, 'Lecture Notes', 'Coordination Compounds', '/materials/chem401/coord_notes.pdf', '2025-09-05'),
(20, 'Video', 'Inorganic Synthesis', '/materials/chem401/inorganic_video.mp4', '2025-09-10'),
(20, 'Textbook', 'Inorganic Chemistry Book', '/materials/chem401/inorganic_book.pdf', '2025-09-15'),
-- Course 21 (PHYS101)
(21, 'Lecture Notes', 'Mechanics Basics', '/materials/phys101/mechanics_notes.pdf', '2025-09-05'),
(21, 'Video', 'Newton''s Laws', '/materials/phys101/newton_video.mp4', '2025-09-10'),
(21, 'Assignment', 'Physics Problems', '/materials/phys101/problems.docx', '2025-09-15'),
-- Course 22 (PHYS201)
(22, 'Lecture Notes', 'Electric Fields', '/materials/phys201/fields_notes.pdf', '2025-09-05'),
(22, 'Video', 'Magnetism Demo', '/materials/phys201/magnet_video.mp4', '2025-09-10'),
(22, 'Textbook', 'Electromagnetism Guide', '/materials/phys201/em_guide.pdf', '2025-09-15'),
-- Course 23 (PHYS301)
(23, 'Lecture Notes', 'Wave Functions', '/materials/phys301/wave_notes.pdf', '2025-09-05'),
(23, 'Video', 'Quantum Experiments', '/materials/phys301/quantum_video.mp4', '2025-09-10'),
(23, 'Assignment', 'Quantum Calculations', '/materials/phys301/calc.docx', '2025-09-15'),
-- Course 24 (PHYS401)
(24, 'Lecture Notes', 'Stellar Evolution', '/materials/phys401/stellar_notes.pdf', '2025-09-05'),
(24, 'Video', 'Galaxy Formation', '/materials/phys401/galaxy_video.mp4', '2025-09-10'),
(24, 'Textbook', 'Astrophysics Textbook', '/materials/phys401/astro_book.pdf', '2025-09-15'),
-- Course 25 (MATH101)
(25, 'Lecture Notes', 'Limits and Derivatives', '/materials/math101/limits_notes.pdf', '2025-09-05'),
(25, 'Video', 'Calculus Intro', '/materials/math101/calc_video.mp4', '2025-09-10'),
(25, 'Assignment', 'Calc Problem Set', '/materials/math101/calc_set.docx', '2025-09-15'),
-- Course 26 (MATH201)
(26, 'Lecture Notes', 'Matrix Operations', '/materials/math201/matrix_notes.pdf', '2025-09-05'),
(26, 'Video', 'Linear Systems', '/materials/math201/linear_video.mp4', '2025-09-10'),
(26, 'Textbook', 'Linear Algebra Book', '/materials/math201/linear_book.pdf', '2025-09-15'),
-- Course 27 (MATH301)
(27, 'Lecture Notes', 'Probability Distributions', '/materials/math301/prob_notes.pdf', '2025-09-05'),
(27, 'Video', 'Statistical Inference', '/materials/math301/stat_video.mp4', '2025-09-10'),
(27, 'Assignment', 'Stats Exercises', '/materials/math301/stats_ex.docx', '2025-09-15'),
-- Course 28 (MATH401)
(28, 'Lecture Notes', 'Prime Number Theory', '/materials/math401/prime_notes.pdf', '2025-09-05'),
(28, 'Video', 'Cryptography Basics', '/materials/math401/crypto_video.mp4', '2025-09-10'),
(28, 'Textbook', 'Number Theory Guide', '/materials/math401/number_guide.pdf', '2025-09-15'),
-- Course 29 (BUS101)
(29, 'Lecture Notes', 'Business Fundamentals', '/materials/bus101/fund_notes.pdf', '2025-09-05'),
(29, 'Video', 'Management Principles', '/materials/bus101/mgmt_video.mp4', '2025-09-10'),
(29, 'Assignment', 'Business Case Study', '/materials/bus101/case.docx', '2025-09-15'),
-- Course 30 (BUS201)
(30, 'Lecture Notes', 'Marketing Strategies', '/materials/bus201/mark_notes.pdf', '2025-09-05'),
(30, 'Video', 'Consumer Behavior', '/materials/bus201/cons_video.mp4', '2025-09-10'),
(30, 'Textbook', 'Marketing Textbook', '/materials/bus201/mark_book.pdf', '2025-09-15'),
-- Course 31 (BUS301)
(31, 'Lecture Notes', 'Financial Analysis', '/materials/bus301/fin_notes.pdf', '2025-09-05'),
(31, 'Video', 'Investment Strategies', '/materials/bus301/invest_video.mp4', '2025-09-10'),
(31, 'Assignment', 'Budget Project', '/materials/bus301/budget.xlsx', '2025-09-15'),
-- Course 32 (BUS401)
(32, 'Lecture Notes', 'Startup Planning', '/materials/bus401/start_notes.pdf', '2025-09-05'),
(32, 'Video', 'Entrepreneur Stories', '/materials/bus401/entre_video.mp4', '2025-09-10'),
(32, 'Textbook', 'Entrepreneurship Guide', '/materials/bus401/entre_guide.pdf', '2025-09-15'),
-- Course 33 (ECON101)
(33, 'Lecture Notes', 'Supply and Demand', '/materials/econ101/supply_notes.pdf', '2025-09-05'),
(33, 'Video', 'Market Equilibrium', '/materials/econ101/market_video.mp4', '2025-09-10'),
(33, 'Assignment', 'Econ Problems', '/materials/econ101/problems.docx', '2025-09-15'),
-- Course 34 (ECON201)
(34, 'Lecture Notes', 'GDP and Inflation', '/materials/econ201/gdp_notes.pdf', '2025-09-05'),
(34, 'Video', 'Economic Policy', '/materials/econ201/policy_video.mp4', '2025-09-10'),
(34, 'Textbook', 'Macroeconomics Book', '/materials/econ201/macro_book.pdf', '2025-09-15'),
-- Course 35 (ECON301)
(35, 'Lecture Notes', 'Regression Models', '/materials/econ301/reg_notes.pdf', '2025-09-05'),
(35, 'Video', 'Econometric Tools', '/materials/econ301/econ_video.mp4', '2025-09-10'),
(35, 'Assignment', 'Data Analysis', '/materials/econ301/data.xlsx', '2025-09-15'),
-- Course 36 (ECON401)
(36, 'Lecture Notes', 'Trade Theories', '/materials/econ401/trade_notes.pdf', '2025-09-05'),
(36, 'Video', 'Global Economics', '/materials/econ401/global_video.mp4', '2025-09-10'),
(36, 'Textbook', 'International Econ Guide', '/materials/econ401/int_guide.pdf', '2025-09-15'),
-- Course 37 (LAW101)
(37, 'Lecture Notes', 'Legal Systems', '/materials/law101/systems_notes.pdf', '2025-09-05'),
(37, 'Video', 'Court Structures', '/materials/law101/court_video.mp4', '2025-09-10'),
(37, 'Assignment', 'Case Brief', '/materials/law101/brief.docx', '2025-09-15'),
-- Course 38 (LAW201)
(38, 'Lecture Notes', 'Constitutional Rights', '/materials/law201/rights_notes.pdf', '2025-09-05'),
(38, 'Video', 'Judicial Review', '/materials/law201/review_video.mp4', '2025-09-10'),
(38, 'Textbook', 'Constitutional Law Book', '/materials/law201/const_book.pdf', '2025-09-15'),
-- Course 39 (LAW301)
(39, 'Lecture Notes', 'Criminal Procedures', '/materials/law301/proc_notes.pdf', '2025-09-05'),
(39, 'Video', 'Trial Process', '/materials/law301/trial_video.mp4', '2025-09-10'),
(39, 'Assignment', 'Mock Trial Script', '/materials/law301/script.docx', '2025-09-15'),
-- Course 40 (LAW401)
(40, 'Lecture Notes', 'International Treaties', '/materials/law401/treaties_notes.pdf', '2025-09-05'),
(40, 'Video', 'Global Disputes', '/materials/law401/disputes_video.mp4', '2025-09-10'),
(40, 'Textbook', 'International Law Guide', '/materials/law401/int_law_guide.pdf', '2025-09-15'),
-- Course 41 (HIST101)
(41, 'Lecture Notes', 'Ancient Civilizations', '/materials/hist101/ancient_notes.pdf', '2025-09-05'),
(41, 'Video', 'World History Timeline', '/materials/hist101/timeline_video.mp4', '2025-09-10'),
(41, 'Assignment', 'History Essay', '/materials/hist101/essay.docx', '2025-09-15'),
-- Course 42 (HIST201)
(42, 'Lecture Notes', 'Middle Ages Europe', '/materials/hist201/middle_notes.pdf', '2025-09-05'),
(42, 'Video', 'Enlightenment Era', '/materials/hist201/enlight_video.mp4', '2025-09-10'),
(42, 'Textbook', 'European History Book', '/materials/hist201/euro_book.pdf', '2025-09-15'),
-- Course 43 (HIST301)
(43, 'Lecture Notes', 'Colonial America', '/materials/hist301/colonial_notes.pdf', '2025-09-05'),
(43, 'Video', 'US Revolution', '/materials/hist301/revol_video.mp4', '2025-09-10'),
(43, 'Assignment', 'Historical Analysis', '/materials/hist301/analysis.docx', '2025-09-15'),
-- Course 44 (HIST401)
(44, 'Lecture Notes', 'Cultural Movements', '/materials/hist401/cultural_notes.pdf', '2025-09-05'),
(44, 'Video', 'Art and Society', '/materials/hist401/art_video.mp4', '2025-09-10'),
(44, 'Textbook', 'Cultural History Guide', '/materials/hist401/cultural_guide.pdf', '2025-09-15'),
-- Course 45 (ENG101)
(45, 'Lecture Notes', 'Writing Fundamentals', '/materials/eng101/writing_notes.pdf', '2025-09-05'),
(45, 'Video', 'Rhetoric Techniques', '/materials/eng101/rhet_video.mp4', '2025-09-10'),
(45, 'Assignment', 'Composition Essay', '/materials/eng101/essay.docx', '2025-09-15'),
-- Course 46 (ENG201)
(46, 'Lecture Notes', 'British Authors', '/materials/eng201/brit_notes.pdf', '2025-09-05'),
(46, 'Video', 'Shakespeare Plays', '/materials/eng201/shake_video.mp4', '2025-09-10'),
(46, 'Textbook', 'British Lit Anthology', '/materials/eng201/brit_anthology.pdf', '2025-09-15'),
-- Course 47 (ENG301)
(47, 'Lecture Notes', 'American Classics', '/materials/eng301/amer_notes.pdf', '2025-09-05'),
(47, 'Video', 'Literary Analysis', '/materials/eng301/lit_video.mp4', '2025-09-10'),
(47, 'Assignment', 'Book Review', '/materials/eng301/review.docx', '2025-09-15'),
-- Course 48 (ENG401)
(48, 'Lecture Notes', 'Fiction Writing', '/materials/eng401/fiction_notes.pdf', '2025-09-05'),
(48, 'Video', 'Poetry Workshop', '/materials/eng401/poetry_video.mp4', '2025-09-10'),
(48, 'Textbook', 'Creative Writing Guide', '/materials/eng401/creative_guide.pdf', '2025-09-15'),
-- Course 49 (PSY101)
(49, 'Lecture Notes', 'Behavior Basics', '/materials/psy101/behav_notes.pdf', '2025-09-05'),
(49, 'Video', 'Mind Processes', '/materials/psy101/mind_video.mp4', '2025-09-10'),
(49, 'Assignment', 'Psych Experiment', '/materials/psy101/experiment.docx', '2025-09-15'),
-- Course 50 (PSY201)
(50, 'Lecture Notes', 'Memory Models', '/materials/psy201/memory_notes.pdf', '2025-09-05'),
(50, 'Video', 'Perception Demo', '/materials/psy201/perc_video.mp4', '2025-09-10'),
(50, 'Textbook', 'Cognitive Psych Book', '/materials/psy201/cog_book.pdf', '2025-09-15'),
-- Course 51 (PSY301)
(51, 'Lecture Notes', 'Group Dynamics', '/materials/psy301/group_notes.pdf', '2025-09-05'),
(51, 'Video', 'Social Influence', '/materials/psy301/social_video.mp4', '2025-09-10'),
(51, 'Assignment', 'Behavior Study', '/materials/psy301/study.docx', '2025-09-15'),
-- Course 52 (PSY401)
(52, 'Lecture Notes', 'Therapy Methods', '/materials/psy401/therapy_notes.pdf', '2025-09-05'),
(52, 'Video', 'Diagnosis Techniques', '/materials/psy401/diag_video.mp4', '2025-09-10'),
(52, 'Textbook', 'Clinical Psych Guide', '/materials/psy401/clinical_guide.pdf', '2025-09-15'),
-- Course 53 (SOC101)
(53, 'Lecture Notes', 'Social Structures', '/materials/soc101/struct_notes.pdf', '2025-09-05'),
(53, 'Video', 'Culture Overview', '/materials/soc101/culture_video.mp4', '2025-09-10'),
(53, 'Assignment', 'Society Analysis', '/materials/soc101/analysis.docx', '2025-09-15'),
-- Course 54 (SOC201)
(54, 'Lecture Notes', 'Inequality Theories', '/materials/soc201/ineq_notes.pdf', '2025-09-05'),
(54, 'Video', 'Class Dynamics', '/materials/soc201/class_video.mp4', '2025-09-10'),
(54, 'Textbook', 'Social Inequality Book', '/materials/soc201/ineq_book.pdf', '2025-09-15'),
-- Course 55 (SOC301)
(55, 'Lecture Notes', 'Urban Development', '/materials/soc301/urban_notes.pdf', '2025-09-05'),
(55, 'Video', 'Community Studies', '/materials/soc301/comm_video.mp4', '2025-09-10'),
(55, 'Assignment', 'City Project', '/materials/soc301/project.docx', '2025-09-15'),
-- Course 56 (SOC401)
(56, 'Lecture Notes', 'Global Issues', '/materials/soc401/global_notes.pdf', '2025-09-05'),
(56, 'Video', 'Globalization Effects', '/materials/soc401/glob_video.mp4', '2025-09-10'),
(56, 'Textbook', 'Global Sociology Guide', '/materials/soc401/global_guide.pdf', '2025-09-15'),
-- Course 57 (ART101)
(57, 'Lecture Notes', 'Art History Timeline', '/materials/art101/history_notes.pdf', '2025-09-05'),
(57, 'Video', 'Art Appreciation', '/materials/art101/apprec_video.mp4', '2025-09-10'),
(57, 'Assignment', 'Art Critique', '/materials/art101/critique.docx', '2025-09-15'),
-- Course 58 (ART201)
(58, 'Lecture Notes', 'Digital Design Tools', '/materials/art201/digital_notes.pdf', '2025-09-05'),
(58, 'Video', 'Graphic Software Tutorial', '/materials/art201/soft_video.mp4', '2025-09-10'),
(58, 'Textbook', 'Graphic Design Book', '/materials/art201/graph_book.pdf', '2025-09-15'),
-- Course 59 (ART301)
(59, 'Lecture Notes', 'Painting Methods', '/materials/art301/paint_notes.pdf', '2025-09-05'),
(59, 'Video', 'Composition Techniques', '/materials/art301/comp_video.mp4', '2025-09-10'),
(59, 'Assignment', 'Painting Project', '/materials/art301/paint_project.pdf', '2025-09-15'),
-- Course 60 (ART401)
(60, 'Lecture Notes', 'Sculpture Forms', '/materials/art401/sculpt_notes.pdf', '2025-09-05'),
(60, 'Video', '3D Modeling Demo', '/materials/art401/model_video.mp4', '2025-09-10'),
(60, 'Textbook', 'Sculpture Guide', '/materials/art401/sculpt_guide.pdf', '2025-09-15');

-- ============================================================================
-- ENROLLMENTS
-- ============================================================================

INSERT INTO Enrollments (student_id, course_id, semester_id, enrollment_date, grade, grade_numeric, attendance_percentage, status)
VALUES
-- Student 1 (Program 1, Dept 1: Courses from program 1 - 1,2,3,4,25,26)
(1, 1, 16, '2025-08-25', 'A', 95.00, 98.50, 'Completed'),
(1, 2, 17, '2026-01-01', 'C', 75.00, 85.00, 'Active'),
(1, 3, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(1, 4, 16, '2025-08-25', 'D', 65.00, 78.00, 'Completed'),
(1, 25, 17, '2026-01-01', 'B', 85.00, 92.50, 'Active'),
(1, 26, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 2 (Program 1)
(2, 1, 16, '2025-08-25', 'B+', 87.00, 94.00, 'Completed'),
(2, 2, 17, '2026-01-01', 'F', 55.00, 70.00, 'Active'),
(2, 3, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(2, 4, 16, '2025-08-25', 'C', 72.00, 82.00, 'Completed'),
(2, 25, 17, '2026-01-01', 'A-', 91.00, 95.50, 'Active'),
-- Student 3 (Program 1)
(3, 1, 17, '2026-01-01', 'A-', 91.00, 97.50, 'Active'),
(3, 2, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(3, 3, 16, '2025-08-25', 'B+', 89.00, 95.50, 'Completed'),
(3, 4, 17, '2026-01-01', 'D', 68.00, 75.00, 'Active'),
(3, 26, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 4 (Program 2, Dept 1: Courses 1,2,3,4,27,28)
(4, 1, 16, '2025-08-25', 'B', 84.00, 92.00, 'Completed'),
(4, 2, 17, '2026-01-01', 'A-', 90.00, 96.00, 'Active'),
(4, 3, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(4, 4, 16, '2025-08-25', 'C', 76.00, 84.00, 'Completed'),
(4, 27, 17, '2026-01-01', 'A', 95.50, 97.50, 'Active'),
(4, 28, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 5 (Program 2)
(5, 1, 17, '2026-01-01', 'A', 93.00, 98.00, 'Active'),
(5, 3, 16, '2025-08-25', 'F', 50.00, 65.00, 'Completed'),
(5, 4, 17, '2026-01-01', 'A-', 91.50, 96.50, 'Active'),
-- Student 6 (Program 3, Dept 1: Courses 1,2,3,4,25,26)
(6, 1, 16, '2025-08-25', 'B', 80.00, 90.00, 'Completed'),
(6, 2, 17, '2026-01-01', 'A', 94.00, 97.00, 'Active'),
(6, 3, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(6, 4, 16, '2025-08-25', 'B+', 86.00, 93.00, 'Completed'),
(6, 25, 17, '2026-01-01', 'C', 73.00, 80.00, 'Active'),
(6, 26, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 7 (Program 3)
(7, 1, 17, '2026-01-01', 'A', 95.00, 98.00, 'Active'),
(7, 2, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(7, 3, 16, '2025-08-25', 'D', 62.00, 72.00, 'Completed'),
(7, 4, 17, '2026-01-01', 'A-', 92.00, 96.00, 'Active'),
(7, 25, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 8 (Program 4, Dept 2: Courses 5,6,7,8,21,22)
(8, 5, 16, '2025-08-25', 'A', 96.00, 99.00, 'Completed'),
(8, 6, 17, '2026-01-01', 'B+', 88.00, 94.00, 'Active'),
(8, 7, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(8, 8, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(8, 21, 17, '2026-01-01', 'F', 58.00, 68.00, 'Active'),
(8, 22, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 9 (Program 4)
(9, 5, 17, '2026-01-01', 'B+', 89.00, 95.00, 'Active'),
(9, 6, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(9, 7, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(9, 8, 17, '2026-01-01', 'C', 74.00, 83.00, 'Active'),
(9, 21, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 10 (Program 4)
(10, 5, 16, '2025-08-25', 'A-', 90.00, 95.00, 'Completed'),
(10, 6, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(10, 8, 16, '2025-08-25', 'D', 66.00, 76.00, 'Completed'),
-- Student 11 (Program 5, Dept 2: Courses 5,6,7,8,23,24)
(11, 5, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(11, 6, 17, '2026-01-01', 'A', 93.00, 97.00, 'Active'),
(11, 7, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(11, 8, 16, '2025-08-25', 'B+', 86.00, 93.00, 'Completed'),
(11, 23, 17, '2026-01-01', 'A-', 91.00, 95.00, 'Active'),
(11, 24, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 12 (Program 5)
(12, 5, 17, '2026-01-01', 'A', 94.00, 98.00, 'Active'),
(12, 6, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(12, 7, 16, '2025-08-25', 'C', 77.00, 85.00, 'Completed'),
(12, 8, 17, '2026-01-01', 'A-', 90.50, 96.00, 'Active'),
(12, 23, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 13 (Program 6, Dept 2: Courses 5,6,7,8,21,22)
(13, 5, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(13, 6, 17, '2026-01-01', 'F', 52.00, 65.00, 'Active'),
(13, 7, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(13, 8, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
(13, 21, 17, '2026-01-01', 'A-', 92.00, 96.00, 'Active'),
(13, 22, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 14 (Program 6)
(14, 5, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(14, 6, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(14, 7, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(14, 8, 17, '2026-01-01', 'D', 63.00, 73.00, 'Active'),
(14, 21, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 15 (Program 7, Dept 3: Courses 9,10,11,12,5,6)
(15, 9, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(15, 11, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(15, 12, 16, '2025-08-25', 'C', 78.00, 86.00, 'Completed'),
-- Student 16 (Program 7)
(16, 9, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(16, 10, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(16, 11, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(16, 12, 17, '2026-01-01', 'F', 48.00, 62.00, 'Active'),
(16, 5, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 17 (Program 7)
(17, 9, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(17, 10, 17, '2026-01-01', 'B+', 87.50, 93.50, 'Active'),
(17, 11, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(17, 12, 16, '2025-08-25', 'A', 94.50, 97.50, 'Completed'),
(17, 6, 17, '2026-01-01', 'C', 71.00, 81.00, 'Active'),
-- Student 18 (Program 8, Dept 3: Courses 9,10,11,12,7,8)
(18, 9, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(18, 10, 17, '2026-01-01', 'A', 93.00, 97.00, 'Active'),
(18, 11, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(18, 12, 16, '2025-08-25', 'B+', 86.00, 93.00, 'Completed'),
(18, 7, 17, '2026-01-01', 'D', 67.00, 77.00, 'Active'),
(18, 8, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 19 (Program 8)
(19, 9, 17, '2026-01-01', 'A', 94.00, 98.00, 'Active'),
(19, 10, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(19, 11, 16, '2025-08-25', 'B', 84.00, 91.00, 'Completed'),
(19, 12, 17, '2026-01-01', 'A-', 90.50, 96.00, 'Active'),
(19, 7, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 20 (Program 9, Dept 3: Courses 9,10,11,12,5,6)
(20, 9, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(20, 11, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(20, 12, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
-- Student 21 (Program 9)
(21, 9, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(21, 10, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(21, 11, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(21, 12, 17, '2026-01-01', 'C', 79.00, 87.00, 'Active'),
(21, 5, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 22 (Program 10, Dept 4: Courses 13,14,15,16,17,18)
(22, 13, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(22, 14, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(22, 15, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(22, 16, 16, '2025-08-25', 'D', 64.00, 74.00, 'Completed'),
(22, 17, 17, '2026-01-01', 'B', 83.00, 91.00, 'Active'),
(22, 18, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 23 (Program 10)
(23, 13, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(23, 14, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(23, 15, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(23, 16, 17, '2026-01-01', 'F', 45.00, 60.00, 'Active'),
(23, 17, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 24 (Program 10)
(24, 13, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(24, 14, 17, '2026-01-01', 'B+', 87.50, 93.50, 'Active'),
(24, 15, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(24, 16, 16, '2025-08-25', 'C', 70.00, 80.00, 'Completed'),
(24, 18, 17, '2026-01-01', 'B', 85.00, 92.00, 'Active'),
-- Student 25 (Program 11, Dept 4: Courses 13,14,15,16,19,20)
(25, 13, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(25, 15, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(25, 16, 16, '2025-08-25', 'B+', 86.00, 93.00, 'Completed'),
-- Student 26 (Program 11)
(26, 13, 17, '2026-01-01', 'A', 94.00, 98.00, 'Active'),
(26, 14, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(26, 15, 16, '2025-08-25', 'B', 84.00, 91.00, 'Completed'),
(26, 16, 17, '2026-01-01', 'A-', 90.50, 96.00, 'Active'),
(26, 19, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 27 (Program 12, Dept 4: Courses 13,14,15,16,17,18)
(27, 13, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(27, 14, 17, '2026-01-01', 'A', 95.00, 98.50, 'Active'),
(27, 15, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(27, 16, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
(27, 17, 17, '2026-01-01', 'C', 76.00, 84.00, 'Active'),
(27, 18, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 28 (Program 12)
(28, 13, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(28, 14, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(28, 15, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(28, 16, 17, '2026-01-01', 'F', 54.00, 69.00, 'Active'),
(28, 17, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 29 (Program 13, Dept 5: Courses 17,18,19,20,21,22)
(29, 17, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(29, 18, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(29, 19, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(29, 20, 16, '2025-08-25', 'A-', 90.00, 95.00, 'Completed'),
(29, 21, 17, '2026-01-01', 'B', 83.00, 91.00, 'Active'),
(29, 22, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 30 (Program 13)
(30, 17, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(30, 19, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(30, 20, 17, '2026-01-01', 'C', 74.00, 83.00, 'Active'),
-- Student 31 (Program 13)
(31, 17, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(31, 18, 17, '2026-01-01', 'B+', 87.50, 93.50, 'Active'),
(31, 19, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(31, 20, 16, '2025-08-25', 'D', 66.00, 76.00, 'Completed'),
(31, 22, 17, '2026-01-01', 'B', 85.00, 92.00, 'Active'),
-- Student 32 (Program 14, Dept 5: Courses 17,18,19,20,23,24)
(32, 17, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(32, 18, 17, '2026-01-01', 'A', 93.00, 97.00, 'Active'),
(32, 19, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(32, 20, 16, '2025-08-25', 'B+', 86.00, 93.00, 'Completed'),
(32, 23, 17, '2026-01-01', 'F', 49.00, 64.00, 'Active'),
(32, 24, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 33 (Program 14)
(33, 17, 17, '2026-01-01', 'A', 94.00, 98.00, 'Active'),
(33, 18, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(33, 19, 16, '2025-08-25', 'B', 84.00, 91.00, 'Completed'),
(33, 20, 17, '2026-01-01', 'A-', 90.50, 96.00, 'Active'),
(33, 23, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 34 (Program 15, Dept 5: Courses 17,18,19,20,21,22)
(34, 17, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(34, 18, 17, '2026-01-01', 'C', 72.00, 82.00, 'Active'),
(34, 19, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(34, 20, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
(34, 21, 17, '2026-01-01', 'A-', 92.00, 96.00, 'Active'),
(34, 22, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 35 (Program 15)
(35, 17, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(35, 18, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(35, 19, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(35, 20, 17, '2026-01-01', 'D', 60.00, 70.00, 'Active'),
(35, 21, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 36 (Program 16, Dept 6: Courses 21,22,23,24,25,26)
(36, 21, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(36, 22, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(36, 23, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(36, 24, 16, '2025-08-25', 'C', 78.00, 86.00, 'Completed'),
(36, 25, 17, '2026-01-01', 'B', 83.00, 91.00, 'Active'),
(36, 26, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 37 (Program 16)
(37, 21, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(37, 22, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(37, 23, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(37, 24, 17, '2026-01-01', 'F', 50.00, 65.00, 'Active'),
(37, 25, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 38 (Program 17, Dept 6: Courses 21,22,23,24,27,28)
(38, 21, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(38, 22, 17, '2026-01-01', 'B+', 87.50, 93.50, 'Active'),
(38, 23, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(38, 24, 16, '2025-08-25', 'A', 94.50, 97.50, 'Completed'),
(38, 27, 17, '2026-01-01', 'C', 70.00, 80.00, 'Active'),
(38, 28, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 39 (Program 17)
(39, 21, 17, '2026-01-01', 'A', 95.00, 98.00, 'Active'),
(39, 22, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
(39, 23, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(39, 24, 17, '2026-01-01', 'D', 65.00, 75.00, 'Active'),
(39, 27, 18, '2026-05-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 40 (Program 18, Dept 6: Courses 21,22,23,24,25,26)
(40, 21, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(40, 23, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(40, 24, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
-- Student 41 (Program 18)
(41, 21, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(41, 22, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(41, 23, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(41, 24, 17, '2026-01-01', 'C', 75.00, 85.00, 'Active'),
(41, 25, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 42 (Program 19, Dept 7: Courses 25,26,27,28,1,2)
(42, 25, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(42, 26, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(42, 27, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(42, 28, 16, '2025-08-25', 'D', 60.00, 70.00, 'Completed'),
(42, 1, 17, '2026-01-01', 'B', 83.00, 91.00, 'Active'),
(42, 2, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 43 (Program 19)
(43, 25, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(43, 26, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(43, 27, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(43, 28, 17, '2026-01-01', 'B', 84.00, 92.00, 'Active'),
(43, 1, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 44 (Program 20, Dept 7: Courses 25,26,27,28,3,4)
(44, 25, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(44, 26, 17, '2026-01-01', 'B+', 87.50, 93.50, 'Active'),
(44, 27, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(44, 28, 16, '2025-08-25', 'A', 94.50, 97.50, 'Completed'),
(44, 3, 17, '2026-01-01', 'C', 70.00, 80.00, 'Active'),
(44, 4, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 45 (Program 20)
(45, 25, 17, '2026-01-01', 'A', 95.00, 98.00, 'Active'),
(45, 27, 16, '2025-08-25', 'B', 82.00, 90.00, 'Completed'),
(45, 28, 17, '2026-01-01', 'F', 50.00, 65.00, 'Active'),
-- Student 46 (Program 21, Dept 7: Courses 25,26,27,28,1,2)
(46, 25, 16, '2025-08-25', 'B+', 88.00, 94.00, 'Completed'),
(46, 26, 17, '2026-01-01', 'A', 95.00, 98.50, 'Active'),
(46, 27, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(46, 28, 16, '2025-08-25', 'B', 85.00, 92.00, 'Completed'),
(46, 1, 17, '2026-01-01', 'D', 65.00, 75.00, 'Active'),
(46, 2, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 47 (Program 21)
(47, 25, 17, '2026-01-01', 'A', 96.00, 99.00, 'Active'),
(47, 26, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(47, 27, 16, '2025-08-25', 'B+', 89.00, 95.00, 'Completed'),
(47, 28, 17, '2026-01-01', 'C', 75.00, 85.00, 'Active'),
(47, 1, 19, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 48 (Program 22, Dept 8: Courses 29,30,31,32,33,34)
(48, 29, 16, '2025-08-25', 'A', 94.00, 97.00, 'Completed'),
(48, 30, 17, '2026-01-01', 'B+', 87.00, 93.00, 'Active'),
(48, 31, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(48, 32, 16, '2025-08-25', 'A-', 90.00, 95.00, 'Completed'),
(48, 33, 17, '2026-01-01', 'B', 83.00, 91.00, 'Active'),
(48, 34, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 49 (Program 22)
(49, 29, 17, '2026-01-01', 'B+', 88.50, 94.50, 'Active'),
(49, 30, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(49, 31, 16, '2025-08-25', 'A', 95.00, 98.00, 'Completed'),
(49, 32, 17, '2026-01-01', 'D', 62.00, 72.00, 'Active'),
(49, 33, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
-- Student 50 (Program 22)
(50, 29, 16, '2025-08-25', 'A-', 91.00, 96.00, 'Completed'),
(50, 31, 18, '2026-06-15', NULL, NULL, NULL, 'Enrolled'),
(50, 32, 16, '2025-08-25', 'F', 45.00, 60.00, 'Completed');

INSERT INTO ResearchProjects (project_title, principal_investigator_id, department_id, funding_source, funding_amount, start_date, end_date, description, publications, outcomes)
VALUES
-- Dept 1 (Computer Science), Lecturers 1-3
('Advanced AI for Medical Diagnostics', 1, 1, 'NSF Grant', 250000.00, '2023-01-01', '2026-12-31', 'Developing AI models for early disease detection using machine learning.', 'AI Diagnostics Paper (2024), ML in Healthcare (2025)', 'Improved accuracy in diagnostics by 20%.'),
('Quantum Computing Algorithms', 2, 1, 'Government Research Fund', 400000.00, '2024-06-01', NULL, 'Exploring new algorithms for quantum computers.', 'Quantum Algo Review (2025)', 'Breakthrough in error correction techniques.'),
-- Dept 2 (Electrical Engineering), Lecturers 4-6
('Smart Grid Optimization', 4, 2, 'Energy Foundation', 300000.00, '2022-03-01', '2025-03-01', 'Optimizing energy distribution in smart grids.', 'Grid Optimization (2023), Renewable Integration (2024)', 'Reduced energy loss by 15%.'),
('Wireless Communication Systems', 5, 2, 'Tech Industry Grant', 150000.00, '2023-09-01', '2026-09-01', 'Next-gen wireless tech for 6G.', '6G Protocols (2024)', 'Enhanced data transfer speeds.'),
-- Dept 3 (Mechanical Engineering), Lecturers 7-9
('Autonomous Vehicle Design', 7, 3, 'Automotive Partnership', 500000.00, '2021-01-01', '2025-12-31', 'Building self-driving car prototypes.', 'AV Sensors (2022), Control Systems (2023)', 'Successful test drives in simulated environments.'),
('Sustainable Materials Development', 8, 3, 'Environmental Fund', 200000.00, '2024-02-01', NULL, 'Eco-friendly materials for construction.', 'Green Materials (2025)', 'New biodegradable composites created.'),
-- Dept 4 (Biology), Lecturers 10-12
('Gene Editing for Crop Improvement', 10, 4, 'Agriculture Grant', 180000.00, '2023-05-01', '2026-05-01', 'Using CRISPR for better crops.', 'CRISPR Crops (2024)', 'Increased yield in test plants.'),
('Marine Ecosystem Studies', 11, 4, 'Ocean Foundation', 220000.00, '2022-07-01', '2025-07-01', 'Impact of climate on marine life.', 'Ocean Biodiversity (2023)', 'Identified key vulnerable species.'),
-- Dept 5 (Chemistry), Lecturers 13-15
('New Drug Synthesis', 13, 5, 'Pharma Research Fund', 350000.00, '2024-04-01', NULL, 'Synthesizing novel pharmaceuticals.', 'Drug Synthesis (2025)', 'Promising compounds for cancer treatment.'),
('Catalysis for Green Chemistry', 14, 5, 'Environmental Agency', 120000.00, '2023-10-01', '2026-10-01', 'Efficient catalysts for sustainable reactions.', 'Green Catalysts (2024)', 'Reduced waste in chemical processes.'),
-- Dept 6 (Physics), Lecturers 16-18
('Dark Matter Detection', 16, 6, 'Space Agency Grant', 450000.00, '2021-09-01', '2027-09-01', 'Experiments to detect dark matter particles.', 'Dark Matter Review (2023)', 'New detection methods proposed.'),
('Laser Technology Advances', 17, 6, 'Tech Innovation Fund', 280000.00, '2024-01-01', NULL, 'High-power lasers for applications.', 'Laser Applications (2025)', 'Improved precision in manufacturing.'),
-- Dept 7 (Mathematics), Lecturers 19-21
('Cryptography Algorithms', 19, 7, 'Security Grant', 100000.00, '2023-03-01', '2025-03-01', 'Post-quantum cryptography.', 'Crypto Algorithms (2024)', 'Secure against quantum attacks.'),
('Mathematical Modeling of Epidemics', 20, 7, 'Health Foundation', 150000.00, '2022-11-01', '2025-11-01', 'Models for disease spread.', 'Epidemic Models (2023)', 'Predictions used in policy.'),
-- Dept 8 (Business Administration), Lecturers 22-24
('Sustainable Business Practices', 22, 8, 'Corporate Sustainability Fund', 200000.00, '2024-05-01', NULL, 'Strategies for green business.', 'Sustainability Report (2025)', 'Framework adopted by companies.'),
('Digital Marketing Analytics', 23, 8, 'Marketing Association', 130000.00, '2023-08-01', '2026-08-01', 'Data-driven marketing.', 'Digital Analytics (2024)', 'Improved ROI metrics.'),
-- Dept 9 (Economics), Lecturers 25-27
('Global Trade Impacts', 25, 9, 'Economic Policy Institute', 250000.00, '2022-04-01', '2025-04-01', 'Effects of trade policies.', 'Trade Impacts (2023)', 'Policy recommendations.'),
('Behavioral Economics Studies', 26, 9, 'Research Council', 180000.00, '2024-07-01', NULL, 'Human decision-making in economy.', 'Behavioral Studies (2025)', 'New insights on biases.'),
-- Dept 10 (Law), Lecturers 28-30
('Human Rights in Digital Age', 28, 10, 'Legal Foundation', 140000.00, '2023-02-01', '2026-02-01', 'Privacy and rights online.', 'Digital Rights Paper (2024)', 'Legal framework proposed.'),
('International Trade Law', 29, 10, 'Trade Organization', 220000.00, '2022-06-01', '2025-06-01', 'Disputes and agreements.', 'Trade Law Review (2023)', 'Case studies analyzed.'),
-- Dept 11 (History), Lecturers 31-33
('Colonial Legacy Studies', 31, 11, 'Historical Society', 90000.00, '2024-09-01', NULL, 'Impact of colonialism today.', 'Colonial Legacy (2025)', 'Educational resources developed.'),
('World War Archives', 32, 11, 'Archive Fund', 110000.00, '2023-12-01', '2026-12-01', 'Digitizing war documents.', 'WW Archives (2024)', 'Online database created.'),
-- Dept 12 (English Literature), Lecturers 34-36
('Postcolonial Literature Analysis', 34, 12, 'Literary Grant', 80000.00, '2022-05-01', '2025-05-01', 'Themes in postcolonial works.', 'Postcolonial Analysis (2023)', 'New interpretations published.'),
('Digital Humanities in Lit', 35, 12, 'Tech-Lit Fund', 100000.00, '2024-10-01', NULL, 'Using AI for literary analysis.', 'Digital Lit (2025)', 'Tools for scholars developed.'),
-- Dept 13 (Psychology), Lecturers 37-39
('Mental Health Interventions', 37, 13, 'Health Grant', 300000.00, '2023-04-01', '2026-04-01', 'Programs for student wellness.', 'Interventions Paper (2024)', 'Reduced stress levels in trials.'),
('Cognitive Aging Studies', 38, 13, 'Aging Research Fund', 250000.00, '2022-08-01', '2025-08-01', 'Memory decline and prevention.', 'Aging Studies (2023)', 'Strategies for healthy aging.'),
-- Dept 14 (Sociology), Lecturers 40-42
('Urban Inequality Research', 40, 14, 'Social Justice Fund', 160000.00, '2024-03-01', NULL, 'Disparities in cities.', 'Urban Inequality (2025)', 'Policy briefs issued.'),
('Global Migration Patterns', 41, 14, 'Migration Institute', 190000.00, '2023-07-01', '2026-07-01', 'Trends and impacts of migration.', 'Migration Patterns (2024)', 'Data visualizations created.'),
-- Dept 15 (Art and Design), Lecturers 43-45
('Digital Art Innovations', 43, 15, 'Arts Council', 120000.00, '2022-02-01', '2025-02-01', 'VR and AR in art.', 'Digital Art (2023)', 'Exhibitions held.'),
('Sustainable Design Practices', 44, 15, 'Eco-Art Fund', 140000.00, '2024-11-01', NULL, 'Eco-friendly design methods.', 'Sustainable Design (2025)', 'Workshops conducted.');

INSERT INTO ResearchProjectTeamMembers (project_id, lecturer_id, staff_id, student_id, role)
VALUES
-- Project 1 (Dept 1, PI 1): Add lecturer 2, staff 1, students 1-2
(1, 2, NULL, NULL, 'Co-Investigator'),
(1, NULL, 1, NULL, 'Lab Technician'),
(1, NULL, NULL, 1, 'Graduate Student'),
(1, NULL, NULL, 2, 'Research Assistant'),
-- Project 2 (Dept 1, PI 2): Add lecturer 3, staff 2, student 3
(2, 3, NULL, NULL, 'Co-Investigator'),
(2, NULL, 2, NULL, 'IT Support'),
(2, NULL, NULL, 3, 'Graduate Student'),
-- Project 3 (Dept 2, PI 4): Add lecturer 5, staff 3, students 4-5
(3, 5, NULL, NULL, 'Co-Investigator'),
(3, NULL, 3, NULL, 'Engineer'),
(3, NULL, NULL, 4, 'Undergrad Researcher'),
(3, NULL, NULL, 5, 'Assistant'),
-- Project 4 (Dept 2, PI 5): Add lecturer 6, staff 4, student 6
(4, 6, NULL, NULL, 'Co-Investigator'),
(4, NULL, 4, NULL, 'Technician'),
(4, NULL, NULL, 6, 'Graduate Student'),
-- Project 5 (Dept 3, PI 7): Add lecturer 8, staff 5, students 7-8
(5, 8, NULL, NULL, 'Co-Investigator'),
(5, NULL, 5, NULL, 'Designer'),
(5, NULL, NULL, 7, 'Research Assistant'),
(5, NULL, NULL, 8, 'Intern'),
-- Project 6 (Dept 3, PI 8): Add lecturer 9, staff 6, student 9
(6, 9, NULL, NULL, 'Co-Investigator'),
(6, NULL, 6, NULL, 'Lab Assistant'),
(6, NULL, NULL, 9, 'Graduate Student'),
-- Project 7 (Dept 4, PI 10): Add lecturer 11, staff 7, students 10-11
(7, 11, NULL, NULL, 'Co-Investigator'),
(7, NULL, 7, NULL, 'Biologist'),
(7, NULL, NULL, 10, 'Undergrad Researcher'),
(7, NULL, NULL, 11, 'Assistant'),
-- Project 8 (Dept 4, PI 11): Add lecturer 12, staff 8, student 12
(8, 12, NULL, NULL, 'Co-Investigator'),
(8, NULL, 8, NULL, 'Field Technician'),
(8, NULL, NULL, 12, 'Graduate Student'),
-- Project 9 (Dept 5, PI 13): Add lecturer 14, staff 9, students 13-14
(9, 14, NULL, NULL, 'Co-Investigator'),
(9, NULL, 9, NULL, 'Chemist'),
(9, NULL, NULL, 13, 'Research Assistant'),
(9, NULL, NULL, 14, 'Intern'),
-- Project 10 (Dept 5, PI 14): Add lecturer 15, staff 10, student 15
(10, 15, NULL, NULL, 'Co-Investigator'),
(10, NULL, 10, NULL, 'Lab Manager'),
(10, NULL, NULL, 15, 'Graduate Student'),
-- Project 11 (Dept 6, PI 16): Add lecturer 17, staff 11, students 16-17
(11, 17, NULL, NULL, 'Co-Investigator'),
(11, NULL, 11, NULL, 'Physicist'),
(11, NULL, NULL, 16, 'Undergrad Researcher'),
(11, NULL, NULL, 17, 'Assistant'),
-- Project 12 (Dept 6, PI 17): Add lecturer 18, staff 12, student 18
(12, 18, NULL, NULL, 'Co-Investigator'),
(12, NULL, 12, NULL, 'Technician'),
(12, NULL, NULL, 18, 'Graduate Student'),
-- Project 13 (Dept 7, PI 19): Add lecturer 20, staff 13, students 19-20
(13, 20, NULL, NULL, 'Co-Investigator'),
(13, NULL, 13, NULL, 'Mathematician'),
(13, NULL, NULL, 19, 'Research Assistant'),
(13, NULL, NULL, 20, 'Intern'),
-- Project 14 (Dept 7, PI 20): Add lecturer 21, staff 14, student 21
(14, 21, NULL, NULL, 'Co-Investigator'),
(14, NULL, 14, NULL, 'Analyst'),
(14, NULL, NULL, 21, 'Graduate Student'),
-- Project 15 (Dept 8, PI 22): Add lecturer 23, staff 15, students 22-23
(15, 23, NULL, NULL, 'Co-Investigator'),
(15, NULL, 15, NULL, 'Business Analyst'),
(15, NULL, NULL, 22, 'Undergrad Researcher'),
(15, NULL, NULL, 23, 'Assistant'),
-- Project 16 (Dept 8, PI 23): Add lecturer 24, staff 16, student 24
(16, 24, NULL, NULL, 'Co-Investigator'),
(16, NULL, 16, NULL, 'Marketing Specialist'),
(16, NULL, NULL, 24, 'Graduate Student'),
-- Project 17 (Dept 9, PI 25): Add lecturer 26, staff 17, students 25-26
(17, 26, NULL, NULL, 'Co-Investigator'),
(17, NULL, 17, NULL, 'Economist'),
(17, NULL, NULL, 25, 'Research Assistant'),
(17, NULL, NULL, 26, 'Intern'),
-- Project 18 (Dept 9, PI 26): Add lecturer 27, staff 18, student 27
(18, 27, NULL, NULL, 'Co-Investigator'),
(18, NULL, 18, NULL, 'Data Analyst'),
(18, NULL, NULL, 27, 'Graduate Student'),
-- Project 19 (Dept 10, PI 28): Add lecturer 29, staff 19, students 28-29
(19, 29, NULL, NULL, 'Co-Investigator'),
(19, NULL, 19, NULL, 'Legal Assistant'),
(19, NULL, NULL, 28, 'Undergrad Researcher'),
(19, NULL, NULL, 29, 'Assistant'),
-- Project 20 (Dept 10, PI 29): Add lecturer 30, staff 20, student 30
(20, 30, NULL, NULL, 'Co-Investigator'),
(20, NULL, 20, NULL, 'Researcher'),
(20, NULL, NULL, 30, 'Graduate Student'),
-- Project 21 (Dept 11, PI 31): Add lecturer 32, staff 21, students 31-32
(21, 32, NULL, NULL, 'Co-Investigator'),
(21, NULL, 21, NULL, 'Historian'),
(21, NULL, NULL, 31, 'Research Assistant'),
(21, NULL, NULL, 32, 'Intern'),
-- Project 22 (Dept 11, PI 32): Add lecturer 33, staff 22, student 33
(22, 33, NULL, NULL, 'Co-Investigator'),
(22, NULL, 22, NULL, 'Archivist'),
(22, NULL, NULL, 33, 'Graduate Student'),
-- Project 23 (Dept 12, PI 34): Add lecturer 35, staff 23, students 34-35
(23, 35, NULL, NULL, 'Co-Investigator'),
(23, NULL, 23, NULL, 'Literary Analyst'),
(23, NULL, NULL, 34, 'Undergrad Researcher'),
(23, NULL, NULL, 35, 'Assistant'),
-- Project 24 (Dept 12, PI 35): Add lecturer 36, staff 24, student 36
(24, 36, NULL, NULL, 'Co-Investigator'),
(24, NULL, 24, NULL, 'Editor'),
(24, NULL, NULL, 36, 'Graduate Student'),
-- Project 25 (Dept 13, PI 37): Add lecturer 38, staff 25, students 37-38
(25, 38, NULL, NULL, 'Co-Investigator'),
(25, NULL, 25, NULL, 'Psychologist'),
(25, NULL, NULL, 37, 'Research Assistant'),
(25, NULL, NULL, 38, 'Intern'),
-- Project 26 (Dept 13, PI 38): Add lecturer 39, staff 26, student 39
(26, 39, NULL, NULL, 'Co-Investigator'),
(26, NULL, 26, NULL, 'Therapist'),
(26, NULL, NULL, 39, 'Graduate Student'),
-- Project 27 (Dept 14, PI 40): Add lecturer 41, staff 27, students 40-41
(27, 41, NULL, NULL, 'Co-Investigator'),
(27, NULL, 27, NULL, 'Sociologist'),
(27, NULL, NULL, 40, 'Undergrad Researcher'),
(27, NULL, NULL, 41, 'Assistant'),
-- Project 28 (Dept 14, PI 41): Add lecturer 42, staff 28, student 42
(28, 42, NULL, NULL, 'Co-Investigator'),
(28, NULL, 28, NULL, 'Field Researcher'),
(28, NULL, NULL, 42, 'Graduate Student'),
-- Project 29 (Dept 15, PI 43): Add lecturer 44, staff 29, students 43-44
(29, 44, NULL, NULL, 'Co-Investigator'),
(29, NULL, 29, NULL, 'Artist'),
(29, NULL, NULL, 43, 'Research Assistant'),
(29, NULL, NULL, 44, 'Intern'),
-- Project 30 (Dept 15, PI 44): Add lecturer 45, staff 30, student 45
(30, 45, NULL, NULL, 'Co-Investigator'),
(30, NULL, 30, NULL, 'Designer'),
(30, NULL, NULL, 45, 'Graduate Student');

INSERT INTO LecturerPublications (lecturer_id, publication_title, publication_year, publication_type, journal_conference_name, url)
VALUES
-- Lecturer 1
(1, 'Advances in Neural Networks for Image Recognition', 2023, 'Journal', 'Journal of AI Research', 'https://doi.org/10.1234/ai2023'),
(1, 'Ethical Considerations in Machine Learning', 2024, 'Conference', 'ICML Conference', 'https://doi.org/10.1234/icml2024'),
(1, 'Deep Learning Applications in Healthcare', 2022, 'Book Chapter', 'AI in Medicine', 'https://doi.org/10.1234/aimed2022'),
-- Lecturer 2
(2, 'Optimizing Relational Databases for Big Data', 2022, 'Journal', 'Database Management Journal', 'https://doi.org/10.1234/db2022'),
(2, 'Cybersecurity Protocols for IoT Devices', 2025, 'Conference', 'IEEE Security Conference', 'https://doi.org/10.1234/ieee2025'),
(2, 'NoSQL vs SQL: Performance Analysis', 2023, 'Journal', 'Data Science Review', 'https://doi.org/10.1234/ds2023'),
-- Lecturer 3
(3, 'Natural Language Processing Models Evaluation', 2021, 'Conference', 'ACL Conference', 'https://doi.org/10.1234/acl2021'),
(3, 'Sentiment Analysis Using BERT', 2023, 'Journal', 'Computational Linguistics', 'https://doi.org/10.1234/cl2023'),
(3, 'Language Generation Techniques', 2024, 'Book', 'NLP Fundamentals', 'https://doi.org/10.1234/nlp2024'),
-- Lecturer 4
(4, 'Renewable Energy Systems Integration', 2024, 'Journal', 'Energy Journal', 'https://doi.org/10.1234/energy2024'),
(4, 'Circuit Design for High-Efficiency Power', 2022, 'Conference', 'IEEE Power Conference', 'https://doi.org/10.1234/power2022'),
(4, 'Smart Grid Technologies Review', 2023, 'Journal', 'Electrical Engineering Review', 'https://doi.org/10.1234/ee2023'),
-- Lecturer 5
(5, 'Digital Signal Processing in Communications', 2023, 'Conference', 'Signal Processing Symposium', 'https://doi.org/10.1234/sig2023'),
(5, 'Wireless Network Optimization', 2025, 'Journal', 'Communications Journal', 'https://doi.org/10.1234/comm2025'),
(5, 'IoT Security Challenges', 2024, 'Book Chapter', 'IoT Advances', 'https://doi.org/10.1234/iot2024'),
-- Lecturer 6
(6, 'Embedded Systems for Robotics', 2021, 'Journal', 'Robotics Journal', 'https://doi.org/10.1234/rob2021'),
(6, 'Microcontroller Programming Guide', 2024, 'Book', 'Embedded Systems', 'https://doi.org/10.1234/embed2024'),
(6, 'Automation in Manufacturing', 2023, 'Conference', 'Automation Conference', 'https://doi.org/10.1234/auto2023'),
-- Lecturer 7
(7, 'Robot Kinematics and Dynamics', 2022, 'Journal', 'Mechanics Journal', 'https://doi.org/10.1234/mech2022'),
(7, 'Heat Transfer in Engines', 2023, 'Conference', 'Thermodynamics Symposium', 'https://doi.org/10.1234/thermo2023'),
(7, 'Mechatronics Systems Design', 2024, 'Book Chapter', 'Advanced Engineering', 'https://doi.org/10.1234/eng2024'),
-- Lecturer 8
(8, 'Nanomaterials for Energy Storage', 2024, 'Journal', 'Materials Science Journal', 'https://doi.org/10.1234/mat2024'),
(8, 'Composite Materials Testing', 2025, 'Conference', 'Materials Conference', 'https://doi.org/10.1234/matconf2025'),
(8, 'Sustainable Materials in Construction', 2023, 'Journal', 'Sustainability Review', 'https://doi.org/10.1234/sus2023'),
-- Lecturer 9
(9, 'CFD Simulations for Fluid Flow', 2021, 'Conference', 'Fluid Dynamics Conference', 'https://doi.org/10.1234/fluid2021'),
(9, 'Energy Efficiency in Buildings', 2023, 'Journal', 'Energy Efficiency Journal', 'https://doi.org/10.1234/ee2023'),
(9, 'Renewable Energy Technologies', 2024, 'Book', 'Renewable Energy', 'https://doi.org/10.1234/renew2024'),
-- Lecturer 10
(10, 'Gene Editing Techniques', 2022, 'Journal', 'Genetics Journal', 'https://doi.org/10.1234/gen2022'),
(10, 'Biodiversity Conservation Strategies', 2024, 'Conference', 'Ecology Conference', 'https://doi.org/10.1234/eco2024'),
(10, 'Evolutionary Biology Models', 2023, 'Book Chapter', 'Biology Advances', 'https://doi.org/10.1234/bio2023'),
-- Lecturer 11
(11, 'CRISPR Applications in Medicine', 2023, 'Journal', 'Biotech Journal', 'https://doi.org/10.1234/bio-tech2023'),
(11, 'Microbial Genomics Sequencing', 2025, 'Conference', 'Genomics Symposium', 'https://doi.org/10.1234/genom2025'),
(11, 'Synthetic Biology Principles', 2024, 'Book', 'Synthetic Bio', 'https://doi.org/10.1234/synbio2024'),
-- Lecturer 12
(12, 'Ecosystem Modeling Tools', 2021, 'Journal', 'Environmental Science Journal', 'https://doi.org/10.1234/env2021'),
(12, 'Climate Impact Assessments', 2024, 'Conference', 'Climate Conference', 'https://doi.org/10.1234/clim2024'),
(12, 'Conservation Biology', 2023, 'Book Chapter', 'Conservation Guide', 'https://doi.org/10.1234/cons2023'),
-- Lecturer 13
(13, 'Organic Synthesis Methods', 2022, 'Journal', 'Organic Chemistry Journal', 'https://doi.org/10.1234/org2022'),
(13, 'Drug Discovery Processes', 2023, 'Conference', 'Chemistry Conference', 'https://doi.org/10.1234/chemconf2023'),
(13, 'Medicinal Chemistry Advances', 2024, 'Book', 'Med Chem', 'https://doi.org/10.1234/medchem2024'),
-- Lecturer 14
(14, 'Metal Complexes in Catalysis', 2024, 'Journal', 'Inorganic Chemistry Journal', 'https://doi.org/10.1234/inorg2024'),
(14, 'Reaction Kinetics Studies', 2025, 'Conference', 'Kinetics Symposium', 'https://doi.org/10.1234/kin2025'),
(14, 'Nanochemistry Applications', 2023, 'Book Chapter', 'Nano Chem', 'https://doi.org/10.1234/nano2023'),
-- Lecturer 15
(15, 'Quantum Chemistry Calculations', 2021, 'Journal', 'Physical Chemistry Journal', 'https://doi.org/10.1234/physchem2021'),
(15, 'Spectroscopy Techniques', 2023, 'Conference', 'Spectroscopy Conference', 'https://doi.org/10.1234/spec2023'),
(15, 'Theoretical Chemistry Models', 2024, 'Book', 'Theo Chem', 'https://doi.org/10.1234/theo2024'),
-- Lecturer 16
(16, 'Quantum Computing Hardware', 2022, 'Journal', 'Physics Journal', 'https://doi.org/10.1234/phys2022'),
(16, 'Particle Theory Developments', 2024, 'Conference', 'High Energy Physics Conference', 'https://doi.org/10.1234/hep2024'),
(16, 'Nuclear Physics Experiments', 2023, 'Book Chapter', 'Nuclear Guide', 'https://doi.org/10.1234/nuc2023'),
-- Lecturer 17
(17, 'Black Hole Thermodynamics', 2023, 'Journal', 'Astrophysics Journal', 'https://doi.org/10.1234/astro2023'),
(17, 'Galaxy Formation Models', 2025, 'Conference', 'Cosmology Symposium', 'https://doi.org/10.1234/cos2025'),
(17, 'Observational Astronomy Techniques', 2024, 'Book', 'Obs Astro', 'https://doi.org/10.1234/obs2024'),
-- Lecturer 18
(18, 'LHC Data Analysis', 2021, 'Journal', 'Particle Physics Journal', 'https://doi.org/10.1234/part2021'),
(18, 'Detector Design Innovations', 2024, 'Conference', 'Experimental Physics Conference', 'https://doi.org/10.1234/exp2024'),
(18, 'Nuclear Reactions Studies', 2023, 'Book Chapter', 'Exp Physics', 'https://doi.org/10.1234/expphys2023'),
-- Lecturer 19
(19, 'Group Theory in Algebra', 2022, 'Journal', 'Math Journal', 'https://doi.org/10.1234/math2022'),
(19, 'Differential Equations Applications', 2023, 'Conference', 'Applied Math Conference', 'https://doi.org/10.1234/appmath2023'),
(19, 'Applied Mathematics in Engineering', 2024, 'Book', 'App Math', 'https://doi.org/10.1234/app2024'),
-- Lecturer 20
(20, 'Bayesian Statistics Methods', 2024, 'Journal', 'Stats Journal', 'https://doi.org/10.1234/stat2024'),
(20, 'Data Modeling Techniques', 2025, 'Conference', 'Statistics Symposium', 'https://doi.org/10.1234/statsym2025'),
(20, 'ML in Statistics', 2023, 'Book Chapter', 'ML Stats', 'https://doi.org/10.1234/mlstat2023'),
-- Lecturer 21
(21, 'Prime Number Distributions', 2021, 'Journal', 'Number Theory Journal', 'https://doi.org/10.1234/num2021'),
(21, 'Cryptography Algorithms', 2023, 'Conference', 'Crypto Conference', 'https://doi.org/10.1234/crypto2023'),
(21, 'Computational Number Theory', 2024, 'Book', 'Comp Num', 'https://doi.org/10.1234/compnum2024'),
-- Lecturer 22
(22, 'Corporate Finance Strategies', 2022, 'Journal', 'Finance Journal', 'https://doi.org/10.1234/fin2022'),
(22, 'Consumer Behavior Analysis', 2024, 'Conference', 'Marketing Conference', 'https://doi.org/10.1234/mark2024'),
(22, 'Strategic Management Case Studies', 2023, 'Book Chapter', 'Strat Mgmt', 'https://doi.org/10.1234/strat2023'),
-- Lecturer 23
(23, 'Startup Ecosystems Research', 2023, 'Journal', 'Entrepreneurship Journal', 'https://doi.org/10.1234/ent2023'),
(23, 'Venture Capital Trends', 2025, 'Conference', 'Innovation Conference', 'https://doi.org/10.1234/inn2025'),
(23, 'Innovation Management', 2024, 'Book', 'Innov Mgmt', 'https://doi.org/10.1234/innmgmt2024'),
-- Lecturer 24
(24, 'Social Media Marketing', 2021, 'Journal', 'Digital Marketing Journal', 'https://doi.org/10.1234/dig2021'),
(24, 'Branding Strategies', 2024, 'Conference', 'Branding Symposium', 'https://doi.org/10.1234/brand2024'),
(24, 'Market Research Methods', 2023, 'Book Chapter', 'Market Res', 'https://doi.org/10.1234/mkt2023'),
-- Lecturer 25
(25, 'Game Theory in Economics', 2022, 'Journal', 'Econ Theory Journal', 'https://doi.org/10.1234/econ2022'),
(25, 'Labor Economics Models', 2023, 'Conference', 'Econ Conference', 'https://doi.org/10.1234/econconf2023'),
(25, 'Development Economics', 2024, 'Book', 'Dev Econ', 'https://doi.org/10.1234/devecon2024'),
-- Lecturer 26
(26, 'Forecasting Economic Models', 2024, 'Journal', 'Macro Econ Journal', 'https://doi.org/10.1234/macro2024'),
(26, 'Policy Analysis Techniques', 2025, 'Conference', 'Policy Symposium', 'https://doi.org/10.1234/pol2025'),
(26, 'International Trade Theories', 2023, 'Book Chapter', 'Int Trade', 'https://doi.org/10.1234/int2023'),
-- Lecturer 27
(27, 'Decision Making in Economics', 2021, 'Journal', 'Behavioral Econ Journal', 'https://doi.org/10.1234/behav2021'),
(27, 'Experimental Economics Studies', 2023, 'Conference', 'Exp Econ Conference', 'https://doi.org/10.1234/exp2023'),
(27, 'Public Policy Economics', 2024, 'Book', 'Pub Policy', 'https://doi.org/10.1234/pub2024'),
-- Lecturer 28
(28, 'Human Rights Frameworks', 2022, 'Journal', 'Law Journal', 'https://doi.org/10.1234/law2022'),
(28, 'Judicial Review Cases', 2024, 'Conference', 'Legal Conference', 'https://doi.org/10.1234/legal2024'),
(28, 'Legal Theory Advances', 2023, 'Book Chapter', 'Legal Theory', 'https://doi.org/10.1234/legtheory2023'),
-- Lecturer 29
(29, 'Forensic Evidence in Trials', 2023, 'Journal', 'Criminal Law Journal', 'https://doi.org/10.1234/crim2023'),
(29, 'Sentencing Guidelines', 2025, 'Conference', 'Crim Law Symposium', 'https://doi.org/10.1234/crimsym2025'),
(29, 'Criminology Studies', 2024, 'Book', 'Criminology', 'https://doi.org/10.1234/crim2024'),
-- Lecturer 30
(30, 'International Disputes Resolution', 2021, 'Journal', 'Int Law Journal', 'https://doi.org/10.1234/intlaw2021'),
(30, 'Trade Law Agreements', 2024, 'Conference', 'Trade Law Conference', 'https://doi.org/10.1234/trade2024'),
(30, 'Humanitarian Law Principles', 2023, 'Book Chapter', 'Human Law', 'https://doi.org/10.1234/hum2023'),
-- Lecturer 31
(31, 'Roman Empire History', 2022, 'Journal', 'Ancient History Journal', 'https://doi.org/10.1234/anc2022'),
(31, 'Archaeology Methods', 2023, 'Conference', 'Archaeology Conference', 'https://doi.org/10.1234/arch2023'),
(31, 'Cultural Heritage Preservation', 2024, 'Book', 'Cult Heritage', 'https://doi.org/10.1234/cul2024'),
-- Lecturer 32
(32, 'World Wars Analysis', 2024, 'Journal', 'Modern History Journal', 'https://doi.org/10.1234/mod2024'),
(32, 'Colonialism Impacts', 2025, 'Conference', 'History Symposium', 'https://doi.org/10.1234/histsym2025'),
(32, 'Global History Perspectives', 2023, 'Book Chapter', 'Global Hist', 'https://doi.org/10.1234/glob2023'),
-- Lecturer 33
(33, 'Civil Rights Movements', 2021, 'Journal', 'Cultural Studies Journal', 'https://doi.org/10.1234/cult2021'),
(33, 'Identity Politics in Society', 2024, 'Conference', 'Soc Studies Conference', 'https://doi.org/10.1234/soc2024'),
(33, 'Historiography Methods', 2023, 'Book', 'Historiography', 'https://doi.org/10.1234/hist2023'),
-- Lecturer 34
(34, 'Renaissance Literature', 2022, 'Journal', 'Lit Journal', 'https://doi.org/10.1234/lit2022'),
(34, 'Drama Analysis', 2023, 'Conference', 'Lit Conference', 'https://doi.org/10.1234/litconf2023'),
(34, 'Literary Criticism Theories', 2024, 'Book Chapter', 'Lit Crit', 'https://doi.org/10.1234/crit2024'),
-- Lecturer 35
(35, 'Postmodern Novels', 2024, 'Journal', 'Modern Lit Journal', 'https://doi.org/10.1234/modlit2024'),
(35, 'Narrative Theory', 2025, 'Conference', 'Narrative Symposium', 'https://doi.org/10.1234/narr2025'),
(35, 'Creative Writing Techniques', 2023, 'Book', 'Creative Write', 'https://doi.org/10.1234/creat2023'),
-- Lecturer 36
(36, 'Romantic Poetry Analysis', 2021, 'Journal', 'Poetry Journal', 'https://doi.org/10.1234/poet2021'),
(36, 'Modern Verse Forms', 2024, 'Conference', 'Poetry Conference', 'https://doi.org/10.1234/poetconf2024'),
(36, 'Literary Analysis Tools', 2023, 'Book Chapter', 'Lit Analysis', 'https://doi.org/10.1234/anal2023'),
-- Lecturer 37
(37, 'Memory Studies in Psych', 2022, 'Journal', 'Psych Journal', 'https://doi.org/10.1234/psych2022'),
(37, 'Perception Research', 2023, 'Conference', 'Cog Psych Conference', 'https://doi.org/10.1234/cog2023'),
(37, 'Neuroscience Applications', 2024, 'Book', 'Neuro Psych', 'https://doi.org/10.1234/neuro2024'),
-- Lecturer 38
(38, 'Therapy Methods Evaluation', 2024, 'Journal', 'Clinical Psych Journal', 'https://doi.org/10.1234/clin2024'),
(38, 'Mental Health Interventions', 2025, 'Conference', 'Mental Health Symposium', 'https://doi.org/10.1234/ment2025'),
(38, 'Counseling Techniques', 2023, 'Book Chapter', 'Counsel Guide', 'https://doi.org/10.1234/coun2023'),
-- Lecturer 39
(39, 'Group Behavior Analysis', 2021, 'Journal', 'Social Psych Journal', 'https://doi.org/10.1234/socpsych2021'),
(39, 'Attitudes and Change', 2024, 'Conference', 'Social Behavior Conference', 'https://doi.org/10.1234/socbeh2024'),
(39, 'Experimental Psych Methods', 2023, 'Book', 'Exp Psych', 'https://doi.org/10.1234/exppsych2023'),
-- Lecturer 40
(40, 'Social Theory Developments', 2022, 'Journal', 'Sociology Journal', 'https://doi.org/10.1234/soc2022'),
(40, 'Urban Studies Case', 2023, 'Conference', 'Urban Soc Conference', 'https://doi.org/10.1234/urban2023'),
(40, 'Social Change Models', 2024, 'Book Chapter', 'Soc Change', 'https://doi.org/10.1234/change2024'),
-- Lecturer 41
(41, 'Media Impact on Society', 2024, 'Journal', 'Cultural Soc Journal', 'https://doi.org/10.1234/cultsoc2024'),
(41, 'Globalization Effects', 2025, 'Conference', 'Global Soc Symposium', 'https://doi.org/10.1234/glob2025'),
(41, 'Ethnography Methods', 2023, 'Book', 'Ethno Guide', 'https://doi.org/10.1234/ethno2023'),
-- Lecturer 42
(42, 'Class Dynamics in Modern Society', 2021, 'Journal', 'Inequality Journal', 'https://doi.org/10.1234/ineq2021'),
(42, 'Gender Studies Review', 2024, 'Conference', 'Gender Conference', 'https://doi.org/10.1234/gender2024'),
(42, 'Policy Sociology', 2023, 'Book Chapter', 'Policy Soc', 'https://doi.org/10.1234/pol soc2023'),
-- Lecturer 43
(43, 'Visual Communication in Design', 2022, 'Journal', 'Design Journal', 'https://doi.org/10.1234/des2022'),
(43, 'UI/UX Principles', 2023, 'Conference', 'Design Conference', 'https://doi.org/10.1234/desconf2023'),
(43, 'Digital Art Techniques', 2024, 'Book', 'Dig Art', 'https://doi.org/10.1234/digart2024'),
-- Lecturer 44
(44, 'Abstract Art Movements', 2024, 'Journal', 'Fine Arts Journal', 'https://doi.org/10.1234/fine2024'),
(44, 'Installation Art Case Studies', 2025, 'Conference', 'Art Symposium', 'https://doi.org/10.1234/art2025'),
(44, 'Contemporary Art Trends', 2023, 'Book Chapter', 'Cont Art', 'https://doi.org/10.1234/cont2023'),
-- Lecturer 45
(45, 'Digital Sculpture Methods', 2021, 'Journal', 'Sculpture Journal', 'https://doi.org/10.1234/sculp2021'),
(45, 'Materials in 3D Art', 2024, 'Conference', '3D Art Conference', 'https://doi.org/10.1234/3d2024'),
(45, 'Art History Perspectives', 2023, 'Book', 'Art Hist', 'https://doi.org/10.1234/arthist2023');

-- ============================================================================
-- COMMITTEES
-- ============================================================================

INSERT INTO Committees (committee_name, department_id, purpose, meeting_frequency, chair_lecturer_id)
VALUES
('Computer Science Advisory Committee', 1, 'To advise on curriculum development and research directions in CS.', 'Monthly', 1),
('Electrical Engineering Review Board', 2, 'Oversee engineering projects and student progress in EE.', 'Bi-weekly', 4),
('Mechanical Engineering Standards Committee', 3, 'Maintain standards for mechanical designs and safety protocols.', 'Quarterly', 7),
('Biology Research Ethics Committee', 4, 'Review ethical aspects of biological research proposals.', 'Monthly', 10),
('Chemistry Safety Committee', 5, 'Ensure lab safety and compliance in chemistry experiments.', 'Bi-weekly', 13),
('Physics Experimental Oversight Committee', 6, 'Oversee experimental setups and funding for physics labs.', 'Monthly', 16),
('Mathematics Curriculum Committee', 7, 'Develop and update math course curricula.', 'Quarterly', 19),
('Business Administration Executive Committee', 8, 'Strategic planning for business programs.', 'Monthly', 22),
('Economics Policy Review Committee', 9, 'Review economic policies and their impacts on curricula.', 'Bi-weekly', 25),
('Law Faculty Governance Committee', 10, 'Govern law faculty decisions and student affairs.', 'Monthly', 28),
('History Archives Management Committee', 11, 'Manage historical archives and research access.', 'Quarterly', 31),
('English Literature Review Committee', 12, 'Review literary works and program updates.', 'Monthly', 34),
('Psychology Ethics and Standards Committee', 13, 'Ethical review for psychological studies.', 'Bi-weekly', 37),
('Sociology Social Impact Committee', 14, 'Assess social impact of sociological research.', 'Monthly', 40),
('Art and Design Exhibition Committee', 15, 'Organize art exhibitions and design showcases.', 'Quarterly', 43);

INSERT INTO CommitteeMembers (committee_id, lecturer_id, staff_id, role, join_date)
VALUES
-- Committee 1 (Dept 1): Lecturers 2,3; Staff 1,2
(1, 2, NULL, 'Member', '2025-01-01'),
(1, 3, NULL, 'Secretary', '2025-01-01'),
(1, NULL, 1, 'Member', '2025-01-01'),
(1, NULL, 2, 'Member', '2025-01-01'),
-- Committee 2 (Dept 2): Lecturers 5,6; Staff 3,4
(2, 5, NULL, 'Member', '2025-01-01'),
(2, 6, NULL, 'Secretary', '2025-01-01'),
(2, NULL, 3, 'Member', '2025-01-01'),
(2, NULL, 4, 'Member', '2025-01-01'),
-- Committee 3 (Dept 3): Lecturers 8,9; Staff 5,6
(3, 8, NULL, 'Member', '2025-01-01'),
(3, 9, NULL, 'Secretary', '2025-01-01'),
(3, NULL, 5, 'Member', '2025-01-01'),
(3, NULL, 6, 'Member', '2025-01-01'),
-- Committee 4 (Dept 4): Lecturers 11,12; Staff 7,8
(4, 11, NULL, 'Member', '2025-01-01'),
(4, 12, NULL, 'Secretary', '2025-01-01'),
(4, NULL, 7, 'Member', '2025-01-01'),
(4, NULL, 8, 'Member', '2025-01-01'),
-- Committee 5 (Dept 5): Lecturers 14,15; Staff 9,10
(5, 14, NULL, 'Member', '2025-01-01'),
(5, 15, NULL, 'Secretary', '2025-01-01'),
(5, NULL, 9, 'Member', '2025-01-01'),
(5, NULL, 10, 'Member', '2025-01-01'),
-- Committee 6 (Dept 6): Lecturers 17,18; Staff 11,12
(6, 17, NULL, 'Member', '2025-01-01'),
(6, 18, NULL, 'Secretary', '2025-01-01'),
(6, NULL, 11, 'Member', '2025-01-01'),
(6, NULL, 12, 'Member', '2025-01-01'),
-- Committee 7 (Dept 7): Lecturers 20,21; Staff 13,14
(7, 20, NULL, 'Member', '2025-01-01'),
(7, 21, NULL, 'Secretary', '2025-01-01'),
(7, NULL, 13, 'Member', '2025-01-01'),
(7, NULL, 14, 'Member', '2025-01-01'),
-- Committee 8 (Dept 8): Lecturers 23,24; Staff 15,16
(8, 23, NULL, 'Member', '2025-01-01'),
(8, 24, NULL, 'Secretary', '2025-01-01'),
(8, NULL, 15, 'Member', '2025-01-01'),
(8, NULL, 16, 'Member', '2025-01-01'),
-- Committee 9 (Dept 9): Lecturers 26,27; Staff 17,18
(9, 26, NULL, 'Member', '2025-01-01'),
(9, 27, NULL, 'Secretary', '2025-01-01'),
(9, NULL, 17, 'Member', '2025-01-01'),
(9, NULL, 18, 'Member', '2025-01-01'),
-- Committee 10 (Dept 10): Lecturers 29,30; Staff 19,20
(10, 29, NULL, 'Member', '2025-01-01'),
(10, 30, NULL, 'Secretary', '2025-01-01'),
(10, NULL, 19, 'Member', '2025-01-01'),
(10, NULL, 20, 'Member', '2025-01-01'),
-- Committee 11 (Dept 11): Lecturers 32,33; Staff 21,22
(11, 32, NULL, 'Member', '2025-01-01'),
(11, 33, NULL, 'Secretary', '2025-01-01'),
(11, NULL, 21, 'Member', '2025-01-01'),
(11, NULL, 22, 'Member', '2025-01-01'),
-- Committee 12 (Dept 12): Lecturers 35,36; Staff 23,24
(12, 35, NULL, 'Member', '2025-01-01'),
(12, 36, NULL, 'Secretary', '2025-01-01'),
(12, NULL, 23, 'Member', '2025-01-01'),
(12, NULL, 24, 'Member', '2025-01-01'),
-- Committee 13 (Dept 13): Lecturers 38,39; Staff 25,26
(13, 38, NULL, 'Member', '2025-01-01'),
(13, 39, NULL, 'Secretary', '2025-01-01'),
(13, NULL, 25, 'Member', '2025-01-01'),
(13, NULL, 26, 'Member', '2025-01-01'),
-- Committee 14 (Dept 14): Lecturers 41,42; Staff 27,28
(14, 41, NULL, 'Member', '2025-01-01'),
(14, 42, NULL, 'Secretary', '2025-01-01'),
(14, NULL, 27, 'Member', '2025-01-01'),
(14, NULL, 28, 'Member', '2025-01-01'),
-- Committee 15 (Dept 15): Lecturers 44,45; Staff 29,30
(15, 44, NULL, 'Member', '2025-01-01'),
(15, 45, NULL, 'Secretary', '2025-01-01'),
(15, NULL, 29, 'Member', '2025-01-01'),
(15, NULL, 30, 'Member', '2025-01-01');

-- ============================================================================
-- STUDENT ORGANISATIONS
-- ============================================================================

INSERT INTO StudentOrganisations (organisation_name, organisation_type, department_id, president_student_id, description, meeting_day)
VALUES
('Computer Science Coding Club', 'Club', 1, 1, 'Club for coding enthusiasts to collaborate on projects and compete in hackathons.', 'Wednesday'),
('AI Research Society', 'Society', 1, 2, 'Society focused on AI discussions, workshops, and research sharing.', 'Friday'),
('Electrical Engineering Innovation Association', 'Association', 2, 8, 'Association for innovating in electronics and power systems.', 'Tuesday'),
('Robotics Enthusiasts Club', 'Club', 3, 15, 'Club for building and programming robots.', 'Thursday'),
('Biology Field Study Group', 'Group', 4, 22, 'Group organizing field trips and biology experiments.', 'Monday'),
('Chemistry Lab Society', 'Society', 5, 29, 'Society for chemistry experiments and discussions.', 'Wednesday'),
('Physics Astronomy Club', 'Club', 6, 36, 'Club for stargazing and physics experiments.', 'Friday'),
('Mathematics Puzzle Association', 'Association', 7, 42, 'Association solving math puzzles and problems.', 'Tuesday'),
('Business Entrepreneurs Club', 'Club', 8, 48, 'Club for aspiring entrepreneurs and business ideas.', 'Thursday'),
('Economics Debate Society', 'Society', 9, 3, 'Society debating economic policies and theories.', 'Monday'),
('Law Mock Trial Group', 'Group', 10, 23, 'Group practicing mock trials and legal debates.', 'Wednesday'),
('History Heritage Society', 'Society', 11, 26, 'Society exploring historical sites and discussions.', 'Friday'),
('English Literature Book Club', 'Club', 12, 28, 'Club reading and discussing literature.', 'Tuesday'),
('Psychology Mind Matters Association', 'Association', 13, 31, 'Association exploring psychological topics.', 'Thursday'),
('Sociology Social Justice Group', 'Group', 14, 39, 'Group advocating for social issues.', 'Monday'),
('Art and Design Creative Collective', 'Collective', 15, 45, 'Collective for artistic collaborations and exhibitions.', 'Wednesday');

INSERT INTO OrganisationMembers (organisation_id, student_id, role, join_date)
VALUES
-- Organisation 1 (Dept 1): President 1, VP 2, Scribe 3, Members 4-6
(1, 1, 'President', '2025-01-01'),
(1, 2, 'Vice President', '2025-01-15'),
(1, 3, 'Scribe', '2025-02-01'),
(1, 4, 'Member', '2025-02-10'),
(1, 5, 'Member', '2025-03-01'),
(1, 6, 'Member', '2025-03-15'),
-- Organisation 2 (Dept 1): President 2, VP 3, Scribe 4, Members 5-8
(2, 2, 'President', '2025-01-01'),
(2, 3, 'Vice President', '2025-01-15'),
(2, 4, 'Scribe', '2025-02-01'),
(2, 5, 'Member', '2025-02-10'),
(2, 6, 'Member', '2025-03-01'),
(2, 7, 'Member', '2025-03-15'),
(2, 8, 'Member', '2025-04-01'),
-- Organisation 3 (Dept 2): President 8, VP 9, Scribe 10, Members 11-14
(3, 8, 'President', '2025-01-01'),
(3, 9, 'Vice President', '2025-01-15'),
(3, 10, 'Scribe', '2025-02-01'),
(3, 11, 'Member', '2025-02-10'),
(3, 12, 'Member', '2025-03-01'),
(3, 13, 'Member', '2025-03-15'),
(3, 14, 'Member', '2025-04-01'),
-- Organisation 4 (Dept 3): President 15, VP 16, Scribe 17, Members 18-20
(4, 15, 'President', '2025-01-01'),
(4, 16, 'Vice President', '2025-01-15'),
(4, 17, 'Scribe', '2025-02-01'),
(4, 18, 'Member', '2025-02-10'),
(4, 19, 'Member', '2025-03-01'),
(4, 20, 'Member', '2025-03-15'),
-- Organisation 5 (Dept 4): President 22, VP 23, Scribe 24, Members 25-28
(5, 22, 'President', '2025-01-01'),
(5, 23, 'Vice President', '2025-01-15'),
(5, 24, 'Scribe', '2025-02-01'),
(5, 25, 'Member', '2025-02-10'),
(5, 26, 'Member', '2025-03-01'),
(5, 27, 'Member', '2025-03-15'),
(5, 28, 'Member', '2025-04-01'),
-- Organisation 6 (Dept 5): President 29, VP 30, Scribe 31, Members 32-34
(6, 29, 'President', '2025-01-01'),
(6, 30, 'Vice President', '2025-01-15'),
(6, 31, 'Scribe', '2025-02-01'),
(6, 32, 'Member', '2025-02-10'),
(6, 33, 'Member', '2025-03-01'),
(6, 34, 'Member', '2025-03-15'),
-- Organisation 7 (Dept 6): President 36, VP 37, Scribe 38, Members 39-42
(7, 36, 'President', '2025-01-01'),
(7, 37, 'Vice President', '2025-01-15'),
(7, 38, 'Scribe', '2025-02-01'),
(7, 39, 'Member', '2025-02-10'),
(7, 40, 'Member', '2025-03-01'),
(7, 41, 'Member', '2025-03-15'),
(7, 42, 'Member', '2025-04-01'),
-- Organisation 8 (Dept 7): President 42, VP 43, Scribe 44, Members 45-47,1 (wrap for more)
(8, 42, 'President', '2025-01-01'),
(8, 43, 'Vice President', '2025-01-15'),
(8, 44, 'Scribe', '2025-02-01'),
(8, 45, 'Member', '2025-02-10'),
(8, 46, 'Member', '2025-03-01'),
(8, 47, 'Member', '2025-03-15'),
(8, 1, 'Member', '2025-04-01'),
-- Organisation 9 (Dept 8): President 48, VP 49, Scribe 50, Members 1-4 (wrap)
(9, 48, 'President', '2025-01-01'),
(9, 49, 'Vice President', '2025-01-15'),
(9, 50, 'Scribe', '2025-02-01'),
(9, 1, 'Member', '2025-02-10'),
(9, 2, 'Member', '2025-03-01'),
(9, 3, 'Member', '2025-03-15'),
(9, 4, 'Member', '2025-04-01'),
-- Organisation 10 (Dept 9): President 3, VP 4, Scribe 5, Members 6-8
(10, 3, 'President', '2025-01-01'),
(10, 4, 'Vice President', '2025-01-15'),
(10, 5, 'Scribe', '2025-02-01'),
(10, 6, 'Member', '2025-02-10'),
(10, 7, 'Member', '2025-03-01'),
(10, 8, 'Member', '2025-03-15'),
-- Organisation 11 (Dept 10): President 23, VP 24, Scribe 25, Members 26-29
(11, 23, 'President', '2025-01-01'),
(11, 24, 'Vice President', '2025-01-15'),
(11, 25, 'Scribe', '2025-02-01'),
(11, 26, 'Member', '2025-02-10'),
(11, 27, 'Member', '2025-03-01'),
(11, 28, 'Member', '2025-03-15'),
(11, 29, 'Member', '2025-04-01'),
-- Organisation 12 (Dept 11): President 26, VP 27, Scribe 28, Members 29-31
(12, 26, 'President', '2025-01-01'),
(12, 27, 'Vice President', '2025-01-15'),
(12, 28, 'Scribe', '2025-02-01'),
(12, 29, 'Member', '2025-02-10'),
(12, 30, 'Member', '2025-03-01'),
(12, 31, 'Member', '2025-03-15'),
-- Organisation 13 (Dept 12): President 28, VP 29, Scribe 30, Members 31-34
(13, 28, 'President', '2025-01-01'),
(13, 29, 'Vice President', '2025-01-15'),
(13, 30, 'Scribe', '2025-02-01'),
(13, 31, 'Member', '2025-02-10'),
(13, 32, 'Member', '2025-03-01'),
(13, 33, 'Member', '2025-03-15'),
(13, 34, 'Member', '2025-04-01'),
-- Organisation 14 (Dept 13): President 31, VP 32, Scribe 33, Members 34-36
(14, 31, 'President', '2025-01-01'),
(14, 32, 'Vice President', '2025-01-15'),
(14, 33, 'Scribe', '2025-02-01'),
(14, 34, 'Member', '2025-02-10'),
(14, 35, 'Member', '2025-03-01'),
(14, 36, 'Member', '2025-03-15'),
-- Organisation 15 (Dept 14): President 39, VP 40, Scribe 41, Members 42-45
(15, 39, 'President', '2025-01-01'),
(15, 40, 'Vice President', '2025-01-15'),
(15, 41, 'Scribe', '2025-02-01'),
(15, 42, 'Member', '2025-02-10'),
(15, 43, 'Member', '2025-03-01'),
(15, 44, 'Member', '2025-03-15'),
(15, 45, 'Member', '2025-04-01'),
-- Organisation 16 (Dept 15): President 45, VP 46, Scribe 47, Members 48-50
(16, 45, 'President', '2025-01-01'),
(16, 46, 'Vice President', '2025-01-15'),
(16, 47, 'Scribe', '2025-02-01'),
(16, 48, 'Member', '2025-02-10'),
(16, 49, 'Member', '2025-03-01'),
(16, 50, 'Member', '2025-03-15');
