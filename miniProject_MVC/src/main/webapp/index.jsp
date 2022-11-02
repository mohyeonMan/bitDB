<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style type="text/css">
html{
	margin:0 auto;
	paddin:0;
	width:1000px;
}
body {
   margin: 0;
   padding: 0;
   height: 100%;
   border:1px;
}

#header {
   height: 10%;
   text-align: center;
}

#container {
   margin: auto;
   width: 1000px;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   width: 25%;
   height: 100%;
   float: left;
}

#section {
   width: 70%;
   height: 100%;
   float: left;
}

#footer {
   width: 1700px;
   height: 10%;
}
</style>
</head>
<body>
	<div id="header">
		<h1>
		<img src="/miniProject_MVC/img/cww.jpg" width="70" height="90" style="cursor: pointer;"
		 onclick ="location.href='/miniProject_MVC/index.jsp'">MVC를 이용한 프로젝트
		</h1>  <!-- 주소가 바뀌기때문에 절대주소 필요 -->
		
		<jsp:include page="./main/menu.jsp"></jsp:include>
	</div>
	
	<div id="container">
	
		<div id="nav">
		<!-- nav 로그인, 회원가입 -->
		<jsp:include page="./main/nav.jsp"></jsp:include>
		</div>
		<div id="section">
			<c:if test="${empty display}"> <!-- display == null 불가능. 값을 아예 안가진다. -->
			<h1>
				어서오세요<br>
				<img src="/miniProject_MVC/img/cww.jpg">
			</h1>
			</c:if>
			<c:if test="${not empty display}">
			<jsp:include page="${display }"></jsp:include>
			</c:if>
			
		</div>
		
	</div>
	
	<div id="footer">
	</div>

</body>
</html>

<!-- 
1.

(if문 사용)
세션이 존재 
-로그아웃
-글쓰기
-목록

세션이 없을때
-회원가입
-로그인
-목록

2.

세션 등록 - 로그인 성공시
-memId;
-memName
-memEmail => ~~@~~.com

3.
Folder 	:	board
file 	: 	boardWriteForm.jsp		--글쓰기 , 제목, 내용 ,버튼으로 글쓰기 ,다시작성. 유효성검사.boardWritecheck()
			boardWrite.jsp			--작성하신 글을 저장하였습니다. (실패x)
package	: 	board.dao
class	:	BoardDAO.java
			boardMapper.xml	
package	:	board.bean
class	:	BoardDTO.java




테이블
CREATE TABLE board(
     seq NUMBER NOT NULL,               -- 글번호 (시퀀스 객체 이용)
     id VARCHAR2(20) NOT NULL,           -- 아이디
     name VARCHAR2(40) NOT NULL,       -- 이름
     email VARCHAR2(40),                  -- 이메일
     subject VARCHAR2(255) NOT NULL,    -- 제목
     content VARCHAR2(4000) NOT NULL,   -- 내용 

     ref NUMBER NOT NULL,                 -- 그룹번호 (글번호와 똑같은값) 외래키.
     lev NUMBER DEFAULT 0 NOT NULL,     -- 단계
     step NUMBER DEFAULT 0 NOT NULL,    -- 글순서
     pseq NUMBER DEFAULT 0 NOT NULL,    -- 원글번호
     reply NUMBER DEFAULT 0 NOT NULL,   -- 답변수

     hit NUMBER DEFAULT 0,              -- 조회수
     logtime DATE DEFAULT SYSDATE
 );

시퀀스 객체
CREATE SEQUENCE seq_board  NOCACHE NOCYCLE;
 -->