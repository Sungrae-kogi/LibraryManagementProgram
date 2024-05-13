<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.member.MemberDAO"%>
<%@ page import="com.library.web.member.MemberVO"%>
<%@ page import="java.sql.*" %>

<%
	String empno = request.getParameter("EMPNO");
	String pwd = request.getParameter("PWD");
	
	System.out.println("empno : " + empno);
	System.out.println("pwd : " + pwd);
	
	MemberVO vo = new MemberVO();
	vo.setEmpno(empno);	//사용자가 전달한 primary key
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.getMember(vo);
	
	if(member == null){
		RequestDispatcher dispatcher = request.getRequestDispatcher("/DaejinTest1/login.jsp");
		dispatcher.forward(request, response);
	}
	
	//메시지 출력
	if(member != null) {
		//empno 일치
		if(member.getEmpno().equals(empno)) {
			//pwd 일치 -> 로그인
			if(member.getPwd().equals(pwd)) {
				//사용자 ROLE 정보를 세션에 저장 - forward로 전달해주므로 그냥 session.getAttribute()로는 접근이 불가, request.getSession().getAttribute()로 header.jsp에서 접근하여 사용가능했음
				session.setAttribute("ROLE", member.getRole());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
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