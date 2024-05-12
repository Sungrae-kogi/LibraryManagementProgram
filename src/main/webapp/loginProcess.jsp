<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.member.MemberDAO"%>
<%@ page import="com.library.web.member.MemberVO"%>

<%
	String empno = request.getParameter("EMPNO");
	String pwd = request.getParameter("PWD");
	
	MemberVO vo = new MemberVO();
	vo.setEmpno(empno);	//사용자가 전달한 primary key
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.getMember(vo);
	
	
	//메시지 출력
	if(member != null) {
		//empno 일치
		if(member.getEmpno().equals(empno)) {
			//pwd 일치 -> 로그인
			if(member.getPwd().equals(pwd)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/bookList");
				dispatcher.forward(request, response);
			//pwd 불일치 -> 로그인화면
			}else {
				out.println("비밀번호 오류입니다. <br>");
				out.println("<a href='/DaejinTest1/login.jsp'>다시 로그인</a>");
			}
			
		}else {
			out.println("교번 오류입니다. <br>");
			out.println("<a href='/DaejinTest1/login.jsp'>다시 로그인</a>");
		}
			
	}else {
		response.sendRedirect("/DaejinTest1/login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>