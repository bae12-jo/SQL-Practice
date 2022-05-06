유저 번호와 타임스탬프가 테이블의 기본키일 때,
모든 유저에 대해서 2020년의 마지막 로그인 날짜를 반환하라
이때 2020년에 로그인한 기록이 없는 유저는 반환하지 말라

`year()` 함수를 사용해서 원하는 연도만 추출하는 방법
* where 절에 year 함수를 이용해서 원하는 연도 (정수)를 가진 타임 스탬프만 추출한다
* max 함수를 써서 2020년에 이루어진 로그인 중 가장 마지막 날짜를 반환한다 

```sql
select user_id, MAX(time_stamp) as last_stamp
from Logins
where year(time_stamp)= 2020
group by user_id
```

서브쿼리의 where 절에 `between`을 써서 2020년 로그인 정보를 수집하는 방법
* where 절로 2020년의 로그인 정보를 모은다 이때 select는 user_id, time_stamp와 동일해야 본 쿼리에서 user_id를 맞춰보는 작업 없이 바로 max 날짜를 고를 수 잇다.)

```sql
select user_id, MAX(time_stamp) as last_stamp
from (select user_id, time_stamp
      from Logins
      where time_stamp between '2020-01-01 00:00:00' and '2020-12-31 23:59:59'
      ) as t
group by user_id
```
