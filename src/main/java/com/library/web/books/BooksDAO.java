package com.library.web.books;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	private String BOOK_IDSEARCH = "SELECT * FROM BOOKS WHERE BOOK_ID=?";
	private String BOOK_TITLESEARCH = "SELECT * FROM BOOKS WHERE TITLE=?";
	private String BOOK_AUTHORSEARCH = "SELECt * FROM BOOKS WHERE AUTHOR=?";
	private String BOOK_DUPLLIST = "SELECT * FROM (SELECT * FROM BOOKS WHERE TITLE = ?) WHERE DUPL != ?";
	private String BOOK_INSERT = "INSERT INTO BOOKS(BOOK_ID, DUPL, TITLE, ISBN, AUTHOR, IN_DT) VALUES (?, ?, ?, ?, ?, ?)";
	private String BOOK_UPDATE = "UPDATE BOOKS SET BOOK_ID = ?, DUPL = ?, TITLE = ?, ISBN = ?, AUTHOR = ?, IN_DT = ? WHERE BOOK_ID = ?";
	private String BOOK_DELETE = "DELETE FROM BOOKS WHERE BOOK_ID=?";
	
	
	//출력테스트용 query
	private String BOOK_GET = "SELECT * FROM BOOKS WHERE trim(BOOK_ID)=?";
	
	
	// 도서 하나 검색
	public BooksVO getBook(String bookid) {
		BooksVO book = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_IDSEARCH);
			stmt.setString(1, bookid);
			rs = stmt.executeQuery();
			while(rs.next()) {
				book = new BooksVO();
				book.setBook_id(rs.getString("BOOK_ID"));
				book.setDupl(rs.getInt("DUPL"));
				book.setTitle(rs.getString("TITLE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setIn_dt(rs.getDate("IN_DT"));
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
	
	// 도서 정보 검색(도서 목록 검색 오버로딩)
	public List<BooksVO> getBooksList(String searchfield, String searchtext){
		List<BooksVO> bookList = new ArrayList<BooksVO>();
		try {
			conn = JDBCUtil.getConnection();
			if(searchfield.equals("bookId")) {
				stmt = conn.prepareStatement(BOOK_IDSEARCH);
				stmt.setString(1, searchtext);
			}else if(searchfield.equals("bookTitle")) {
				stmt = conn.prepareStatement(BOOK_TITLESEARCH);
				stmt.setString(1, searchtext);
			}else if(searchfield.equals("bookAuthor")) {
				stmt = conn.prepareStatement(BOOK_AUTHORSEARCH);
				stmt.setString(1, searchtext);
			}else {
				//모든 도서 검색조건
				stmt = conn.prepareStatement(BOOKS_LIST);
			}
			rs = stmt.executeQuery();
			while(rs.next()) {
				BooksVO book = new BooksVO();
				book.setBook_id(rs.getString("BOOK_ID"));
				book.setDupl(rs.getInt("DUPL"));
				book.setTitle(rs.getString("TITLE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setIn_dt(rs.getDate("IN_DT"));
				bookList.add(book);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return bookList;
	}
 
	//도서 복본 검색
	public List<BooksVO> getBooksList(int book_dupl, String book_title){
		List<BooksVO> bookList = new ArrayList<BooksVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_DUPLLIST);
			stmt.setString(1, book_title);
			stmt.setInt(2, book_dupl);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				BooksVO book = new BooksVO();
				book.setBook_id(rs.getString("BOOK_ID"));
				book.setDupl(rs.getInt("DUPL"));
				book.setTitle(rs.getString("TITLE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setIn_dt(rs.getDate("IN_DT"));
				bookList.add(book);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return bookList;
	}
	
	//도서 입력
	public void insertBook(BooksVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_INSERT);
			stmt.setString(1, vo.getBook_id());
			stmt.setInt(2, vo.getDupl());
			stmt.setString(3, vo.getTitle());
			stmt.setString(4, vo.getIsbn());
			stmt.setString(5, vo.getAuthor());
			stmt.setDate(6, vo.getIn_dt());
			stmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//도서 수정
	public int updateBook(BooksVO vo) {
		int result = -1;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_UPDATE);
			
			stmt.setString(1, vo.getBook_id());
			stmt.setInt(2, vo.getDupl());
			stmt.setString(3, vo.getTitle());
			stmt.setString(4, vo.getIsbn());
			stmt.setString(5, vo.getAuthor());
			stmt.setDate(6, vo.getIn_dt());
			stmt.setString(7, vo.getBook_id());
			
			result = stmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
		}
		return result;
	}
	
	//도서 삭제
	public void deleteBook(String bookid) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_DELETE);
			stmt.setString(1, bookid);
			stmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
			
		}
	}
	
}
