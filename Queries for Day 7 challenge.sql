--- To identify players who possess high value but receive relatively low wages.
SELECT Name, "Value", Wage,
CAST(Value AS FLOAT) / CAST(Wage AS FLOAT) AS ValueToWageRatio
FROM fifa21_player
UNION
SELECT Name, "Value", Wage,
CAST(Value AS FLOAT) / CAST(Wage AS FLOAT) AS ValueToWageRatio
FROM fifa21_player2
ORDER BY ValueToWageRatio DESC LIMIT 10;


--- To Determine the count of players available in the dataset for each position.
SELECT Positions, COUNT(*) AS PlayerCount
FROM (
  SELECT Positions FROM fifa21_player
  UNION ALL
  SELECT Positions FROM fifa21_player2
) AS CombinedData
GROUP BY Positions
ORDER BY PlayerCount DESC;

--- To find out which club has the largest representation of players in the dataset.
SELECT Club, COUNT(*) AS PlayerCount
FROM (
  SELECT Club FROM fifa21_player
  UNION ALL
  SELECT Club FROM fifa21_player2
) AS CombinedData
GROUP BY Club
ORDER BY PlayerCount DESC;

---I noticed I had 2 blank rows with a count, which is not consistent for an analysis. So I used “No club” in place of the empty rows instead.
-- Update empty "Club" values to "No Club" in dataset 1
UPDATE fifa21_player
SET Club = 'No Club'
WHERE Club IS NULL OR Club = ' ';

-- Update empty "Club" values to "No Club" in dataset 2
UPDATE fifa21_player2
SET Club = 'No Club'
WHERE Club IS NULL OR Club = ' ';

---Top 10 players with the highest OVA and POT values.
SELECT DISTINCT Name, ↓OVA, POT
FROM (
  SELECT Name, ↓OVA, POT FROM fifa21_player
  UNION ALL
  SELECT Name, ↓OVA, POT FROM fifa21_player2
) AS CombinedData
ORDER BY ↓OVA DESC
LIMIT 10;

SELECT DISTINCT Name, ↓OVA, POT
FROM (
  SELECT Name, ↓OVA, POT FROM fifa21_player
  UNION ALL
  SELECT Name, ↓OVA, POT FROM fifa21_player2
) AS CombinedData
ORDER BY POT DESC
LIMIT 10;
