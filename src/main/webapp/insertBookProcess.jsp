<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.sql.*" %>
<%
	//insertBook.jsp에서 전달받은 데이터
	String bookid = request.getParameter("BOOK_ID");
	int dupl = Integer.parseInt(request.getParameter("DUPL"));
	String title = request.getParameter("TITLE");
	String isbn = request.getParameter("ISBN");
	String author = request.getParameter("AUTHOR");
	String indate = request.getParameter("IN_DT");
	
	//String 타입이 아닌 Date타입으로 변경하여 전달해야 오라클에서 적용이가능. java.sql.Date 클래스를 사용
	Date sql_indate = Date.valueOf(indate);
	System.out.println("sql-indate : "+sql_indate);
	
	BooksDAO dao = new BooksDAO();
	dao.InsertBook(bookid,dupl,title,isbn,author,sql_indate);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	dispatcher.forward(request,response);
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