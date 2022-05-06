주문번호가 기본키이고, 고객번호가 있는 테이블에서 가장 많은 주문을 한 고객의 번호를 찾아라

`order by`와 `limit`을 합쳐서 max값을 찾는 방법
* desc 순으로 정렬한 후 limit을 1로 설정해서 최대값을 찾는다
```sql
select customer_number
from Orders
group by customer_number 
order by count(distinct order_number) desc
limit 1
```

