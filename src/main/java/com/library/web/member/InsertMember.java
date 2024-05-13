package com.library.web.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.library.web.common.JDBCUtil;

public class InsertMember {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = JDBCUtil.getConnection();
			
			//3. Statement생성
			String sql = "insert into MEMBER values(?, ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			//4. SQL 전송
			stmt.setString(1, "2245021");
			stmt.setString(2, "조성래");
			stmt.setString(3, "246810");
			stmt.setString(4, "ADMIN");
			
			int count = stmt.executeUpdate();
			System.out.println(count + " 건 처리 성공!");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}
