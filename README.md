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



## Day 10: Learn Github

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


![fifa21 dashboard- Day 11   12](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/e39c8251-350b-4516-a80c-7d27ce9f25c8)












I have learned a great deal in Power BI about data visualization, understanding the import, cleaning and merging of datasets with ease from this challenge. Also, this experience has strengthened my confidence in the use of Power BI as a powerful tool for impactful storytelling and decision making.
You can view the Power BI Project files [Here](https://github.com/Boseh-coder/30DaysDuckDBChallenge/tree/c86c6491d410f44589332c4ef9b81aa75e585dbc/Dashboard%20Visualization%20for%20Fifa%2021-%20Day%2011%20%26%2012)



## Day 13 and 14: Read "DuckDB in Action" Book & Uploaded the "Titanic" datasets






![Duckdb book image](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/75f12e9c-2e23-4226-89ba-d7758743e9d8)













So, let's get the story straight. I dove headfirst into "DuckDB in Action," and let me tell you, it's been an eye-opener. The book began with a clear introduction to DuckDB, what it is, and what it's capable of. No beating around the bush, straight to the good stuff.

First things first, DuckDB is a data analytics powerhouse. Whether it is performing CLI operations, working with cloud data pipelines or programming in Python, it seamlessly fits into pipelines. The flexibility is top-notch; it handles local or remote files in formats like CSV, JSON, Parquet, and Arrow. Not to mention, it plays well with databases like MySQL, SQLite, and Postgres.

DuckDB's vectorized query engine is one of the most impressive features. This engine makes data analysis lightning-fast and cost-effective. The book emphasized its efficiency in accessing data directly from different sources, eliminating the need to copy data over the wire. And guess what? DuckDB isn't picky about where it hangs out. Linux, Windows, MacOS – it's the friend that fits in anywhere. So DuckDB will always be there for you, no matter what your operating system is.

The book walked me through practical scenarios, outlining when to leverage DuckDB and when to think twice. The book made a complete list for someone like myself who's interested in data structures. It also gave me tools to efficiently navigate DuckDB, and even included the most commonly used Dot commands.

Now, let's talk queries. It's easy to perform SQL queries, whether you are configuring it in the CLI or embedding it into your Python app. I was walked through a number of DML queries and clauses, such as JOIN and WITH, by the book, with examples that made it easy to understand.

The next task was uploading of Titanic dataset onto DuckDB. After I have my Titanic datasets onto DuckDB. I noticed the train.csv, contains subset of 891 passengers, and test.csv with 418. A quick heads up - the "Survived" column is missing in test.csv.

The next task was to upload the "Titanic datasets" onto DuckDB. After I've uploaded the Titanic datasets to DuckDB. I saw that train.csv contains a subset of 891 passengers, as well as test.csv with 418. A quick heads up - the "Survived" column is missing in test.csv.

But you know what they say, the devil is in the details. And I made sure to acquaint myself with every nook and cranny of those datasets. Data descriptions became my best friends.
The devil is in the details, you know what they say. I tried to familiarize myself with every corner and cranny of these data sets. 

And here's the deal - DuckDB isn't just a tool; it's a mindset shift. It's about making data analysis faster, simpler, and more cost-effective. The book didn't just throw information at me; it showed me how to make DuckDB work for me, in my projects, and with my datasets.

As I navigate the Titanic dataset in DuckDB, I'm excited about the discoveries waiting to unfold. Stay tuned for more updates as I uncover insights from the data seas! 

Here's the point: DuckDB is not just a tool; it's a mind shift. It's about making data analysis faster, simpler, and more cost-effective. The book didn't just throw information at me; it showed me how to make DuckDB work for me, in my projects, and with my datasets. I'm excited about the discoveries that await me in DuckDB, as I go through the massive dataset for the Great Ship. 

## Day 15 and 16: Learned Advanced SQL techniques

The task for this day was to watch some YouTube tutorials on advanced SQL techniques

I've successfully wrapped up the first phase of the 30DaysDuckDBChallenge, where I honed my SQL skills using FIFA 21 datasets. Now, I am embarking on the next phase where I'll be immersing myself in Advanced SQL techniques using the Titanic datasets.

In preparation for the Titanic dataset analysis, I delved into some YouTube tutorials that were given for this task. From Alex the Analyst's breakdown of Subqueries to Matador Software, Kenneth Troung's guide on Creating Buckets in SQL with NTILE Window Functions, and Toufiq's insights into Subquery in SQL and using the WITH Clause.

What I've Learned:
1) Various types of subqueries and also learned how to integrate them seamlessly into SQL queries.
2) Learned how to utilize NTILE window functions to craft impactful data buckets.
3) How to write SQL queries using the elegant WITH clause.

With what I've learned, I'm now equipped to apply these advanced SQL techniques to the Titanic dataset I'll be exploring.
Click [Here](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/b3227c3b07840a9d9f5f13cbe96afd9aadaa4176/Advanced%20SQL%20Techniques%20Summary.pdf) to see a summary of what i have learnt

## Day 17 and 18 : Analysed Titanic Datasets

Still on #30DaysDuckDBChallenge, like I said in my last post, I’m moving on to the next phase of this challenge, where I'll be immersing myself in Advanced SQL techniques using the Titanic datasets. Now it is time to apply what I’ve learnt from those YouTube tutorials to tasks given.

TASKS: Analyze the Titanic dataset with the questions given (you see the slide for this questions)

The Titanic disaster, one of history's most tragic maritime catastrophes, continues to captivate and inspire research into the factors that determined the fate of its passengers. For Day 17 & 18 of the challenge, I embarked on a data-driven exploration of the Titanic dataset.

### Below are my steps & Insights:

I commenced by merging the "train" and "test" datasets into a comprehensive "Titanic_Analysis" table. Leveraged "Gender_submission" dataset to enrich survival details in the analysis.

#### Fare & Survival Rates:

I analyzed survival rates based on fare and discovered a positive correlation. As fare amounts increased, so did the likelihood of survival. This finding suggests that passengers who paid higher fares had access to a better medical care, lifeboats and prioritization during the evacuation process.

#### Gender Disparities:

My analysis of survival rates based on sex revealed a stark disparity between males and females. I found that females had a significantly higher survival rate of 82.62%, compared to males with a survival rate of 12.93%. This difference can be attributed to the prioritization of women in the boarding of lifeboats.

#### Age & Survival Correlation:

I explored the relationship between survival and age and discovered a correlation. I observed that as age increased, the survival rate decreased. Children had the highest survival rates, followed by younger adults. This trend is likely due to the prioritization of women and children, the physical fitness of younger individuals, and the vulnerability of older adults to the cold and exposure.
This task enhanced my SQL skills and emphasized the importance of exploring data to uncover valuable insights in a straightforward and understandable way.

For the SQL Queries Click [Here](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/c9e576f8f2989f1f4d663982ff961a889499ca64/Day17%20%26%2018%20queries.sql)

## Day 19 and 20 : Analysis on Survival rates
Embarking on Day 19 and 20 of the 30DaysDuckDBChallenge, I immersed myself in the Titanic dataset. Some Questions were given for analysis, and below are the steps I took, along with my findings.

Question 1: Understanding Titles and Survival Rates 

Objective: Explore the relationship between passenger titles and their survival rates. 

Steps: 

a. Identify unique titles in the dataset. 

b. Consolidate infrequent titles into broader categories (e.g., Mr, Mrs, Miss, Master). 

c. Calculate and analyze survival rates for each title grouping.


### STEPS  I TOOK:

I started by identifying the unique titles in the dataset. This is important because I want to know what titles are present in the data before I consolidate them into broader categories. I did this by using a SELECT DISTINCT query to select the distinct values of the Title column. The query also uses a CASE statement to categorize titles into the following categories:

•	Master

•	Miss

•	Mrs.

•	Mr.

•	Other (which comprises of Dr, Rev, Col, Countess, Mlle, Ms. Etc.)

Once I had identified the unique titles in the dataset, I consolidated the infrequent titles into broader categories. I did this by creating a new column in the Titanic_dataset table called “Title”. I then populated this column with the title categories that I identified in Step 1. I used several CASE statements to categorize titles based on specific patterns in the Name column.

I categorized any name containing the terms "Master", "Miss", “Mr.”, or "Mrs." into the corresponding title category. I also categorized any name containing the terms "Ms.", "Don", "Rev.", "Major", "Countess", "Col", "Capt.", "Jonkheer" to mention but few that is found under the other category into the "Master", "Miss", “Mr.”, and "Mrs.” title category where it applies. I also handled the case of "Dr." differently based on the passenger's sex.

This process of consolidating infrequent titles into broader categories helps to reduce the dimensionality of the data and makes it easier to analyze the relationship between titles and survival rates.

C. Calculate and analyze survival rates for each title grouping.




![Sol 1](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/a303355d-955e-4470-8c6f-8345235f18c2)










Findings: 
This analysis shows that women had a much higher chance of surviving the sinking than men. This is because women and children were given priority when boarding the lifeboats.
The survival rate for women with the title "Mrs." was the highest, at 87%. This means that about 87 out of every 100 women with this title survived the sinking. The survival rate for women with the title "Miss" was also very high, at 79%.
Children, who were often given the title "Master," had a survival rate of 37%. This means that about 37 out of every 100 children survived the sinking.
The survival rate for men was much lower, at 11%. This means that only about 11 out of every 100 men survived the sinking

Question 2: calculate the survival based on being a woman or a child 

Objective: Evaluate the insights gained from a binary feature flagging passengers as women/children or adult men.








![Sol  2](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/4527ab3e-8326-4936-89ee-44ea3ab445ae)









Findings:
This analysis revealed shows that there is a significant difference in survival rates between women/children and adult men. Women/children had a significantly higher survival rate of 50.6% compared to 17.5% for adult men. This can be attributed to the "women and children first" policy, which prioritized their boarding of lifeboats. Additionally, women had an even higher survival rate of 85.1%, likely due to traveling with children and the perceived vulnerability of younger passengers.









Click [Here](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/e7dbdaf5cb653c278384a3e930aaa07850b422ba/Day%2019%20%26%2020%20queries.sql) to see the queries used for this analysis.







## Day 21 - 23 : Deep Dive into the Titanic Passengers

For the Day 21 to 23 of the 30daysduckdbchallenge, the following tasks were to be carried out;

Task 1: Survival based on Cabin Level

Write an SQL query to display the number of passengers, their survival rate, and the cabin level they belong to. The assumption here is that the same ticket number defines passengers traveling together. Please consider this assumption while formulating your query.

Task 2: Solo Travelers, Family Travelers, and Mix Group

Using SQL, categorize passengers into solo travelers, those traveling with a family, and those in a mixed group. The assumption for this task is based on ticket number and surname extracted from the original Name feature. If an individual is the only passenger attached to a ticket, consider them a solo traveler. Please assume that families may have other members on different tickets.

Task 3: Family Size Calculation

Write an SQL query to determine the family size for each passenger. The assumption for family size calculation is to add SibSp, ParCh, and the current passenger (+1). However, this is determined at the maximum family size based on ticket number and surname. Assume that families traveled together on the same ticket. Use a mapping SQL subquery to match the sum of SibSp, ParCh, and the current passenger with the family size, considering the same ticket number and surname.

Assumption Metrics were also given for these tasks;

Task 1: Same ticket number defines passengers traveling together.

Task 2: Solo travelers if the individual is the only passenger attached to a ticket.

Task 3: Family size is calculated by adding SibSp, ParCh, and the current passenger (+1) but determined at the maximum family size based on ticket number and surname.

Using SQL, I was able to extract valuable insights about the passengers and their travel circumstances. Here are the key steps I took:

In Task 1, I crafted an SQL query to explore the survival dynamics based on cabin levels, factoring in the assumption that passengers sharing the same ticket were traveling together. By aggregating data on non-null cabin entries, I derived key metrics such as total passengers, survived count, and survival rate, providing insights into the correlation between cabin levels and survival.

In Task 2, I initiated the process by enhancing the dataset with a new 'Surname' column. Extracting surnames through a strategic update, I then classified passengers into solo travelers, family travelers, or those in mixed groups. Leveraging ticket information and family-related parameters, this segmentation enriched our understanding of diverse passenger compositions.

Task 3 unfolded in two stages: I introduced a 'FamilySize' column, calculating it by summing SibSp, ParCh, and the current passenger (+1). Then, by determining the maximum family size based on ticket number and surname, I contextualized family structures. 

Click [Here](https://github.com/Boseh-coder/30DaysDuckDBChallenge/blob/2125572c2742cf1c9763c306ffd9d85748c62313/Queries%20for%20day%2021%20to%2023%20challenge.sql) to see the queries used for this analysis.

## Day 24 and Beyond

Starting from Day 24, I will continue my journey by diving deeper into the TITANIC dataset. Here's what you can expect in the upcoming days:
- Analysis
- Power BI Visualization
- Findings and Recommendations
- Conclusions
- Presentation

Stay tuned as I explore and analyze the TITANIC dataset using DuckDB. I'll be sharing my code, findings, and insights as I progress through the challenge. Feel free to join me in this exciting journey of data exploration and analysis!

**Note:** I'll continuously update this documentation as I make progress in the "30DaysDuckDBChallenge.
