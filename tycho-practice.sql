-- !preview conn=DBI::dbConnect(RSQLite::SQLite())

-- how many rows in the tycho table
SELECT 1
SELECT COUNT(*) FROM tycho;


-- print first 5 rows of tycho
SELECT * FROM tycho LIMIT 5;


-- different loc_type?different disease?
SELECT DISTINCT loc_type FROM tycho LIMIT 5;
SELECT DISTINCT disease FROM tycho LIMIT 5;




-- Normalization:
-- how many cases in states by disease?
SELECT disease, SUM(cases) AS total_cases FROM tycho WHERE loc_type = 'STATE' GROUP BY disease;
SELECT disease, SUM(cases) AS total_cases FROM tycho WHERE loc_type = 'STATE' GROUP BY disease,state;

-- separate epi_week into a 'year' and 'week' columns
SELECT CAST(substr("196601", 5, 2) AS integer) AS week;
SELECT CAST(substr("196601", 1, 4) AS integer) AS year;
SELECT
    epi_week,
    SUBSTR(epi_week, 1, 4) AS year,
    SUBSTR(epi_week, 5, 2) AS week
FROM tycho limit 5;

-- how many _smallpox_ cases by state in 1930?
