테이블 생성
```sql
Create table If Not Exists Customer (id int, name varchar(25), referee_id int)
Truncate table Customer
insert into Customer (id, name, referee_id) values ('1', 'Will', 'None')
insert into Customer (id, name, referee_id) values ('2', 'Jane', 'None')
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2')
insert into Customer (id, name, referee_id) values ('4', 'Bill', 'None')
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1')
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2')
```

Null과 정수가 섞여 있는 칼럼에서 특정 정수가 아닌 모든 값 찾기

!=을 SQL에서 사용하고 싶다면 `<>` 연산자를 사용하면 된다.
2가 아닌 숫자이거나 null 인 경우를 반환하고 싶을 때 `OR`를 사용하는 방법도 있지만 앞서 살펴본 바와 같이 `OR는 최대한 지양하는 것이 좋다.

```
SELECT name FROM Customer WHERE referee_id is null OR referee_id <> 2
```

`IFNULL` 이나 `COALESCE`를 쓰면 좋다.
칼럼 A를 조회하되 NULL이라면 두번째 파라미터로 넘겨준 칼럼 B 혹은 0을 반환한다.

```sql
select
    name
from
    customer
where
    IFNULL(referee_id, 0) <> 2;
```
 
COALESCE는 아래와 같은 방법으로 동작한다. 내부적으로 `CASE`를 이용한다.

```
    CASE
    WHEN (SELECT TOP 1 SomeValue FROM SomeTable) IS NOT NULL
    THEN (SELECT TOP 1 SomeValue FROM SomeTable)
    ELSE 0
    END

```

`IFNULL`과 `COALESCE` 중 어느 것이 더 빠른가? IFNULL이 미세하게 더 빠르다는 의견이 많으나 애초에 그 차이가 미묘하다.

```sql
select
    name
from
    customer
where
    COALESCE(referee_id, 0) <> 2;
```

`IS`와 `COALESCE`의 차이는?
https://stackoverflow.com/questions/2287642/which-is-quicker-coalesce-or-isnull

