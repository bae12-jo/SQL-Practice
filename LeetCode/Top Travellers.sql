// sub-query with ifnull
select u.name, (select ifnull(sum(r.distance),0)
                from rides r
                where u.id = r.user_id) as travelled_distance
from users u
order by travelled_distance desc, name asc

// left outer join with ifnull
select u.name, ifnull(sum(r.distance),0) as travelled_distance
from users u left outer join rides r
on u.id = r.user_id
group by u.name
order by travelled_distance desc, name asc
