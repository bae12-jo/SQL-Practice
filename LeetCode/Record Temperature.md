전날보다 날씨가 높은 모든 날의 아이디를 반환하라

한 테이블에서 두 레코드를 비교해야 할 때
table a, table b에서 각각 from한 후 where로 비교하면 된다

`DATEDIFF`를 이용해 하루 차이를 구하는 방법
* 순서가 중요하다

```sql
select distinct a.id
from weather a, weather b
where a.temperature > b.temperature
and datediff(a.recordDate, b.recordDate) = 1
```

`DATEADD`를 이용해 하루 차이를 구하는 방법
* 순서가 중요하다
* `interval 1 day`같은 형태로 옵션을 offset을 줘야 한다.
```sql
select a.id
from weather a, weather b
where a.temperature > b.temperature
and a.recordDate = DATE_ADD(b.recordDate, interval 1 day)
```
