두 테이블에서 각각 필드를 고루 뽑아서 반환하되, 오른쪽 테이블에 없는 경우 null을 반환하라

left join을 이용하는 방법
* left join은 항상 왼쪽 레코드를 살리고, 매치되는 오른쪽 레코드가 없는 경우에는 null을 반환한다

```sql
select p.firstname, p.lastname, a.city, a.state
from person p
left join address a
on p.personId = a.personId
group by p.personId;
```
