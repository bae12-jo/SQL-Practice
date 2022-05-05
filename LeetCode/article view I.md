자신의 글을 열람한 작가를 찾아라
작가 번호와 열람 번호가 같다면 같은 사람이다

```sql
select distinct(author_id) as id
from Views
where author_id = viewer_id
order by author_id
```
