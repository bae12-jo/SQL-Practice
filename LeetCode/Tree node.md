자기자신과 부모노드의 아이디로 이루어진 테이블을 보고 해당 레코드가 root, leaf, inner 중 어느 노드인지 반환하라.

`union`을 이용한 방법
* root, leaf, inner를 어떻게 분간할 것인가?
* 부모 노드 아이디 집합을 잘 이용하는 것이 포인트
* root라면 부모가 없고
* leaf라면 부모의 집합에 자신이 포함되지 않아야 하고
* inner라면 부모의 집합에 자신이 포함되어야 한다

```sql
# 부모가 없으면 root 노드
select id, 'Root' as type
from tree
where p_id is null

# 자식이 없으면 leaf 노드
# 부모가 있으면서 (p_id is NOT NULL)
# 이 노드의 아이디가 부모 아이디의 집합에 이 노드의 아이디가 없다면 (select distinct p_id from tree where p_id is not null)
# 리프노드인 것

union

select id, 'Leaf' as type 
from tree
where id NOT IN 
(select distinct p_id
from tree
where p_id is NOT NULL)
and p_id is NOT NULL

union

# 부모도 있고 자식도 있다면 Inner 노드
# 이 노드의 아이디가 부모 아이디의 집합에 있어야함
select id, 'Inner' as type
from tree
where id IN 
(select distinct p_id from tree where p_id is NOT NULL)
and p_id is NOT NULL
```

`CASE`를 활용하는 방법 - flow control
* 부모가 없는 노드라면 root, 자신이 누군가의 부모라면 inner, 그 외에는 leaf
* 이때 부모가 없는 노드는 둘다 id로 조회하므로 `=`을 써도 되지만, inner는 여러 부모 노드 중 하나를 찾는 것이므로 `in`을 쓰면 된다.
* 그 외에는 leaf 노드 이다. alias는 end 뒤에 쓴다.
```sql
select id,
case
    when tree.id = (select t.id from tree t where t.p_id is null)
        then 'Root'
    when tree.id IN (select t.p_id from tree t)
        then 'Inner'
    ELSE 'Leaf'
END as Type
FROM tree
Order by id;
```

`IF`를 사용하는 방법 - flow control
* ISNULL(조건), true, false와
* IF(조건), true, false를 중첩해서 사용
* if 구문 전체를 isnull false에 넣는 것
```sql
select id,
if(ISNULL(p_id), 'Root', IF(id IN (select p_id from tree), 'Inner', 'Leaf')) Type
from tree
order by id;
```
