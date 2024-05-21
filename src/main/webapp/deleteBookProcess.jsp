<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>   
    
<%
	String deleteBookId = request.getParameter("bookID");
	
	BooksDAO dao = new BooksDAO();
	dao.deleteBook(deleteBookId);
	
	response.sendRedirect("index.jsp");
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