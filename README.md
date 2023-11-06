# 30DaysDuckDBChallenge

Welcome to my journey in the 30DaysDuckDBChallenge, where I'm diving deep into the FIFA dataset to uncover insights, patterns, and interesting findings using DuckDB.



![duckdb](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/fa9ef6d4-571b-4dc9-8e1b-5373cc48602a)









### Day 1: Account Creation & Installation 

I kicked off the challenge by;

1) Creating an account with Motherduck: https://app.motherduck.com/?auth_flow=signup

2) Installed DuckDB on my Local machine: https://duckdb.org/docs/guides/sql_editors/dbeaver.html

3) Installed Power BI on my computer and configured it: https://powerbi.microsoft.com/en-us/downloads/

### Day 2: Data Loading, Database creation and Access

For day 2 of the challenge, the following were done;

1) Database Creation: I created a DuckDB database named "challenge"
   
2) Database Access: I integrated and accessed the DuckDB database on Motherduck, which serves as our collaborative platform (md:my_db?motherduck_token=)
   
3) Data Loading: I loaded the provided CSV files into the DuckDB database.

   #### SQL Queries
   
  ```sql
 
---Table 1
CREATE TABLE fifa21_player AS
SELECT * FROM read_csv_auto('C:\Users\USER\Desktop\fifa21_raw_data.csv', ALL_VARCHAR=TRUE);

---Table 2
CREATE TABLE fifa21_player2 AS 
SELECT * FROM read_csv_auto('C:\Users\USER\Desktop\fifa21 raw data v2.csv', SAMPLE_SIZE=-1);
```

### Day 3-6: Data Cleaning

On this day, I did some data-cleaning tasks using SQL, DuckDB, and MotherDuck.

Below are the tasks and an explanation of how they were executed;

TASK 1: For the 'Height' column, make sure to extract the numerical value (e.g., 6'0" becomes 6). For the 'Weight' column, remove the "lbs" and convert it to a numerical format.

To transform the Height column to the numeric format, I used SQL Query to extract the first character (e.g. '6') and cast it as an integer, creating a clean and structured 'Height' column.
The Weight Column, here's how I did it; 
- I've converted the weight into a decimal format first.
- I rounded it to the nearest whole number, then.
- Finally, I removed "lbs" and cast the result as an integer.


TASK 2: The 'Value' column has values like '€100M' (which means 100 million) and '€10K' (which means 10,000). Strip the symbols ('€', 'M', 'K') and convert the values to actual numbers accordingly. The same applies ‘Wage’ and ‘Release clause’ columns. 

In doing this, I used a smart approach with a CASE statement to handle the 'Value,' 'Wage,' and 'Release Clause' columns.
Here's how I did it:
- I first checked the last character of each value to determine if it's in millions ('M') thousands ('K') or neither.
- If it was in millions ('M'), I removed the '€' and 'M,' converted the result to a numeric format, and multiplied it by 1,000,000 to get the actual number.
- If it was in thousands ('K'), I followed the same process, replacing '€' and 'K,' converting to a numeric format, and multiplying by 1,000.
- If it had no 'M' or 'K,' I simply removed the '€' and cast it as numeric.

TASK 3: Remove the 'star' character from columns where it appears and make sure the columns are in numerical format.
I focused on columns such as 'W', 'F', 'SM', and 'IR' in this case. 
Here's how I accomplished it: 
- I removed the "star" feature from these columns with a simple approach. 
- The update involved finding instances of ' * ' and replacing them with two spaces (' '). 
-  In addition, I made sure that the cleaned data was in a numerical format. 
- I applied this transformation to the 'W/F,' 'SM,' and 'IR' columns where necessary.

### Additional Tasks

- I also converted the 'Hits' column to a numerical format, making it useful for analysis. 
- In table fifa21_player, the 'Team & Contract' column had some show/hide signs. I removed them and then separated the 'Team' from ‘Contract’, I went further by renaming the 'Team' column as the ‘Club’ column for clarity. The purpose of doing this was to make sure that both tables I am using have the same column names. 

See [Text_query for day 3 to 6 Challenge.sql](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/d1d4da754f6b9596b20859f1f58a474102bfc7a5/Text_query%20for%20day%203%20to%206%20challenge.sql) for the queries
## Day 7: Tackled Some Questions

For Day 7 of the Challenge, I am to focus on some questions.

Below are the questions:

Question 1: Identify players who possess high value but receive relatively low wages.

Question 2: Determine the count of players available in the dataset for each position.

Question 3: Find out which club has the largest representation of players in the dataset.

Question 4: List the top 10 players with the highest OVA and POT values.

For SQL Queries used see [Queries for Day 7 challenge.sql](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/351f33ea849241ccfd4eb8330910a68b34074871/Queries%20for%20Day%207%20challenge.sql)

## Day 8 and 9: Tackled Some Questions (2)

I examined the FIFA datasets thoroughly for these two days, with a keen focus on extracting valuable information. The aim was to answer five key questions:

1. Find players with the highest OVA and POT within each club

2. Calculate the average OVA for players under 25 years old and over 30 years old in each club
 
3. List the players who have the same age within each club

4. Find the player with the highest POT for each nationality

5. Rank players by their OVA in descending order within each club
   
To view my approaches and findings, check the [DAY 8 & 9 READ.Me](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/a6df7c9de3ffd4a50437930ab47833b14cd54257/Day%208%20%26%209%20README.md)

## Day 10 and Beyond

Starting from Day 10, I will continue my journey by diving deeper into the FIFA dataset. Here's what you can expect in the upcoming days:

- Data Visualization: Creating insightful plots and graphs to visualize the data.
- Findings and Recommendations

Stay tuned as I explore and analyze the FIFA dataset using DuckDB. I'll be sharing my code, findings, and insights as I progress through the challenge. Feel free to join me in this exciting journey of data exploration and analysis!

**Note:** I'll continuously update this documentation as I make progress in the "30DaysDuckDBChallenge.
