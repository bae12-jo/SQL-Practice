A, B, C 상점마다 각각 다른 가격을 상점 이름, 가격으로 반환하라
다만 이때 해당 상점에 제품이 없는 경우 (null)인 경우 결과에 포함하지 않는다.

`union all` 을 이용해서 쿼리 결합 결과를 합친다. 
* 이때 all이 붙으면 중복을 제거하지 않는다.
* not null을 이용해서 null인 값은 포함하지 않는다.

```sql
select product_id, 'store1' as store, store1 as price
from products
where store1 is NOT NULL

union all

select product_id, 'store2' as store, store2 as price
from products
where store2 is NOT NULL

union all

select product_id, 'store3' as store, store3 as price
from products
where store3 is NOT NULL
```

`union`을 이용하는 방법
* 각 상점이 비어 있는 경우를 제외하고 쿼리를 실행한 뒤 union으로 결합한다.
* 의미상으로는 union all이 맞지만 애초에 중복된 레코드가 존재할 수 없으므로 union을 써도 무방하다.

```sql
  SELECT PRODUCT_ID, 'store1' AS STORE, STORE1 AS PRICE
    FROM PRODUCTS
   WHERE STORE1 IS NOT NULL    
   UNION
  SELECT PRODUCT_ID, 'store2' AS STORE, STORE2 AS PRICE
    FROM PRODUCTS
   WHERE STORE2 IS NOT NULL    
   UNION
  SELECT PRODUCT_ID, 'store3' AS STORE, STORE3 AS PRICE
    FROM PRODUCTS
   WHERE STORE3 IS NOT NULL
```

`information schema`를 이용하는 방법
```sql
SELECT A.product_id, B.COLUMN_NAME as store,
CASE
    WHEN B.COLUMN_NAME = "store1" THEN store1
    WHEN B.COLUMN_NAME = "store2" THEN store2
    WHEN B.COLUMN_NAME = "store3" THEN store3
END AS price
FROM Products A, INFORMATION_SCHEMA.COLUMNS B
  WHERE table_name = 'Products' AND column_name != "product_id"
  HAVING price IS NOT NULL
```
