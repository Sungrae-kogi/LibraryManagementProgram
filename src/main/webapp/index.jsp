<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%@ page import="java.util.List"%>

<%
	if("ADMIN".equals((String) request.getSession().getAttribute("ROLE")) || "USER".equals((String) request.getSession().getAttribute("ROLE"))){
	
	}else{
		response.sendRedirect("login.jsp");
	}

	BooksVO vo = new BooksVO();

	BooksDAO bookDAO = new BooksDAO();
	List<BooksVO> bookList = null;
	
	//searchBooksProcess.jsp 에서 처리한 데이터 판별
	//로그인 시에는 attribute가 null이므로 전체 Book 데이타를 출력
	//header.jsp의 도서 검색창에서 검색한 결과를 request에 담고 forward로 넘어온 경우에는 attribute가 null이 아님
	Object attribute = request.getAttribute("searchedBookList");
	if(attribute == null){
		bookList = bookDAO.getBooksList();
	}else{
		bookList = (List<BooksVO>) attribute;
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getSession().getAttribute("ROLE") %>_Page</title>

</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header_index.jsp" %>
	<table class="table table-striped table-hover">
		<tr>
			<th class="book_center">BOOK_ID</th>
			<th class="book_center">DUPL</th>
			<th>TITLE</th>
			<th>ISBN</th>
			<th>AUTHOR</th>
			<th class="book_center">IN_DT</th>
		</tr>
		<%for(BooksVO book : bookList) {%>
			<tr onclick="location.href='/DaejinTest1/viewBookStatus.jsp?bookID=<%=book.getBook_id()%>'">
			<td class="book_center"><%=book.getBook_id() %></td>
			<td class="book_center"><%=book.getDupl() %></td>
			<td><%=book.getTitle() %></td>
			<td><%=book.getIsbn() %></td>
			<td><%=book.getAuthor() %></td>
			<td class="book_center"><%=book.getIn_dt() %></td>
			</tr>
		<%} %>
	</table>
	<footer> </footer>
	
</body>
</html>