NOT IN을 이용해서 다른 테이블에 없는 id를 조회하는 방법
* 서브 쿼리를 이용해서 다른 테이블의 조회 결과에서 없는 아이디를 찾는 것
```sql
SELECT Customers.NAME as Customers FROM Customers
WHERE Customers.ID NOT IN
(SELECT customerId FROM Orders);
```

right join을 이용해서 왼쪽 테이블에 없는 오른쪽 테이블의 값을 조회하는 방법
* 이때 왼쪽에는 없는 아이디를 조회할 것이므로 where left.id is null을 반드시 해줘야 한다.
* not in 보다 더 오래 걸린다.
```sql
select name as Customers
from orders o right join customers c
on o.customerid=c.id
where o.id is null;
```


left join을 이용해서 두 테이블을 조인한 후 한쪽이 null인 것을 찾는 방법
* right join보다도 더 오래 걸린다.
```sql
select name as Customers
from customers c
left join orders o
on c.id=o.customerId
where o.customerId is NULL;
```
