# First lets show all the available semesters
from unittest import result
import re

from DB_Conn.connection import connection_context

def available_semesters():

    query = "select semester_id from semesters"
    results = connection_context(query)

    for row in results:
       print(row)

    return results

available_semesters()
