package com.library.web.books;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.web.common.JDBCUtil;
import com.library.web.member.MemberVO;

public class BooksDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// Books 관련 SQL 명령어
	private String BOOKS_LIST = "SELECT * FROM BOOKS";
	private String BOOK_GET = "SELECT * FROM BOOKS WHERE BOOK_ID=?";
	
	// 도서 하나 검색
	public BooksVO getBook(BooksVO vo) {
		BooksVO book = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_GET);
			stmt.setString(1, vo.getBook_id());
			rs = stmt.executeQuery();
			while(rs.next()) {
				book = new BooksVO(); 
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return book;
	}
	
	
	// 도서 목록 검색
	public List<BooksVO> getBooksList() {
		List<BooksVO> bookList = new ArrayList<BooksVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOKS_LIST);
			rs = stmt.executeQuery();
			// rs.next()로 행을 찾는대로 데이터들을 할당해서 List에 add
			while (rs.next()) {
				BooksVO book = new BooksVO();
				book.setBook_id(rs.getString("BOOK_ID"));
				book.setDupl(rs.getInt("DUPL"));
				book.setTitle(rs.getString("TITLE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setIn_dt(rs.getDate("IN_DT"));
				bookList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return bookList;
	}

}
