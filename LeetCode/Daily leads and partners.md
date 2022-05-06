상품의 날짜, 메이커, 리더 아이디, 파트너 아이디가 있는 테이블에서
날짜별 메이커마다 리더와 파트너의 중복 없는 개수를 반환하라

`count`와 `group by`를 사용한 방법
* 집계해야 하는 대상을 group by로 먼저 정리해주고, 세야하는 필드를 count distinct로 선정하기
* 어떤 필드를 각각 group by하고 count 해야 할지 잘 생각하기
```sql
select date_id, make_name, count(distinct lead_id) as unique_leads, count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name
```

