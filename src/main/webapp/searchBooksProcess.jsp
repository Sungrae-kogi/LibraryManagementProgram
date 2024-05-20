<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"%>

<%--header.jsp 에서 입력받은 사용자 정보(도서 검색정보)를 처리한뒤 index.jsp로 forward --%>
<%
//header에서 전달받은 정보
String searchfield = request.getParameter("searchField");
String searchtext = request.getParameter("searchText");

BooksDAO dao = new BooksDAO();
BooksVO vo = new BooksVO();

//검색 기록 정보 유지
session.setAttribute("searchField", searchfield);
session.setAttribute("searchText", searchtext);

//BooksDAO에서 오버로딩한 getBooksList 호출 -> 검색조건에 맞는 데이터를 불러옴
List<BooksVO> bookList = dao.getBooksList(searchfield,searchtext);

//HttpServletRequest 객체는 forward 메소드의 매개변수로 전달되며 서블릿 간의 정보공유가 가능 - document폴더의 '정보공유객체.txt'참고
request.setAttribute("searchedBookList", bookList);
RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
dispatcher.forward(request, response);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Book</title>
</head>
<body>

</body>
</html>