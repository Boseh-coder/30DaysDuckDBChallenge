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

See [Queries for day 3 to 6 Challenge.sql](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/d1d4da754f6b9596b20859f1f58a474102bfc7a5/Text_query%20for%20day%203%20to%206%20challenge.sql) for the queries
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
   
For the SQL Queries used, check the [Queries for Day 8 and 9 challenge](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/6b0c139bb173a7a987ea1540e5d63879dd607414/Queries%20for%20day%208%20and%209.sql)



## Day 10: Learnt Github

As part of the 30DaysDuckDBchallenge, I aimed to learn how to use GitHub, create a repository, and organize my daily tasks into individual SQL files.
Early on, I made a mistake by adding my SQL code using Markdown formatting in a README.md file instead of saving it in SQL files. In order to correct my mistakes, I began by researching how to use GitHub effectively.

After I had finished watching the YouTube videos on Github, I was able to correct my mistakes by taking the necessary steps below;

- I started by creating a GitHub repository named "30DaysDuckDBchallenge." This would be the place where I could organize and store my SQL files.

- To interact with GitHub from my command line, I needed a personal access token. I created one and named it "My CLI Token." I made sure to copy and securely save this token for later use.

- Next, I downloaded Git Bash, an application that would serve as my command line interface for working with Git on my computer.

- I proceeded by cloning the "30DaysDuckDBchallenge" repository from GitHub to my local computer. This automatically copied the repository's contents into an empty folder that I had prepared. I confirmed the location by using the 'ls' command.

- To correct my earlier mistake, I needed a text editor. I downloaded and installed "Atom," which allowed me to write out my SQL queries. I made sure to save them as SQL files in the folder where I had cloned the repository.

- To ensure that my SQL files were recognized by Git, I used the git status command. This helped me confirm that the SQL files were indeed tracked.

- I used the ' git add .' command to stage the SQL files for committing. This told Git that I wanted to include these files in my next commit. After that, I made a commit with a meaningful message using the 'git commit -m "my changes" command.

- Before I could push my changes to the GitHub repository, I needed to identify myself. I connected to my GitHub account using the personal access token I had created earlier. With authentication in place, I used the 'git push' command to send my recent commit to my GitHub repository, effectively correcting the mistakes I had made earlier.


## Day 11 and 12: Power BI Visualization
As part of the #30DaysDuckDBChallenge, I'm to create an interactive visualization by using Power BI with the given Fifa datasets.

Let me walk you through the tasks and my approach to them:

#### Tasks Given:
- In Power BI, import the two pre-cleaned datasets from DuckDB.
- Perform any necessary data cleaning and transformation within Power.
- Combine the two datasets using a common column.

- Visualizations and Dashboard:
  
Task 1: Nationality Distribution: Create a bar chart that displays the distribution of players' nationalities.

Task 2: Age vs. Potential: Build a scatter plot that explores the relationship between a player's "Age" and "POT" (potential).Add a trendline to visualize the trend between age and potential.

Task 3: Player Position Analysis: Generate a pie chart showing the distribution of player positions .

Task 4: Top Players by Overall Rating: Create a table that lists the top players based on their "OVA" (overall rating) in descending order.

- Dashboard: Interactive dashboard creation with slicers and filters.

#### My Steps:
- Exported Fifa dataset as CSV files from DuckDB.
- Imported the datasets as CSV files into Power BI
- Handled data cleaning in Power BI via Power query editor, converting text to numbers and dates.
- Merged the two datasets with Append Queries as one.
- Crafted an engaging dashboard with interactive elements.

#### Insights:

1) England leads with 1,705 occurrences of Nationality, followed by Germany and Spain.

2) Player potential peaks at 28, declining at 42. Younger players exhibit higher potential.

3) For the position analysis; CB (28.48%), GK (24.2%), ST (21.75%), CM (9.27%) lead the positions.
   
4) Lionel Messi claims the highest Overall Rating of 93.

I have learned a great deal in Power BI about data visualization, understanding the import, cleaning and merging of datasets with ease from this challenge. Also, this experience has strengthened my confidence in the use of Power BI as a powerful tool for impactful storytelling and decision making.

## Day 13 and Beyond

Starting from Day 13, I will continue my journey by diving deeper into the FIFA dataset. Here's what you can expect in the upcoming days:
- Findings and Recommendations
- Conclusions
- Presentation

Stay tuned as I explore and analyze the FIFA dataset using DuckDB. I'll be sharing my code, findings, and insights as I progress through the challenge. Feel free to join me in this exciting journey of data exploration and analysis!

**Note:** I'll continuously update this documentation as I make progress in the "30DaysDuckDBChallenge.
