<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//loginProcess.jsp 처리 중 발생한 에러메시지. 없으면 null
String res = (String) request.getAttribute("loginErr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 대여 프로그램</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<div class="container text-center main_div ">
		<h1 class="h3 mb-5 fw-normal">도서 대여 프로그램</h1>
		<!-- 로그인정보 컬럼명 : EMPNO(교번) PWD(비밀번호) -->
		<form action="loginProcess.jsp" method="post"
			class="w-100 form-floating mb-1">
			<div class="mb-3">
				<input type="id" name="EMPNO" class="form-control"
					id="floatingInput" placeholder="Empno" required>
			</div>
			<div class="mb-3">
				<input type="password" name="PWD" class="form-control"
					id="floatingPassword" placeholder="Password">
			</div>
			<%if(res != null){ %>
			<div class="mb-3">
				<div class="alert alert-danger d-flex align-items-center" role="alert">
					<div><%=res %></div>
				</div>
			</div>
			<%} %>
			<button class="w-100 btn btn-lg btn-secondary mb-1" type="submit">로그인</button>
		</form>
		<a href="signup.jsp" class="w-100 btn btn-lg btn-secondary">회원가입</a>
	</div>


</body>
</html>