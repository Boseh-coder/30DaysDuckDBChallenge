-- Alter the column to VARCHAR first
ALTER TABLE Titanic_dataset
ALTER COLUMN Pclass TYPE VARCHAR(20);

-- Update the values with class names
UPDATE Titanic_dataset
SET Pclass = CASE
                WHEN Pclass = '1' THEN 'First Class'
                WHEN Pclass = '2' THEN 'Second Class'
                WHEN Pclass = '3' THEN 'Third Class'
             END;

 -- Alter the column to VARCHAR first
   ALTER TABLE Titanic_dataset
   ALTER COLUMN Embarked TYPE VARCHAR(20);

-- Update the values with class names
   UPDATE Titanic_dataset
    SET Embarked = CASE
         WHEN Embarked= 'S' THEN 'Southampton'
         WHEN Embarked = 'C' THEN 'Cherbourg'
         WHEN Embarked = 'Q' THEN 'Queenstown'
    END;


---Survival Rate of Males in the Third Passenger Class (including Women and Children)
 SELECT
          COUNT(*) AS Total_third_class_passengers,
          SUM(CASE WHEN Sex = 'male' AND Survived = 1 THEN 1 END) AS Male_survivors,
          SUM(CASE WHEN (Age < 18 OR Sex = 'female') AND Survived = 1 THEN 1 END) AS Women_and_children_survivors,
          (SUM(CASE WHEN Sex = 'male' AND Survived = 1 THEN 1 END) * 100.0) / COUNT(*) AS Male_survival_rate,
          (SUM(CASE WHEN (Age < 18 OR Sex = 'female') AND Survived = 1 THEN 1 END) * 100.0) / COUNT(*) AS Women_and_children_survival_rate
 FROM Titanic_dataset
 WHERE Pclass = 'Third Class';


--- Percentage Survived between Sex, Embarked, and PClass
SELECT
    Sex, Embarked, Pclass,
    SUM(Survived) * 100.0 / COUNT(*) AS survival_rate
FROM
    Titanic_dataset
GROUP BY
    Sex, Embarked, Pclass;

  ---Chances of Survival
    SELECT
        Sex,
        Age,
        Pclass,
        Embarked,
        COUNT(*) AS Total_passengers,
        SUM(Survived) AS Total_survivors,
        (SUM(Survived) * 100.0) / COUNT(*) AS Survival_rate_percentage
    FROM Titanic_dataset
    WHERE Sex = 'male' AND Age = 36 AND Pclass = 'Second Class' AND Embarked = 'Cherbourg'
    GROUP BY Sex, Age, Pclass, Embarked;
