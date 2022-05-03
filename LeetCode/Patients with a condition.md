다중 값을 가지고 있는 필드 중에 DIAB1으로 시작되는 값이 있는 행을 모두 찾아 반환하라.

`like`와 `or`을 이용한 방법
* %를 적당한 위치에 놓는 것이 중요하다.
* DIAB1으로 시작하는 코드가 먼저 나오는 경우-> `DIAB1%`
* DIAB1으로 시작하는 코드가 나중에 나오는 경우 -> `% DIAB1%`

```sql
select patient_id, patient_name, conditions
from patients
where conditions like '% DIAB1%' or conditions like 'DIAB1%';
```
