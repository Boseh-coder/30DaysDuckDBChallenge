---created a new Table Titanic_dataset by combining Train and Test dataset
CREATE TABLE Titanic_dataset AS
SELECT PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked
FROM train
UNION ALL
SELECT PassengerId, NULL AS Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked
FROM test;

---Update the Survived column in Titanic_dataset using Gender_submission dataset
UPDATE Titanic_dataset
SET Survived = COALESCE(Gender_submission.Survived, 0)
FROM Gender_submission
WHERE Titanic_dataset.PassengerId = Gender_submission.PassengerId;


---Fare & Survival Rates Titanic_dataset WITH fare_bin AS (
    SELECT
        passengerid,
        fare,
        NTILE(6) OVER (ORDER BY fare) AS fare_bin,
        survived
    FROM Titanic_dataset
)
SELECT
    fare_bin AS Fare_Bin,
    COUNT(*) AS Total_Passengers,
    SUM(Survived) AS Survived,
    AVG(survived) AS Survival_Rate,
    SUM(fare) AS Fare_Amount,
    MIN(fare) AS Minimum_Fare,
    MAX(fare) AS Maximum_Fare
FROM fare_Bin
GROUP BY fare_Bin
ORDER BY fare_Bin;

---Gender Disparities
SELECT
  Sex,
  Total_Passengers,
  SurvivalRate,
  100 * SurvivalRate AS '%Survival',
  100 - (100 * SurvivalRate) AS '%Non_Survival'
FROM (
  SELECT
    Sex,
    COUNT(*) AS Total_Passengers,
    AVG(CAST(Survived AS INTEGER)) AS SurvivalRate
  FROM
    Titanic_dataset
  WHERE
    Sex IN ('male', 'female')
  GROUP BY
    Sex
) AS GenderSurvival;


---Age & Survival Correlation
SELECT
  CASE
    WHEN Age < 10 THEN '0-10'
    WHEN Age BETWEEN 11 AND 20 THEN '11-20'
    WHEN Age BETWEEN 21 AND 30 THEN '21-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Age >= 51 THEN '51+'
    ELSE 'Unknown'
  END AS AgeGroup,
  COUNT(*) AS TotalPassengers,
  SUM(Survived) AS TotalSurvived,
  100.0 * SUM(Survived) / COUNT(*) AS SurvivalRate
FROM
  Titanic_dataset
WHERE Age IS NOT NULL
GROUP BY AgeGroup
ORDER BY AgeGroup;
