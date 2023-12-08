---Survival based on cabin level
SELECT
    t.Ticket,
    MAX(t.Cabin) AS CabinLevel,
    COUNT(*) AS TotalPassengers,
    SUM(t.Survived) AS SurvivedCount,
    AVG(t.Survived) AS SurvivalRate
FROM
    Titanic_dataset t
WHERE
    t.Cabin IS NOT NULL
GROUP BY
    t.Ticket;

    -- Add a new column 'Surname' to the table
    ALTER TABLE Titanic_dataset
    ADD COLUMN Surname VARCHAR;

    -- Update the new column with the extracted surnames
    UPDATE Titanic_dataset
    SET Surname = SPLIT_PART(Name, ',', 1);

    -- Categorize passengers into solo travelers, family travelers, and those in a mixed group
    SELECT
        Ticket,
        Surname,
        COUNT(*) AS PassengerCount,
        CASE
            WHEN COUNT(*) = 1 THEN 'Solo Traveler'
            WHEN MAX(Parch) > 0 THEN 'Family Traveler'
            ELSE 'Mixed Group'
        END AS TravelGroup
    FROM
        Titanic_dataset
    GROUP BY
        Ticket, Surname;


        ---Created a Family size column first
        ALTER TABLE Titanic_dataset
        ADD COLUMN FamilySize INT;

        ---Then calculated the family size
        UPDATE Titanic_dataset
        SET FamilySize = SibSp + Parch;


        ---determined the maximum family size
        SELECT
            T.Ticket,
            LEFT(ANY_VALUE(T.Name), POSITION(',' IN ANY_VALUE(T.Name)) - 1) AS Surname,
            T.SibSp,
            T.Parch,
            ANY_VALUE(T.FamilySize) AS FamilySize,
            MAX(T.SibSp + T.Parch + 1) AS MaxFamilySize
        FROM Titanic_dataset T
        GROUP BY T.Ticket, Surname, T.SibSp, T.Parch;
