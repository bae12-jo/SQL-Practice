특정 날짜를 기준으로 직전 30일 간 활성화 유저의 수를 구하라
이때 한 유저가 여러 활동을 한 것은 1개로 친다.

`group by`와 `having`을 이용하는 방법

```sql
select activity_date as day, count(distinct user_id) as active_users
from activity
group by activity_date
having activity_date between "2019-06-28"  and "2019-07-27"
```

`datediff`를 이용하는 방법

```sql
select activity_date as day, count(distinct(user_id)) active_users from Activity
where datediff('2019-07-27', activity_date) < 30
group by activity_date;
```
