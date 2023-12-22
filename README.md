# 30DaysDuckDBChallenge




![duckdb](https://github.com/Boseh-coder/30DaysDuckDBChallenge/assets/93943729/fa9ef6d4-571b-4dc9-8e1b-5373cc48602a)





## Introduction

Embarking on the 30DaysDuckDBChallenge, I dived into the FIFA and Titanic datasets, leveraging DuckDB, SQL, and Power BI to extract insights and enhance data analysis skills. This journey involved tasks ranging from basic SQL operations to advanced techniques, GitHub integration, and data visualization.



## Table of Contents

- [Tasks Overview](#Tasks-Overview)
- [Technologies Used](#Technologies-Used)
- [Code Samples](#Code-Samples)
- [Results and Findings](#Results-and-Findings)
- [Lessons Learned](#Lessons-Learned)
- [Acknowledgements](#Acknowledgements)
- [How to Run the Code](#How-to-Run-the-Code)
- [Conclusion](#Conclusion)
- [Contact Information](#Contact-Information)

  
## Tasks Overview

The challenge encompassed diverse tasks, including data loading, cleaning, advanced SQL techniques, GitHub usage, Power BI visualization, and in-depth analyses of FIFA and Titanic datasets. Tasks explored survival rates, player statistics, family structures, and more.

## Technologies Used

- DuckDB
- SQL
- MotherDuck
- Power BI
- GitHub

## Code Samples

SQL queries used for each day's challenge are provided in separate files within the repository. Refer to the specific challenge day for corresponding code samples.


## Results and Findings

### Day 1-10: FIFA Dataset Analysis

In the initial phase of the challenge, I delved into the FIFA datasets, leveraging DuckDB for data processing. Noteworthy findings include:


- Player Position Insights: CB (28.48%), GK (24.2%), ST (21.75%), and CM (9.27%) were dominant positions.

- Player Value Analysis: The 'Value' column had diverse representations like '€100M' and '€10K.' Using smart parsing, I standardized these values for comprehensive analysis.

- OVA and POT Rankings: Lionel Messi claimed the highest OVA of 93. The top 10 players with the highest OVA and POT were identified, aiding team scouting strategies.

### Day 11-12: Power BI Visualization

Transitioning to Power BI, I created an interactive dashboard revealing insights such as:

- Nationality Distribution: England led with 1,705 occurrences, followed by Germany and Spain.

- Age vs. Potential Analysis: Younger players exhibited higher potential, peaking at 28 and declining after 42.

- Top Players by Overall Rating: Lionel Messi (OVA 93) secured the top spot.

### Day 13-14: DuckDB in Action

As I explored "DuckDB in Action," the book highlighted DuckDB's prowess in data analytics. I successfully uploaded Titanic datasets, discovering subsets in 'train.csv' (891 passengers) and 'test.csv' (418 passengers).

### Day 15-16: Advanced SQL Techniques

Learning advanced SQL techniques enhanced my querying capabilities. Highlights include:

- Subquery Mastery: Explored various subquery types, integrating them seamlessly into SQL queries.

- NTILE Window Functions: Utilized NTILE functions for impactful data bucketing.

### Day 17-20: Titanic Dataset Analysis

Analyzing the Titanic dataset uncovered intriguing patterns:

- Fare and Survival Rates: Higher fares correlated with increased survival rates.

- Gender Disparities: Females had a significantly higher survival rate (82.62%) compared to males (12.93%).

- Age and Survival Correlation: Younger individuals, especially children, exhibited higher survival rates.

### Day 21-23: Deep Dive into Passenger Details

A detailed examination of passenger details yielded valuable insights:

- Survival based on Cabin Level: Cabin levels influenced survival rates, considering passengers sharing the same ticket.

- Traveler Categorization: Solo travelers, family travelers, and mixed groups were identified based on ticket numbers and surnames.

- Family Size Calculation: Family size was determined, considering SibSp, ParCh, and passengers sharing the same ticket.

### Day 24-26: Unveiling Class, Gender, and Embarkation Insights

In the recent phase of exploration, the focus was on extracting profound insights from the Titanic dataset:

1. Survival Rates in Third Class: Evident gender and vulnerability impact, aligning with historical evacuation priorities.

2. Survival Across Demographics: Intersectionality of factors like class and embarkation point significantly influences survival probabilities.

3. Advising Chances of Survival: Historical trends, embarkation disadvantages, and age group dynamics contribute to individual outcomes.
   

### Day 27-30: Unveiling the Untold Stories of the Titanic Tragedy

The following insights were uncovered from this analysis:

- Solo travelers are predominant (848), "Sage family" has the largest family size, and adult men show a low survival rate (11%).
  

- Men in third class have a survival rate of 37.74%, while females outperform males with 86.47% survival. Cherbourg stands out with the highest embarkation survival rate.
  

- Passenger class influences survival rates, with first-class passengers having the highest rates. Southampton, Queenstown, and Cherbourg show varying embarkation survival rates.
  

- Overall, the analysis unveils nuanced patterns in survival based on demographics, family dynamics, and socio-economic factors among Titanic passengers.







## Lessons Learned

- Enhanced SQL skills, learned advanced techniques, and gained proficiency in data visualization with Power BI.
  
- Explored the efficiency and versatility of DuckDB for data analytics.

## Acknowledgements

- I would like to thank the organizers of the #30DaysDuckDBChallenge for providing this valuable learning experience.
  
- I also appreciate the creators of DuckDB and Power BI for developing these amazing tools.


## How to Run the Code

Follow these steps to execute the code and reproduce the analysis conducted during the 30DaysDuckDBChallenge:

#### 1. Clone this Repository:

- Clone this repository to your local machine using the following command:
  
```bash 
git clone [repository_url]
```

#### 2. Install DuckDB and Power BI:

- Install DuckDB on your local machine by following the installation instructions provided on the DuckDB website.
  
- Download and install Power BI from the official Microsoft website.
  
#### 3. Integrate DuckDB and MotherDuck:

- Create an account with Motherduck here.
  
- Integrate DuckDB with Motherduck to enable collaborative data analysis. Follow the instructions provided in the DuckDB documentation on connecting to MotherDuck.
  
#### 4. Execute SQL Queries:

- Navigate to the repository's directory on your local machine.

- Open DuckDB and execute the SQL queries provided in the relevant files for each challenge day. Use the command-line interface or preferred SQL editor.


#### 5. Power BI Visualizations:

- Import the CSV files generated during the analysis into Power BI.

- Follow the instructions provided in the corresponding Power BI files to recreate the visualizations.

- Adjust any necessary connections or configurations to match your local environment.

#### 6. Explore the Results:

- Once queries are executed and visualizations are recreated, explore the results to gain insights into the FIFA and Titanic datasets.

- Dive into the interactive Power BI dashboard to visualize key patterns and trends.

By following these steps, you'll be able to reproduce the 30DaysDuckDBChallenge analysis on your local machine. 

## Conclusion

The #30DaysDuckDBChallenge was a rewarding journey that significantly expanded my knowledge and skills in data analysis. I encourage anyone interested in data exploration to participate in similar challenges and utilize DuckDB and Power BI for their powerful capabilities.

## Contact Information
For any inquiries or collaborations, feel free to reach out:

Email: [bosedeasaji@gmail.com]

LinkedIn: [www.linkedin.com/in/abosede-igharo-a-a64271158]


