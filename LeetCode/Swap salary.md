한 테이블 안에서 enum 값을 서로 바꾸기

단 select를 사용하면 안 되고 `update`를 사용해야 한다.

`set`과 `case`를 이용하기
```sql
update salary
set
    sex = case sex
        when 'm' then 'f'
        else 'm'
    end;
```

`set`과 `if`를 이용하기
* 속도도 훨씬 빠르다
```sql
update salary set sex = if(sex = 'f', 'm', 'f');
```
