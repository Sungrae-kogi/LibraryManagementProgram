<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<%
	String updateBookId = request.getParameter("bookID");
	BooksDAO dao = new BooksDAO();
	
	
	BooksVO book = dao.getBook(updateBookId);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 수정</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header_insertBP.jsp"%>
	<div class="insertBook container">
		<div class="row">
			<h2>도서 정보 수정</h2>
			<hr>
			<form action="updateBookProcess.jsp" class="needs-validation" method="post" novalidate>
				<label for="BookId" class="form-label">도서 번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Bookid"
						id="BookId" name="BOOK_ID" value="<%=book.getBook_id() %>" required>
					<div class="invalid-feedback">도서 번호를 입력하세요.</div>
				</div>
				<label for="Dupl" class="form-label">복본 번호</label>
				<div class="input-group mb-3">
					<input type="number" class="form-control" placeholder="0" id="Dupl"
						min="0" max="99" name="DUPL" value="<%=book.getDupl()%>">
					<div class="invalid-feedback">0이상 100미만의 숫자만 입력하세요.</div>
				</div>
				<label for="Title" class="form-label">책 제목</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Title"
						id="Title" name="TITLE" value="<%=book.getTitle() %>" required>
					<div class="invalid-feedback">책 제목을 입력하세요.</div>
				</div>
				<label for="Isbn" class="form-label">ISBN</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Isbn"
						id="Isbn" name="ISBN" value="<%=book.getIsbn() %>" required>
					<div class="invalid-feedback">ISBN번호를 입력하세요.</div>
				</div>
				<label for="Author" class="form-label">저자</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Author"
						id="Author" name="AUTHOR" value="<%=book.getAuthor() %>" required>
					<div class="invalid-feedback">저자를 입력하세요.</div>
				</div>
				<label for="InDt" class="form-label">수서일</label>
				<div class="input-group mb-3">
					<input type="date" class="form-control" placeholder="Indt"
						id="InDt" name="IN_DT" value="<%=book.getIn_dt() %>" required>
					<div class="invalid-feedback">수서일을 입력하세요.</div>
				</div>
				<div class="d-flex flex-row-reverse">
				<button class="btn btn-primary text-right" type="submit">수정</button>
				<a href="viewBookStatus.jsp?bookID=<%=book.getBook_id() %>" class="btn btn-secondary mx-3" role="button">취소</a>
				</div>
			</form>
		</div>
	</div>
	<script>
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})();
	</script>
</body>
</html>