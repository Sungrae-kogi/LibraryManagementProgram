<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.member.MemberDAO"%>
<%@ page import="com.library.web.member.MemberVO"%>
<%@ page import="java.sql.*" %>

<%
	//사용자 입력 로그인정보(교번, 비밀번호) 전달확인
	String empno = request.getParameter("EMPNO");
	String pwd = request.getParameter("PWD");
	
	MemberVO vo = new MemberVO();

	vo.setEmpno(empno);	//사용자가 전달한 primary key
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.getMember(vo);
	RequestDispatcher dispatcher = null;
	
	//메시지 출력
	if(member != null) {
		//empno 일치
		if(member.getEmpno().equals(empno)) {
			//pwd 일치 -> 로그인
			if(member.getPwd().equals(pwd)) {
				//사용자 ROLE 정보를 세션에 저장 - forward로 전달해주므로 그냥 session.getAttribute()로는 접근이 불가, request.getSession().getAttribute()로 header.jsp에서 접근하여 사용가능했음
				session.setAttribute("ROLE", member.getRole());
				session.setAttribute("EMPNO", member.getEmpno());
				session.setMaxInactiveInterval(60*60*10);
				
				response.sendRedirect("index.jsp");
			//pwd 불일치 -> 로그인화면
			}else {
				dispatcher = request.getRequestDispatcher("login.jsp");
				request.setAttribute("loginErr", "아이디 또는 비밀번호가 일치하지않습니다.");
				dispatcher.forward(request, response);
			}
			
		}else {
			dispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("loginErr", "아이디 또는 비밀번호가 일치하지않습니다.");
			dispatcher.forward(request, response);
			
		}
			
	}else {
		dispatcher = request.getRequestDispatcher("login.jsp");
		request.setAttribute("loginErr", "아이디 또는 비밀번호가 일치하지않습니다.");
		dispatcher.forward(request,response);
		
	}
%>
