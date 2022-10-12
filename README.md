# NewJSP

# ✔️2022.10.03 
> - DBConnection을 객체화하고 호출하여 중복되는 코드를 줄이는 코드 간결화 적용.
> - Vector 대신 단일 스레드 환경에서 보다 성능이 좋은 ArrayList로 수정 

</br>
</br>

# ✔️2022.10.04
> - 테이블 방식으로 게시글 리스트 출력
> - 게시글 번호 기능 추가
> - 게시글 리스트 내림차순으로 변경
 
 </br>
 </br>

 # ✔️2022.10.04
 
> - 게시판 작성 서블릿 수정

 </br>
 </br>

 # ✔️2022.10.06
 
#### 게시판 작성 기능 구현
>
> - @WebServlet 수정
> - boardPost() -> insertBoard()로 메서드명 변경
> - DB 로직 변경

 </br>
 </br>

 # ✔️2022.10.07
 
 #### 게시판 읽기 기능 구현
 >
 > - BoardDao.java에 DB 값을 dto에 담아주는 readBoard(String num) 메서드 생성
 > - boardRead.jsp에서 useBean 액션태그로 dto 객체를 bean으로 객체 생성, bean 객체에 readBoard(num)담고, 데이터 반환
 
 <br/>
 
 #### 게시판 수정 기능 구현
 >
 > - BoardDao.java에 수정된 값을 DB에 저장하는 updateBoard(String num) 메서드 생성
 > - boardUpdate.jsp에서 값을 수정하는 항목들 추가
 > - DB에 담겨져 있던 데이터를 bean = readBoard(num)으로 불러와서 각 항목에 반환(게시판 읽기 기능과 같은 방식)
 > - 클라이언트 요청을 처리하는 UpdateServlet.java 생성 dao.updateBoard(num) 호출 후 response.sendRedirect("boardRead.jsp?num="+num);로 수정된 결과를 확인하는 페이지로 이동

</br>
</br>

 # ✔️2022.10.09
 
 #### 게시판 삭제 기능 구현
 >
 > - servlet.java에서 num 파라미터 값을 boardDelete()메소드에 넘겨줌
 > - num 값에 해당하는 게시글 delete 쿼리문 실행
 
 #### 게시판 페이징 기능 구현
 >
 > - 페이징 관련 변수 생성
 > - Dao 쿼리문, 로직 수정(boardList(pageNum)), limit startNum, endNum;
 > - boardList에서 pageNum 생성 후 dao.boardList(pageNum)으로 보내줌
 > - pageNum이 String이면서 null 값이기 때문에 null 값일 때 "1";로 설정해준 뒤 int pageNum = Integer.parseInt(stPageNum)으로 설정해줘서 boardList(pageNum) 인자로 보내줌
 
</br>
</br>

 # ✔️2022.10.10

#### 게시판 페이징 기능 구현 완성
>
> - pageBlock, startPage, endPage, nextBlock, prevBlock, cnt(페이지 번호 개수)
> - BoardDao.java 파일에 게시글 개수를 반환하는 로직 추가
> - next, prev 버튼 구현

