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

//넘어오는거 확인 완료
System.out.println("searchfield : " + searchfield);
System.out.println("searchtext : " + searchtext);

BooksDAO dao = new BooksDAO();
BooksVO vo = new BooksVO();

//BooksDAO에서 오버로딩한 getBooksList 호출 -> 검색조건에 맞는 데이터를 불러옴
List<BooksVO> bookList = dao.getBooksList(searchfield,searchtext);

/*
for (BooksVO book : bookList) {
	System.out.print("BookId : " + book.getBook_id());
	System.out.print("Dupl : " + book.getDupl());
	System.out.print("Title : " + book.getTitle());
	System.out.print("Isbn : " + book.getIsbn());
	System.out.print("Author : " + book.getAuthor());
	System.out.println("In_dt : " + book.getIn_dt());
}
*/

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