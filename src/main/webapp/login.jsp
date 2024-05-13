<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	
	<div class="container text-center main_div ">
		<h1 class="h3 mb-5 fw-normal">Please sign in</h1>
		<!-- 로그인정보 컬럼명 : EMPNO(교번) PWD(비밀번호) -->
		<form action="loginProcess.jsp" method="post" class="w-100 form-floating mb-1">
			<div class="mb-3">
				<input type="id" name="EMPNO" class="form-control" id="floatingInput"
					placeholder="Empno" required>
			</div>
			<div class="mb-3">
				<input type="password" name="PWD" class="form-control" id="floatingPassword"
					placeholder="Password">
			</div>
		<button class="w-100 btn btn-lg btn-primary mb-1" type="submit">로그인</button>
		</form>
		<a href="insertUser.html" class="w-100 btn btn-lg btn-primary">회원가입</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>