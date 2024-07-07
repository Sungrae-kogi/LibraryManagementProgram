<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.library.web.member.MemberDAO"%>
<%@ page import="com.library.web.member.MemberVO"%>
<%@ page import="java.sql.*" %>

<%
	//사용자 입력 로그인정보(교번, 비밀번호) 전달확인
	String empno = request.getParameter("EMPNO");
	String pwd = request.getParameter("PWD");
	
	/*
	24-07-07 수정사항
	VO 객체는 불변객체이므로, Setter를 가지지 않아, 애초에 값을 부여하려면 생성자를 이용해 값을 지정해줘야 한다.
	따라서 이 부분은 잘못된 코드로
	MemberVO vo = new MemberVO(empno, pwd)와 같은 방식으로 인자를 전달하여 생성자를 통해 객체를 생성해줘야 한다, 
	*/
	
	MemberVO vo = new MemberVO();
	vo.setEmpno(empno);	//사용자가 전달한 primary key	- 이렇게 불변객체인 VO를 setter를 사용하여 값을 할당하면 안된다는것.
	

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
