## 1. Create a dataframe from list

## Write a solution to create a DataFrame from a 2D list called student_data. This 2D list contains the IDs and ages of some students. The DataFrame should have two columns, student_id and age, and be in the same order as the original 2D list.

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

# Call the createDataframe function with student_data and store the result in df
df = createDataframe(student_data)
print(df)
```

## 2. Get the size of a dataframe

Write a solution to calculate and display the number of rows and columns of players.
Return the result as an array:

```ruby
# df_players is the DataFrame

print(df_players.shape)
# Extract the number of rows and columns from the shape tuple
num_rows, num_columns = df_players.shape
print(f"This DataFrame contains {num_rows} rows and {num_columns} columns.")
```

## 3. Display the first 3 rows

Write a solution to display the first 3 rows of this DataFrame.

```ruby
import pandas as pd

def selectFirstRows(employees: pd.DataFrame) -> pd.DataFrame:
    return employees.head(3)
```

## 4. Select data

Write a solution to select the name and age of the student with student_id = 101.

```ruby
import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    return students.query('student_id == 101')[['name', 'age']]
```

## 5. Create a new column

A company plans to provide its employees with a bonus.
Write a solution to create a new column name bonus that contains the doubled values of the salary column.

```ruby
import pandas as pd

def createBonusColumn(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = employees['salary'] * 2
    return employees
```
