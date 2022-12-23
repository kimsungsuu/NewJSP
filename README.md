# 📌 JSP & Servlet

## 1. 프로젝트 설명
> JSP & Servlet, Model2(MVC) 방식으로 게시판을 만들면서 웹 개발 기초 다지기

</br>

## 2. 주요 기능
> - CRUD
> - 등록 및 수정시 메시지 출력(alert)
> - 페이징
> - 검색
<details>
  <summary>핵심 기능 상세 내용</summary>
  ✔️ dao를 이용한 service 로직 분리
  <a href="https://github.com/ksungsu/NewJSP/blob/main/NewJSP/src/main/java/dao/BoardDao.java"> 📌 코드 확인</a>
</details>

* * *

</br>

## 3. 기술 스택
> - Java 11
> - JSP 4.0
> - Servlet 
> - MySQL 8.0

* * *

</br>

## 4. ERD 설계
<img width="473" alt="jsp 게시판 erd" src="https://user-images.githubusercontent.com/90013342/209227060-fa40bbc8-534b-4e07-b9c6-c9f8faba7be4.png">

* * *

</br>

## 5. 핵심 문제 해결
> - HttpServletRequest에 대한 이해부족으로 인해 board id 값(num)이 null로 넘어오는 문제 발생.
>   - hidden type으로 num 값을 넘겨줘야 한다는 사실을 깨닫고 문제 해결
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/4834392fde7e6ae998e1902210b25d25847c4b72/NewJSP/src/main/webapp/boardRead.jsp#L37)
> - pageNum 값을 초기화하지 못하는 문제 발생.
>   - pageNum을 파라미터로 받아올 때 존재하지 않는 값이기 때문에 null로 넘어온다. 
>   - 따라서 null 값으로 넘어온 pageNum 값을 1로 초기화하여 service 로직 클래스인 dao로 전달
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/20715798a86b01a80032008dc579afe6da8d9182/NewJSP/src/main/webapp/boardList.jsp#L42)
> - 게시글 상세보기에서 목록을 클릭하면 항상 1페이지로 이동하는 개선점 발견
>   -  게시글 목록 -> 상세 페이지로 넘어갈 때 pageNum을 hidden 값으로 보내주고, 목록 버튼에 pageNum 값을 추가
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/79b542389b2182c011cce52d7cdc40732de7b85e/NewJSP/src/main/webapp/boardList.jsp#L66)
 

* * *

</br>

## 7. 회고/느낀점
> - 생에 처음으로 개인 프로젝트를 만들어보면서 정말 많은 것을 배운 것 같다. 
> - "필요에 의한 공부"가 개발 공부법에 가장 적합한 방식이라는 것도 깨닫게 되었다.
> - JSP 와 Servlet이라는 오래 전에 쓰였던 웹 개발 방식으로 개발해보면서 지금 Spring과 JSP & Servlet은 서로 다르지만 유사한 면모가 분명히 있다는 점도 알게되었다.
> - 웹 개발은 결국 기본기가 탄탄해야 앞으로 나아갈 수 있는 힘이 길러진다는걸 깨닫고 기본기를 반복해서 연습하고 공부하고 있다. 
> - 끝으로. JSP & Servlet을 이용한 게시판 프로젝트는 내게 웹 개발 기본기를 다지게 해준 아주 소중한 프로젝트라고 생각한다.
