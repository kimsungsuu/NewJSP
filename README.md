# 📌 JSP & Servlet

## 1. 프로젝트 설명
> JSP & Servlet, Model2(MVC) 방식으로 게시판을 만들면서 웹 개발 기초를 다졌습니다.

</br>

## 2. 프로젝트 상세ㅇ
> - CRUD
> - 등록 및 수정시 메시지 출력(alert)
> - 페이징
> - 검색
> - 웹 개발 환경설정(Tomcat, DBConnection, web.xml)
> - MVC2(Model2) 방식으로 객체 분리
> - MySQL을 사용하여 데이터 관리
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
> - HttpServletRequest에 대한 이해 부족으로 인해 board id 값(num)이 null로 넘어오는 문제 발생.
>   - hidden type으로 num 값을 넘겨줘야 한다는 사실을 깨닫고 문제 해결
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/4834392fde7e6ae998e1902210b25d25847c4b72/NewJSP/src/main/webapp/boardRead.jsp#L37)
> - pageNum 값을 초기화하지 못하는 문제 발생.
>   - pageNum을 파라미터로 받아올 때 존재하지 않는 값이기 때문에 null로 넘어온다. 
>   - 따라서 null 값으로 넘어온 pageNum 값을 1로 초기화하여 service 로직 클래스인 dao로 전달
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/20715798a86b01a80032008dc579afe6da8d9182/NewJSP/src/main/webapp/boardList.jsp#L42)
> - 게시글 상세 보기에서 목록을 클릭하면 항상 1페이지로 이동하는 개선점 발견
>   -  게시글 목록 -> 상세 페이지로 넘어갈 때 pageNum을 hidden 값으로 보내주고, 목록 버튼에 pageNum 값을 추가
>   - [상세 코드](https://github.com/ksungsu/NewJSP/blob/79b542389b2182c011cce52d7cdc40732de7b85e/NewJSP/src/main/webapp/boardList.jsp#L66)

* * *

</br>

## 6. 기타 백엔드 개발
> - Model2 방식을 이용한 게시판 개발
>   - Dto, Dao, JSP, Servlet을 분리하는 MVC 방식
> - 웹개발의 A - Z까지 직접 구현
>   - 서블릿환경 직접 구축(톰캣, DB 연결, HttpServeltRequest 메소드.. 등)
>   - 비즈니스 로직 직접 구현
>   - MySQL 쿼리 작성, DB 데이터 주입 및 호출.. 등
 

* * *

</br>

## 7. 회고/ 느낀점
> - 생에 처음으로 개인 프로젝트를 진행하면서 막히는 부분이 굉장히 많았습니다. 폰트가 깨지는 문제, 링크 이동이 안되는 문제, parameter 값을 불러오지 못하는 문제.. 등
>   - 하지만 결국 해결해내면서 정말 많은 것을 배웠습니다.
> - "필요에 의한 공부"가 개발 공부법에 가장 적합한 방식이라는 것도 깨닫게 되었습니다.
> - 웹 개발의 시초 격인 JSP 와 Servlet 방식으로 개발해 보면서 JSP 방식과 Spring은 구현 과정이 다를 뿐 구하고자 하는 목표점은 유사하다는 걸 깨닫게 되었습니다. 
> - 웹 개발은 결국 기본기가 탄탄해야 앞으로 나아갈 수 있는 힘이 길러진다는 걸 깨달았고 기본기를 반복해서 연습하고 공부하고 있습니다. 
> - 끝으로 JSP & Servlet을 이용한 게시판 프로젝트는 제게 웹 개발 기본기를 다지게 해준 아주 소중한 프로젝트라고 생각합니다.
