```aql
SELECT
    name, population, area
FROM
    world
WHERE
    area >= 3000000

UNION

SELECT
    name, population, area
FROM
    world
WHERE
    population >= 25000000
;
```

다중 조건을 `OR`로 연결하는 것보다 `union`을 사용하는 것이 더 빠르며, `union`보다는 `union all`이 더 빠르다.

참고자료
https://stackoverflow.com/questions/13750475/sql-performance-union-vs-or

왜냐면 조회를 할 때 인덱스가 테이블을 스캔하게 되는데, OR를 쓴다면 스캔을 두번 진행해야 한다. (특히 서로 다른 칼럼 조회를 OR로 묶은 경우)
그러나 Union을 쓰면 각 쿼리에서 인덱스가 테이블을 스캔하여 선별된 결과를 union하게 되므로 성능상의 이점이 있다.
