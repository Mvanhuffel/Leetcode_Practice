## 1. Create a dataframe from list

Write a solution to create a DataFrame from a 2D list called student_data. This 2D list contains the IDs and ages of some students.
The DataFrame should have two columns, student_id and age, and be in the same order as the original 2D list.

```ruby
import pandas as pd
from typing import List

student_data = [
  [1, 15],
  [2, 11],
  [3, 11],
  [4, 20]
]

# Define a function createDataframe that takes student_data as input
def createDataframe(student_data: List[List[int]]) -> pd.DataFrame:
    # Define column names for the DataFrame
    column_names = ['student_id', 'age']
    # Create a DataFrame using the provided data and column names
    result = pd.DataFrame(student_data, columns=column_names)
    # Return the resulting DataFrame
    return result

# Call the createDataframe function with student_data and store the result in df
df = createDataframe(student_data)
print(df)
```
Output:
```
   student_id  age
0           1   15
1           2   11
2           3   11
3           4   20
```


## 2. Get the size of a dataframe

Write a solution to calculate and display the number of rows and columns of players.
Return the result as an array:

```ruby
# df_players is the DataFrame

# Calculate the shape (number of rows and columns) of the DataFrame and print it
print(df_players.shape)
# Extract the number of rows and columns from the shape tuple
num_rows, num_columns = df_players.shape
print(f"This DataFrame contains {num_rows} rows and {num_columns} columns.")
```
Output:
```
(10, 5)
This DataFrame contains 10 rows and 5 columns.
```
