날짜별로 날짜와 판매한 상품의 개수, 상품의 이름 목록을 출력하라.

`group_concat`를 이용해서 서로 다른 출력 결과를 한 줄에 보여줄 수 있다.
* 일반적으로 `,` 로 구분되어 출력되며 만약 구분자를 직접 설정하고 싶다면 `group_concat(field, sperate 구분자)`를 이용한다.
* 합쳐지는 문자열에 중복되는 문자열을 제거하고 싶다면 필드명 앞에 `distinct()`를 붙여준다.

`count`를 사용하여 값의 수를 셀 때도 같은 값을 중복으로 세는 걸 방지하고 싶다면 `distinct()`를 붙여준다.

```sql
SELECT sell_date, COUNT(distinct(product)) AS num_sold,
GROUP_CONCAT(DISTINCT(product) ORDER BY product SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
```

