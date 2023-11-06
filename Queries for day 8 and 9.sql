---players with the highest OVA and POT within each club
SELECT Club,
       Name AS PlayerName,
       MAX(↓OVA) AS HighestOVA,
       MAX(POT) AS HighestPOT
FROM (
  SELECT Club, Name, ↓OVA, POT
  FROM fifa21_player
  UNION ALL
  SELECT Club, Name, ↓OVA, POT
  FROM fifa21_player2
) AS CombinedData
GROUP BY Club, PlayerName;

---the average OVA for players under 25 years old and over 30 years old in each club
SELECT Club,
      ROUND(AVG(CASE WHEN Age < 25 THEN CAST(↓OVA  AS FLOAT) ELSE NULL END), 2) AS AvgOVA_Under25,
      ROUND(AVG(CASE WHEN Age > 30 THEN CAST(↓OVA  AS FLOAT) ELSE NULL END), 2) AS AvgOVAOver30
FROM (
  SELECT Club, ↓OVA , Age FROM fifa21_player
  UNION ALL
  SELECT Club, ↓OVA , Age FROM fifa21_player2
) AS CombinedData
GROUP BY Club;

---list of players who have the same age within each club.
SELECT Club, Age, STRING_AGG(Name, ', ') AS PlayersWithSameAge
FROM fifa21_player2
GROUP BY Club, Age
HAVING COUNT(*) > 1;

--- players with the highest POT for each nationality
SELECT   Name, Nationality, MAX(POT) AS HighestPOT
FROM (
  SELECT  Name, Nationality, POT FROM fifa21_player
  UNION ALL
  SELECT  Name, Nationality, POT FROM fifa21_player2
) AS CombinedData
GROUP BY Name, Nationality;


--- ranking of players by their OVA in descending order within each club
SELECT Club, Name, ↓OVA,
       ROW_NUMBER() OVER(PARTITION BY Club ORDER BY ↓OVA DESC) AS Rank
FROM fifa21_player2
ORDER BY Club, Rank;
