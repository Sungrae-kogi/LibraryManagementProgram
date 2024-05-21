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
	
	//String 타입이 아닌 Date타입으로 변경하여 전달해야 오라클에서 적용이가능. java.sql.Date 클래스를 사용
	String indate = request.getParameter("IN_DT");
	Date sql_indate = Date.valueOf(indate);
	
	BooksDAO dao = new BooksDAO();
	BooksVO vo = new BooksVO();
	vo.setBook_id(bookid);
	vo.setDupl(dupl);
	vo.setTitle(title);
	vo.setIsbn(isbn);
	vo.setAuthor(author);
	vo.setIn_dt(sql_indate);
	
	dao.insertBook(vo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	dispatcher.forward(request,response);
%>