중복되는 칼럼이 있을 때 id가 작은 것을 남기고 지우기

두 객체를 조회해서 비교하는 방법
```sql
delete p1 from person p1, person p2
where p1.email = p2.email
and p1.id > p2.id;
```

속도가 가장 빠른 솔루션
이메일로 `group by`를 한 후 id가 가장 작은 것들을 고른다.
그리고 거기에 해당하지 않은 모든 행을 지운다.

```sql
DELETE FROM Person WHERE Id NOT IN 
(SELECT * FROM(
    SELECT MIN(Id) FROM Person GROUP BY Email) as p);
```
서브쿼리에서 파생된 모든 테이블은 별명을 가져야 한다. (p가 명시된 이유)
