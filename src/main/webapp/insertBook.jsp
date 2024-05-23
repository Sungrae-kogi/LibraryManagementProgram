<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.books.BooksDAO"%>
<%@ page import="com.library.web.books.BooksVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 정보 입력</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/layout/header_insertBP.jsp"%>
	<div class="insertBook container">
		<div class="row">
			<h2>신규 도서 입력</h2>
			<hr>
			<form action="insertBookProcess.jsp" class="needs-validation" method="post" novalidate>
				<label for="BookId" class="form-label">도서 번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Bookid"
						id="BookId" name="BOOK_ID" required>
					<div class="invalid-feedback">도서 번호를 입력하세요.</div>
				</div>
				<label for="Dupl" class="form-label">복본 번호</label>
				<div class="input-group mb-3">
					<input type="number" class="form-control" placeholder="0~99" id="Dupl"
						min="0" max="99" name="DUPL">
					<div class="invalid-feedback">0이상 100미만의 숫자만 입력하세요.</div>
				</div>
				<label for="Title" class="form-label">책 제목</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Title"
						id="Title" name="TITLE" required>
					<div class="invalid-feedback">책 제목을 입력하세요.</div>
				</div>
				<label for="Isbn" class="form-label">ISBN</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Isbn"
						id="Isbn" name="ISBN" required>
					<div class="invalid-feedback">ISBN번호를 입력하세요.</div>
				</div>
				<label for="Author" class="form-label">저자</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Author"
						id="Author" name="AUTHOR" required>
					<div class="invalid-feedback">저자를 입력하세요.</div>
				</div>
				<label for="InDt" class="form-label">수서일</label>
				<div class="input-group mb-3">
					<input type="date" class="form-control" placeholder="Indt"
						id="InDt" name="IN_DT" required>
					<div class="invalid-feedback">수서일을 입력하세요.</div>
				</div>
				<div class="d-flex flex-row-reverse">
				<button class="btn btn-primary text-right" type="submit">입력</button>
				<a href="index.jsp" class="btn btn-secondary mx-3" role="button">취소</a>
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