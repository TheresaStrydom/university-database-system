# university-database-system
University Record Management System - Database Connection Assignment

## Requirements
To run this application, you need Python 3.10+ installed.<br>
The following libraries are required:<br>
- mysql-connector-python -for SQL injection mitigation<br>
- psutil - for Performance testing<br>
- pytest - for Automatic testing run<br>
MySQL Server is required to storing and managing application data. <br>

## Installation

Step 1: Clone or extract the project folder.

Step 2: Open a terminal in the project directory.

Step 3: install dependencies via below prompt in the IDE Terminal:<br>
`pip install -r requirements.txt`

## Database Setup

Step 1 : Open MySQL Workbrench

Step 2:  Import schema from below file <br>
`data/Create_Tables.sql`

Setp 3 :  Import data from below file <br>
`data/Populate_Tables.sql`

## Run the application 

Run the application as below prompt:<br>
`python interface.py`
<br>

## Automatic Testing
1. Run the following command in the terminal to run all testing scripts in one-go.<br>
`python -m pytest -v`- Run all the testing scripts in summary<br>
`python -m pytest -s`- Running all testing with printed content<br>
<br>
1. The result will be displayed in terminal when test completed.<br>

