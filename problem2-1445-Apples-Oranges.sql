--self join way

select
    s.sale_date,
    s.sold_num - s1.sold_num AS diff
from
Sales s
join
Sales s1
on s.sale_date = s1.sale_date
and s.fruit != s1.fruit
and s.fruit = 'apples' and s1.fruit = 'oranges'

-- group by
SELECT
    sale_date,
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) -
    SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) AS diff
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;

--window function

SELECT DISTINCT
    sale_date,
    SUM(CASE WHEN fruit = 'apples' THEN sold_num ELSE 0 END) OVER (PARTITION BY sale_date) -
    SUM(CASE WHEN fruit = 'oranges' THEN sold_num ELSE 0 END) OVER (PARTITION BY sale_date) AS diff
FROM Sales
ORDER BY sale_date;