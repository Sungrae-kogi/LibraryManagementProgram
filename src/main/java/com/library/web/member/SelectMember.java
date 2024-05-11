package com.library.web.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.web.common.JDBCUtil;

public class SelectMember {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			
			//3. Statement 생성
			String sql = "select * from MEMBER";
			stmt = conn.prepareStatement(sql);
			
			
			//4. SQL 전송
			rs = stmt.executeQuery();
			
			//5. 조회 결과 사용
			System.out.println("ORACLE 에서 가져온 데이터");
			while(rs.next()) {
				System.out.print(rs.getString("EMPNO") + " : ");
				System.out.print(rs.getString("NM") + " : ");
				System.out.print(rs.getString("PWD") + " : ");
				System.out.println(rs.getString("ROLE"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}
}
