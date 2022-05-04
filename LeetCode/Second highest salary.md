두번째로 높은 샐러리를 받는 사람을 찾아라

rank() 관련된 순위 함수는 말 그대로 순위를 출력함..
이 문제에서는 값을 출력해야 하므로 적절하지 않음

순위를 출력할 때는 `distinct`를 필수적으로 고민해봐야 한다. (문제에서 중복을 허용하지 않는 한)

`limit`과 `offset`를 사용하는 방법
* offset은 설정한 행만큼 건너뛴다
* limit은 지정한 개수만큼 보여준다
* offest이 limit보다 우선 적용된다
* 다만 이 방법은 해당하는 row가 없을 시 null을 반환하지 않는다.
```sql
select distinct salary as SecondHighestSalary
from employee
order by salary desc
limit 1 offset 1
```

위의 풀이에서 null인 경우 null을 반환하는 `IFNULL`을 추가해준다.
```sql
select
    IFNULL(
     (select distinct salary
      from employee
      order by salary desc
      limit 1 offset 1),
    null)
as SecondHighestSalary
```
