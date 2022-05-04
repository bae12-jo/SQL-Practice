두 테이블에서 정보가 누락된 행의 아이디를 반환하라
여기서 정보가 누락되었다는 것은 한쪽의 테이블에만 있는 경우를 말한다

`left join`을 활용하여 union 하는 방법
* left join은 두 테이블을 결합하되, 왼쪽 테이블 레코드 한 개에 오른쪽 테이블 레코드 여러개가 일치하는 경우 여러번 표시한다.
* 만약 왼쪽 레코드와 일치하는 오픈쪽 레코드가 없는 경우 왼쪽 레코드는 무조건 표시하고 null로 표시한다.
* 이를 이용해서 왼쪽에만 있는 레코드를 판별해낼 수 있다.

```sql
select e.employee_id
from employees e
left join salaries s
on e.employee_id = s.employee_id
where s.salary is NULL

union

select s.employee_id
from salaries s
left join employees e
on s.employee_id = e.employee_id
where e.name is NULL

order by 1
```


`not in`을 활용하여 union 하는 방법
* 다른 테이블에 없는 아이디를 각각 not in으로 찾은 후 union 하는 방법
* 원리는 1번 풀이와 거의 비슷하지만 join을 피할 수 있다는 것이 장점이다.
```sql
select * from
(
    select e.employee_id 
    from employees e
    where e.employee_id not in (select employee_id from salaries)
    union
    select s.employee_id
    from salaries s
    where s.employee_id not in (select employee_id from employees)
) as t
order by employee_id
```
