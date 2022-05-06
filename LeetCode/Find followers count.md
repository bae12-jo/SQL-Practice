유저 아이디와 팔로워 아이디가 기본키인 테이블에서 유저마다 팔로워 수를 반환하라

`group by`와 `count`를 이용한 방법
* group by를 이용해서 집계할 대상별로 묶어 주는 단계가 반드시 선행되어야 함!!
* 이후에 count를 하던지 order by를 하던지 할 것

```sql
select user_id, count(distinct follower_id) as followers_count
from Followers
group by user_id
order by user_id
```
