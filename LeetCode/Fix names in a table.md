테이블에 있는 모든 이름을 첫 문자는 대문자, 나머지는 소문자가 되도록 바꾸기
아이디 오름차순으로 정렬하여 반환하라

문자열 합치기 `concat`를 이용하기
* substring(field, num)을 이용해서 문자열 자르기, 왼쪽에서부터 `[num~]` num번째 문자부터 마지막까지 추출
* substring(filed, num1, num2)를 하면 왼쪽에서부터 `[num1~num2]` 까지 문자열 추출하기
* left(field, num) 혹은 right(field, num)은 왼쪽 혹은 오른쪽에서 num개 만큼의 문자열 추출
* lower와 upper를 사용해서 문자열 대문자/소문자로 바꾸기


수학에서 수의 범위를 표현하는 방법
* 이상, 이하 - [, ]    ※ 시작 또는 끝의 숫자를 포함
* 초과, 미만 - (, )    ※ 시작 또는 끝의 숫자를 제외

```sql
select user_id, concat(upper(left(name,1)), lower(substring(name, 2))) as name from users order by user_id; 
```
left를 쓰는 이유는, substring(name, 1, 2)를 하게 되면 앞에서부터 두 글자가 포함되기 때문이다.
