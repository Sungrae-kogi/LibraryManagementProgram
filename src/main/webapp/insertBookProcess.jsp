<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeParseException" %>
<%@ page import="java.sql.*" %>
<%
	LocalDate indt = null;
	//insertBook.jsp에서 전달받은 데이터
	String bookid = request.getParameter("BOOK_ID");
	int dupl = Integer.parseInt(request.getParameter("DUPL"));
	String title = request.getParameter("TITLE");
	String isbn = request.getParameter("ISBN");
	String author = request.getParameter("AUTHOR");
	
	//서버 측 폼 데이터 검사의 일부
	try{
		indt = LocalDate.parse(request.getParameter("IN_DT"));
	}catch(DateTimeParseException e){
		System.out.println("INDT 파싱 중 오류");
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>