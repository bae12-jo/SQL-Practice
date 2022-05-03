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
단일 칼럼을 여러 조건으로 조회하고 싶을 때는 `or`보다 `in`을 쓰는 것이 좋다. `in`은 인덱스를 사용할 수 있는 반면 `on`은 불가능하기 때문이다. 

다중 칼럼 조회 시 `OR`로 연결하는 것보다 `union`을 사용하는 것이 더 빠르며, `union`보다는 `union all`이 더 빠르다.

참고자료
https://stackoverflow.com/questions/13750475/sql-performance-union-vs-or

왜냐면 조회를 할 때 인덱스가 테이블을 스캔하게 되는데, OR를 쓴다면 스캔을 두번 진행해야 한다. (특히 서로 다른 칼럼 조회를 OR로 묶은 경우)
그러나 Union을 쓰면 각 쿼리에서 인덱스가 테이블을 스캔하여 선별된 결과를 union하게 되므로 성능상의 이점이 있다.

| OR는 불가피한 경우를 제외하고 쓰지 않는 것이 좋다.
