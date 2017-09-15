# Solution

(
  SELECT
   CONCAT(a.name, '(', UPPER(LEFT(a.occup, 1)), ')') as first
FROM
    (SELECT
        Name as name,
        Occupation as occup
    FROM
        OCCUPATIONS
    ORDER BY
        name) a
)
UNION ALL
(
SELECT
    CONCAT('There are a total of ', b.freq, ' ', b.occup, 's.') as second
FROM
    (SELECT
        LOWER(Occupation) AS occup,
        count(Occupation) AS freq
    FROM
        OCCUPATIONS
    GROUP BY
        Occupation
    ORDER BY
        freq, occup) b
)
ORDER BY
    first
