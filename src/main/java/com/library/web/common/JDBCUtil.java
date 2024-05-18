package com.library.web.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			//1. 드라이버 객체 로딩
			DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			
			//2. 커넥션 연결		**주의!!!!** 노트북에서는 1525 port사용중 회사에서는 1521 이거때문에 한참시간날림 오고가고 작업할때 확인필수
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1525:orcl";
			conn = DriverManager.getConnection(jdbcUrl, "c##sungrae", "1234");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(PreparedStatement stmt, Connection conn) {
		//5. 연결 해제
		try {
			stmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		//5. 연결 해제
		try {
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		try {
			stmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		try {
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
