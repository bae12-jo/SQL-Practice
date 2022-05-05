두 테이블에서 나머지 한 테이블에 없는 레코드를 그룹화하여 반환하라

`NOT IN`과 `GROUP BY`를 활용한 방법

```sql
SELECT customer_id, COUNT(customer_id) as count_no_trans FROM Visits 
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id
```

`LEFT JOIN`을 이용해서 차집합을 구하는 전형적인 예제

```sql
SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits v LEFT JOIN Transactions t
ON v.visit_id = t.visit_id # JOIN을 하기 전 필터링, LEFT JOIN이기 때문에 왼쪽 레코드에만 값이 있고 오른쪽에는 없는 경우 오른쪽이 NULL인 상태로 합쳐지게 됨
WHERE t.visit_id is null # JOIN을 하고 난 후 필터링
group by customer_id
```
