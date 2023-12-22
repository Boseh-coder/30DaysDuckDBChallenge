---Calculate mean and standard deviation of Age for each combination of Pclass, Sex, and title
CREATE TEMPORARY TABLE AgeImputation AS
SELECT
  Pclass,
  Sex,
  Title,
  AVG(Age) AS MeanAge,
  STDDEV(Age) AS StdDevAge
FROM
  YourTableName -- Replace with your actual table name
WHERE
  Age IS NOT NULL
GROUP BY
  Pclass, Sex, Title;

---Update missing Age values with imputed rounded-up values
UPDATE Titanic_dataset
SET
  Age = CEIL(AgeImputation.MeanAge + RANDOM() * AgeImputation.StdDevAge)
FROM
  AgeImputation
WHERE
  Titanic_dataset.Pclass = AgeImputation.Pclass
  AND Titanic_dataset.Sex = AgeImputation.Sex
  AND Titanic_dataset.Title = AgeImputation.Title
  AND Titanic_dataset.Age IS NULL;


  CREATE TEMPORARY TABLE FareImputation AS
  SELECT
    Pclass,
    AVG(Fare / (SibSp + ParCh + 1)) AS FarePerPassenger
  FROM
    Titanic_dataset
  WHERE
    Fare IS NOT NULL
  GROUP BY
    Pclass;
---Update missing Fare values with imputed values
  UPDATE Titanic_dataset
  SET
    Fare = FareImputation.FarePerPassenger * (SibSp + ParCh + 1)
  FROM
    FareImputation
  WHERE
    Titanic_dataset.Pclass = FareImputation.Pclass
    AND Titanic_dataset.Fare IS NULL;


---Add a new column 'CabinLevel' to store the first letter
ALTER TABLE Titanic_dataset
ADD COLUMN CabinLevel VARCHAR;
-- Update the new column with the first letter from the 'Cabin' column
UPDATE Titanic_dataset
SET CabinLevel = LEFT(Cabin, 1);

---Update the missing Cabin_Level values based on the highest count for each Pclass and Embarked
UPDATE Titanic_dataset AS t
SET CabinLevel = ranked.CabinLevel
FROM (

---Subquery to get the highest count for each Pclass, Embarked, and Cabin_Level
    SELECT
        Pclass,
        Embarked,
        CabinLevel,
        ROW_NUMBER() OVER (PARTITION BY Pclass, Embarked ORDER BY COUNT(*) DESC) AS rnk
    FROM
        Titanic_dataset
    WHERE
        Cabin IS NOT NULL
    GROUP BY
        Pclass, Embarked, CabinLevel
) AS ranked
WHERE
    t.Pclass = ranked.Pclass
    AND t.Embarked = ranked.Embarked
    AND t.CabinLevel IS NULL
    AND ranked.rnk = 1;


    -- Update NULL values in the Embarked column with 'Southampton'
    UPDATE Titanic_dataset
    SET Embarked = 'Southampton'
    WHERE Embarked IS NULL;


    ---Add the TravelGroup column to Titanic_dataset
    ALTER TABLE Titanic_dataset
    ADD COLUMN TravelGroup VARCHAR;

    --Update the TravelGroup column based on the categorization
    UPDATE Titanic_dataset AS T
    SET TravelGroup = TG.TravelGroup
    FROM (
        SELECT
            Ticket,
            Surname,
            CASE
                WHEN COUNT(*) = 1 THEN 'Solo Traveler'
                WHEN MAX(Parch) > 0 THEN 'Family Traveler'
                ELSE 'Mixed Group'
            END AS TravelGroup
        FROM Titanic_dataset
        GROUP BY Ticket, Surname
    ) AS TG
    WHERE T.Ticket = TG.Ticket AND T.Surname = TG.Surname;



    ---Add the MaxFamilySize column to Titanic_dataset
    ALTER TABLE Titanic_dataset
    ADD COLUMN MaxFamilySize INT;

    ---Update the MaxFamilySize column based on the calculations
    UPDATE Titanic_dataset
    SET MaxFamilySize = SibSp + Parch + 1;
