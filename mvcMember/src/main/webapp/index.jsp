<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name = (String)session.getAttribute("memName");
String id = (String)session.getAttribute("memId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<h3>Main</h3>
<hr>
<h5>
<% if (name==null || id ==null){ %>
<a href="mvcMember/member/writeForm.do">회원가입</a><br>
<a href="mvcMember/member/loginForm.do">로그인</a><br>
<%}else{ %>
<a href="mvcMember/member/logout.do">로그아웃</a><br>
<a href="mvcMember/board/boardWriteForm.do">글쓰기</a><br>
<%} %>
<a href="mvcMember/board/boardList.jsp?pg=1">목록</a><br>
</h5>
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