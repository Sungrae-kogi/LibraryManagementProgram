<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
    
<%
	String deleteBookId = request.getParameter("bookID");
	
	BooksDAO dao = new BooksDAO();
	dao.deleteBook(deleteBookId);
	
	response.sendRedirect("index.jsp");
%>