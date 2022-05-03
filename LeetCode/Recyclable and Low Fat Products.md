ENUM 타입으로 칼럼 만들기
```sql
Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
Truncate table Products
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')
```

`Truncate`는 테이블의 전체 데이터를 drop 한 후 create 한다. 즉 초기화하는 효과가 있다.
반면 `Delete`는 특정 데이터만 선별하여 삭제한다.


두 개의 enum 타입이 모두 Y인 제품의 아이디 조회하기
```sql
SELECT
    product_id
FROM
    Products
Where
    low_fats = 'Y'
    and
    recyclable = 'Y';
```
