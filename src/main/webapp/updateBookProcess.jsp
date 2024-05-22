<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.sql.*"%>
<%
	String bookid = request.getParameter("BOOK_ID");
	int dupl = Integer.parseInt(request.getParameter("DUPL"));
	String title = request.getParameter("TITLE");
	String isbn = request.getParameter("ISBN");
	String author = request.getParameter("AUTHOR");

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
	
	int result = dao.updateBook(vo);
	
	
	if(result == -1){
		System.out.println("Update 실패했습니다");
	}else if(result == 0){
		System.out.println("Update를 실행했으나 변경된 행이없습니다.");
	}else{
		System.out.println("Update에 성공했습니다.");
	}
	
	response.sendRedirect("index.jsp");
%>