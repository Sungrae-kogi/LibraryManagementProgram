<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#selectoption {
		border-radius: 5px;
		margin-right: 3px;
		font-family: "Helvetica Nene", Helvetica, Arial, sans-serif;
		color: #333;
		background-color: #fff;
	}
</style>

<nav class="navbar navbar-dark bg-dark p-1 fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand"><%=request.getSession().getAttribute("ROLE") %></a>
    <form class="d-flex" action="searchBooksProcess.jsp" method="get">
    	<select name="searchField" id="selectoption">
    		<option value="all">전체</option>
    		<option value="bookId">도서 번호</option>
    		<option value="bookTitle">제목</option>
    		<option value="bookAuthor">저자</option>
    	</select>
      <input class="form-control me-2" type="text" name="searchText" placeholder="Search" aria-label="Search">
      <button type="submit" class="btn btn-secondary">Search</button>
    </form>
  </div>
</nav>