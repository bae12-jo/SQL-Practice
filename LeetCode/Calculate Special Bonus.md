이름이 M으로 시작하지 않고, id가 홀수라면 보너스를 샐러리만큼 지급하고 아니라면 0을 지급하라
번호와 보너스를 id의 오름차순으로 정렬하여 출력하라


`if`문을 사용하는 방법
* 문법은 조건 ? a : b 와 유사하다.

```sql
select employee_id,
  if((name not like 'M%' and employee_id%2<>0), salary, 0) as bonus 
from
  Employees 
order by 
  employee_id;
```

`case` 문을 사용하는 방법
* if else 문을 사용하는 것과 비슷하다
* 반드시 `end`를 이용해서 닫아줘야 한다.

```sql
select 
    employee_id,
    (
    case
        when(employee_id%2=0) 
            then salary=0
        when(name like 'M%') 
            then salary=0
        else 
            salary*1
    end
    ) as bonus
from 
    Employees
order by employee_id;
```
