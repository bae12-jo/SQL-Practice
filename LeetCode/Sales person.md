3개의 테이블(세일즈맨, 주문, 회사)에서
특정 회사에 주문한 적이 없는 세일즈맨의 이름을 모두 반환하라

`left join`과 서브쿼리를 이용하는 방법
```sql
select s.name
from salesperson s
where s.sales_id NOT IN(
select o.sales_id from orders o
left join company c
on o.com_id = c.com_id
where c.name = 'RED')
```
