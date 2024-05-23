<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%
	String rentBookId = request.getParameter("bookID");
	String rentEmpNo = request.getParameter("empNo");
	
	System.out.println("대여할 도서 id : " + rentBookId);
	System.out.println("대여자 empno : " + rentEmpNo);
	
	BooksDAO dao = new BooksDAO();
	
	dao.rentBook(rentBookId, rentEmpNo);
	
	response.sendRedirect("index.jsp");
%>