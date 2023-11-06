-- Clean the 'Height' column
UPDATE fifa21_player
SET Height = CAST(SUBSTR(Height, 1, INSTR(Height, '''') - 1) AS INT);

UPDATE fifa21_player2
SET height= CAST(SUBSTR(height, 1, LENGTH(height) - 2) AS INTEGER)
WHERE height LIKE '%cm';

-- Clean the 'Weight' column
UPDATE fifa21_player
SET Weight = CAST(SUBSTR(Weight, 1, LENGTH(Weight) - 3) AS INT);

UPDATE fifa21_player2
SET Weight = CAST(SUBSTR(Weight, 1, LENGTH(Weight) - 3) AS INT);


-- Clean and round up the 'Value' column
UPDATE fifa21_player
SET Value =
  CASE
    WHEN RIGHT(Value, 1) = 'M' THEN ROUND(CAST(REPLACE(REPLACE(Value, '€', ''), 'M', '') AS NUMERIC) * 1000000)
    WHEN RIGHT(Value, 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE(Value, '€', ''), 'K', '') AS NUMERIC) * 1000)
    ELSE ROUND(CAST(REPLACE(Value, '€', '') AS NUMERIC))
  END
WHERE RIGHT(Value, 1) IN ('M', 'K') OR RIGHT(Value, 1) NOT IN ('M', 'K');

UPDATE fifa21_player2
SET Value =
  CASE
    WHEN RIGHT(Value, 1) = 'M' THEN ROUND(CAST(REPLACE(REPLACE(Value, '€', ''), 'M', '') AS NUMERIC) * 1000000)
    WHEN RIGHT(Value, 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE(Value, '€', ''), 'K', '') AS NUMERIC) * 1000)
    ELSE ROUND(CAST(REPLACE(Value, '€', '') AS NUMERIC))
  END
WHERE RIGHT(Value, 1) IN ('M', 'K') OR RIGHT(Value, 1) NOT IN ('M', 'K');


-- Clean the 'Wage' column
UPDATE fifa21_player
SET Wage =
  CASE
    WHEN RIGHT(Wage, 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE(Wage, '€', ''), 'K', '') AS NUMERIC) * 1000)
    ELSE ROUND(CAST(REPLACE(Wage, '€', '') AS NUMERIC))
  END
WHERE RIGHT(Wage, 1) IN ('K') OR RIGHT(Wage, 1) NOT IN ('K');

UPDATE fifa21_player2
SET Wage =
  CASE
    WHEN RIGHT(Wage, 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE(Wage, '€', ''), 'K', '') AS NUMERIC) * 1000)
    ELSE ROUND(CAST(REPLACE(Wage, '€', '') AS NUMERIC))
  END
WHERE RIGHT(Wage, 1) IN ('K') OR RIGHT(Wage, 1) NOT IN ('K');

-- Clean the 'Release Clause' column
UPDATE fifa21_player
SET "Release clause" =
  CASE
    WHEN RIGHT("Release Clause", 1) = 'M' THEN ROUND(CAST(REPLACE(REPLACE("Release Clause", '€', ''), 'M', '') AS NUMERIC) * 1000000)
    WHEN RIGHT("Release Clause", 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE("Release Clause", '€', ''), 'K', '') AS NUMERIC) * 1000)
    ELSE ROUND(CAST(REPLACE("Release Clause", '€', '') AS NUMERIC))
  END

  UPDATE fifa21_player2
  SET "Release clause" =
    CASE
      WHEN RIGHT("Release Clause", 1) = 'M' THEN ROUND(CAST(REPLACE(REPLACE("Release Clause", '€', ''), 'M', '') AS NUMERIC) * 1000000)
      WHEN RIGHT("Release Clause", 1) = 'K' THEN ROUND(CAST(REPLACE(REPLACE("Release Clause", '€', ''), 'K', '') AS NUMERIC) * 1000)
      ELSE ROUND(CAST(REPLACE("Release Clause", '€', '') AS NUMERIC))
    END

    -- To remove the 'star' character from W/F column
    UPDATE fifa21_player
    SET "W/F" = REPLACE("W/F", '★', '')

    UPDATE fifa21_player2
    SET "W/F" = REPLACE("W/F", '★', '')

    -- To remove the 'star' character from SM column
    UPDATE fifa21_player
    SET "SM" = REPLACE("SM", '★', '')

    UPDATE fifa21_player2
    SET "SM" = REPLACE("SM", '★', '')

    --To remove the 'star' character from IR column
    UPDATE fifa21_player
    SET "IR" = REPLACE("IR", '★', '')

    UPDATE fifa21_player2
    SET "IR" = REPLACE("IR", '★', '')

    -- Converted the Hits column to numeric format and stripped the symbols ('K')
UPDATE fifa21_player
SET hits =
  CASE
    WHEN hits LIKE '%K' THEN ROUND(COALESCE(CAST(SUBSTR(hits, 1, LENGTH(hits) - 1) AS DECIMAL) * 1000, 0))
    ELSE ROUND(COALESCE(CAST(hits AS DECIMAL), 0))
  END
WHERE hits IS NOT NULL;

UPDATE fifa21_player2
SET hits =
  CASE
    WHEN hits LIKE '%K' THEN ROUND(COALESCE(CAST(SUBSTR(hits, 1, LENGTH(hits) - 1) AS DECIMAL) * 1000, 0))
    ELSE ROUND(COALESCE(CAST(hits AS DECIMAL), 0))
  END
WHERE hits IS NOT NULL;

 --Removed the show paragraph sign (¶) from club column
UPDATE fifa21_player
SET club = REPLACE(club, E'\n', '');

UPDATE fifa21_player2
SET "Team & Contract" = REPLACE("Team & Contract", E'\n', '');

-- My aim was to split the years from the clubs in the “Team and Contract” column and it two separate columns in fifa21_player table. So, I took the following steps;
-- renamed the column “Team & contract” to “Club” same in the fifa21_player2 Table
ALTER TABLE fifa21_player
RENAME COLUMN "Team & Contract" TO Club;

-- created a new “Contract” in the fifa21_player table
ALTER TABLE fifa21_player ADD Contract VARCHAR(6);

 -- extracted the years (e.g. 2004-2014) from the “Club” column into the new column “Contract”
UPDATE fifa21_player
SET contract = SUBSTRING(club, -11);

--- removed the characters I extracted already from the “club” column
UPDATE fifa21_player
SET club = SUBSTRING(club FROM 1 FOR LENGTH(club) - 9)
WHERE club IS NOT NULL;
