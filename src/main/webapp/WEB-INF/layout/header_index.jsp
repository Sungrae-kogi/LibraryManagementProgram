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
	
	.book_center {
		text-align: center;
	}
	
	.table {
		margin-top: 45px;
		padding-top: 45px;
		cursor: pointer;
	}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	
	
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