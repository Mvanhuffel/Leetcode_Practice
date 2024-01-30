# Create a dataframe from list
"""
Write a solution to create a DataFrame from a 2D list called student_data. 
This 2D list contains the IDs and ages of some students. The DataFrame should have two columns, student_id and age, and be in the same order as the original 2D list.
"""

import pandas as pd
from typing import List

student_data = [
  [1, 15],
  [2, 11],
  [3, 11],
  [4, 20]
]

def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    column_names = ['student_id', 'age']
    result = pd.DataFrame(student_data, columns=column_names)
    return result

df = createDataframe(student_data)
print(df)


# Get the size of a dataframe
"""
Write a solution to calculate and display the number of rows and columns of players.
Return the result as an array:
"""

print(df_players.shape)
num_rows, num_columns = df_players.shape
print(f"This DataFrame contains {num_rows} rows and {num_columns} columns.")


# Display the first 3 rows
"""
Write a solution to display the first 3 rows of this DataFrame.
"""

import pandas as pd

def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)


# Select data
"""
Write a solution to select the name and age of the student with student_id = 101.
"""

import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    return students.query('student_id == 101')[['name', 'age']]


# Create a new column
"""
A company plans to provide its employees with a bonus.
Write a solution to create a new column name bonus that contains the doubled values of the salary column.
"""

import pandas as pd

def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = employees['salary'] * 2
    return employees

# Drop duplicated rows
"""
There are some duplicate rows in the DataFrame based on the email column.
Write a solution to remove these duplicate rows and keep only the first occurrence.
"""

def dropDuplicateEmails(customers: pd.DataFrame) -> pd.DataFrame:
    customers = customers.drop_duplicates(subset='email', keep='first')
    return customers

# Drop missing data
"""
There are some rows having missing values in the name column.
Write a solution to remove the rows with missing values.
"""

def dropMissingData(students: pd.DataFrame) -> pd.DataFrame:
    students = students.dropna(subset='name')
    return students

# Modify columns
"""
A company intends to give its employees a pay rise.
Write a solution to modify the salary column by multiplying each salary by 2.
"""

def modifySalaryColumn(df: pd.DataFrame) -> pd.DataFrame:
  df['salary'] *= 2
  return df

# Rename columns
"""
Write a solution to rename the columns as follows:
    id to student_id
    first to first_name
    last to last_name
    age to age_in_years
"""

def renameColumns(students: pd.DataFrame) -> pd.DataFrame:
    students.columns = ['student_id', 'first_name', 'last_name', 'age_in_years']
    return students

# Change data type
"""
The grade column is stored as floats, convert it to integers.
"""

def changeDatatype(students: pd.DataFrame) -> pd.DataFrame:
    students['grade'] = students['grade'].astype(int)
    return students

# Fill missing data
"""
Write a solution to fill in the missing value as 0 in the quantity column.
"""

def fillMissingValues(products: pd.DataFrame) -> pd.DataFrame:
    products['quantity'] = products['quantity'].fillna(0)
    return products
