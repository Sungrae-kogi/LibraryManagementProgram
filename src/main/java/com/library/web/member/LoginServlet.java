package com.library.web.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String empno = request.getParameter("EMPNO");
		String pwd = request.getParameter("PWD");
		System.out.println("입력한 EMPNO : "+empno);
		System.out.println("입력한 PWD : "+pwd);
		
		
		//2. DB 연동 처리
    	MemberVO vo = new MemberVO();
    	vo.setEmpno(empno);	//사용자가 전달한 primary key
    	
    	MemberDAO dao = new MemberDAO();
    	MemberVO member = dao.getMember(vo);	
    	
    	
    	//3. 응답 화면 구성
    	//응답 메시지에 대한 인코딩 설정
    	response.setContentType("text/html;charset=UTF-8");
    	//HTTP 응답 프로토콜 message-body와 연결된 출력 스트림 획득
    	PrintWriter out = response.getWriter();
    	
		
    	//메시지 출력
    	if(member != null) {
    		//pwd 일치
    		if(member.getPwd().equals(pwd)) {
    			//도서 목록 화면으로 포워딩한다.
    			RequestDispatcher dispatcher = request.getRequestDispatcher("/bookList");
    			dispatcher.forward(request, response);
    			
    		}else {
    			out.println("비밀번호 오류입니다. <br>");
    			out.println("<a href='/DaejinTest1/index.html'>다시 로그인</a>");
    		}
    	}else {
    		//교번 오류상황을 냈을때 여기가 실행안되고 getPwd()가 null값이라는 에러가 발생 해결해야함 ******
    		out.println("교번 오류입니다. <br>");
    		out.println("<a href='/DaejinTest1/index.html'>다시 로그인</a>");
    	}
		
	}

}
