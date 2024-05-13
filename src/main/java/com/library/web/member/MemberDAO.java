package com.library.web.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.web.common.JDBCUtil;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// MEMBER 관련 SQL 명령어
	private String MEMBER_LIST = "SELECT * FROM MEMBER";
	private String MEMBER_INSERT = "INSERT INTO MEMBER VALUES(?, ?, ?, ?)";
	private String MEMBER_GET = "SELECT EMPNO, PWD, ROLE FROM MEMBER WHERE empno = ?";

	// MEMBER 관련 CRUD
	// 관리자 목록 조회
	public void getMemberList() {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_LIST);
			rs = stmt.executeQuery();
			System.out.println("Oracle에서 가져온 MEMBER 목록");
			while (rs.next()) {
				System.out.print(rs.getString("EMPNO") + " : ");
				System.out.print(rs.getString("NM") + " : ");
				System.out.print(rs.getString("PWD") + " : ");
				System.out.println(rs.getString("ROLE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}

	// 회원 가입
	public void insertMember(String empno, String nm, String pwd, String role) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, empno);
			stmt.setString(2, nm);
			stmt.setString(3, pwd);
			stmt.setString(4, role);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 로그인 정보 조회 - 개인을 식별할 EMPNO와 PWD 정보만 있으면 충분 
	public MemberVO getMember(MemberVO vo) {
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getEmpno());
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberVO(); 
				member.setEmpno(rs.getString("EMPNO"));
				member.setPwd(rs.getString("PWD"));
				member.setRole(rs.getString("ROLE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}

}
