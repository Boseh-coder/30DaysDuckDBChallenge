---To Identify Unique titles in the Dataset
SELECT DISTINCT
  CASE
    WHEN Name LIKE '%Mrs.%' THEN 'Mrs'
    WHEN Name LIKE '%Mr.%' THEN 'Mr'
    WHEN Name LIKE '%Miss%' THEN 'Miss'
    WHEN Name LIKE '%Master%' THEN 'Master'
    ELSE 'Other'
  END AS Title
FROM Titanic_dataset ;


--- To Consolidate infrequent titles into broader categories (e.g., Mr, Mrs, Miss, Master).

--Created a new column first
ALTER TABLE Titanic_dataset
ADD COLUMN Title VARCHAR;

---Then updated the new column created
UPDATE Titanic_dataset
SET Title =
    CASE
        WHEN Name LIKE '%Master%' THEN 'Master'
	    WHEN Name LIKE '%Mrs.%' OR Name LIKE '%Lady%' OR Name LIKE '%Countess%' OR Name LIKE '%Dona%' THEN 'Mrs.'
        WHEN Name LIKE '%Miss%' OR Name LIKE '%Mme%' OR Name LIKE '%Mlle%' OR Name LIKE '%Ms.%' THEN 'Miss'
        WHEN Name LIKE '%Mr.%' OR Name LIKE '%Don%' OR Name LIKE '%Rev.%' OR Name LIKE '%Major%' OR Name LIKE '%Sir%' OR Name LIKE '%Col%' OR Name LIKE '%Capt%' OR Name LIKE '%Jonkheer%' THEN 'Mr.'
        WHEN Name LIKE '%Dr.%' AND Sex = 'male' THEN 'Mr.'
        WHEN Name LIKE '%Dr.%' AND Sex = 'female' THEN 'Mrs.'
        ELSE 'Other'
    END;


    ---Calculate and analyze survival rates for each title grouping.

    WITH Title AS (
        SELECT
            CASE
                WHEN POSITION('Master' IN Name) > 0 THEN 'Master'
                WHEN POSITION('Miss' IN Name) > 0 THEN 'Miss'
                WHEN POSITION('Mr' IN Name) > 0 THEN 'Mr'
                WHEN POSITION('Mrs' IN Name) > 0 THEN 'Mrs'
                ELSE 'Other'
            END AS Title,
            Survived
        FROM Titanic_dataset
         )

    SELECT
        Title,
        COUNT(*) AS TotalPassengers,
        SUM(Survived) AS SurvivedCount,
        AVG(Survived) AS SurvivalRate
    FROM Titanic_dataset
    GROUP BY Title;

---calculate the survival based on being a woman or a child

SELECT
    CASE
        WHEN Sex = 'female' AND Age < 18 THEN 'Child'
        WHEN Sex = 'male' AND Age < 18 THEN 'Child'
        WHEN Sex = 'female' AND Age >= 18 THEN 'Woman'
        ELSE 'Adult Male'
    END AS Passengers,
    COUNT(*) AS TotalPassengers,
    SUM(Survived) AS SurvivedCount,
    AVG(Survived) AS SurvivalRate
FROM Titanic_dataset
GROUP BY Passengers;
