플레이어 번호와 이벤트 아이디가 테이블의 기본키이고, 장치 번호와 플레이한 게임 번호가 있을 때
사용자마다 가장 처음 로그인한 날짜를 반환하라

`min`을 이용해서 가장 최초의 로그인 날짜를 찾는 방법
* 사용자 아이디 고유 아이디로 집계해 준 후, 가장 앞선 날짜를 고른다
```sql
select distinct(player_id), min(event_date) as first_login
from Activity
group by player_id
```
