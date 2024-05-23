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

	// BOOKS 관련 SQL 명령어
	// BOOKS 조회
	private String BOOKS_LIST = "SELECT * FROM BOOKS";
	private String BOOK_DUPLLIST = "SELECT * FROM (SELECT * FROM BOOKS WHERE TITLE = ?) WHERE DUPL != ?";
	private String BOOK_IDSEARCH = "SELECT * FROM BOOKS WHERE BOOK_ID=?";
	private String BOOK_TITLESEARCH = "SELECT * FROM BOOKS WHERE TITLE=?";
	private String BOOK_AUTHORSEARCH = "SELECT * FROM BOOKS WHERE AUTHOR=?";
	//BOOKS, RENT 조인정보
	private String BOOK_JOIN_RENT = "SELECT B.BOOK_ID, B.DUPL, B.TITLE, B.ISBN, B.AUTHOR, B.IN_DT, B.IS_RENTABLE, R.RET_DT FROM BOOKS B, RENT R WHERE B.BOOK_ID = R.BOOK_ID";
	private String BOOK_TEST = "SELECT B.BOOK_ID, B.DUPL, B.TITLE, B.ISBN, B.AUTHOR, B.IN_DT, B.IS_RENTABLE, R.RET_DT FROM (SELECT * FROM BOOKS WHERE TITLE = ? AND DUPL != ?) B JOIN RENT R ON B.BOOK_ID = R.BOOK_ID";
	private String BOOK_TTT = "SELECT * FROM BOOKS B, RENT R WHERE B.BOOK_ID = R.BOOK_ID";
	
	// BOOKS CRUD
	private String BOOK_INSERT = "INSERT INTO BOOKS(BOOK_ID, DUPL, TITLE, ISBN, AUTHOR, IN_DT) VALUES (?, ?, ?, ?, ?, ?)";
	private String BOOK_GET = "SELECT * FROM BOOKS WHERE trim(BOOK_ID)=?";
	private String BOOK_UPDATE = "UPDATE BOOKS SET BOOK_ID = ?, DUPL = ?, TITLE = ?, ISBN = ?, AUTHOR = ?, IN_DT = ? WHERE BOOK_ID = ?";
	private String BOOK_DELETE = "DELETE FROM BOOKS WHERE BOOK_ID=?";
	
	// BOOKS RENT
	//insert into rent(RENT_ID, BOOK_ID, EMPNO, BOR_DT, RET_DT) values(concat('R',LPAD(RENT_SEQ.NEXTVAL,7,0)), 'e111101','2245022', TO_CHAR(SYSDATE, 'YY-MM-DD'), TO_CHAR(SYSDATE+14, 'YY-MM-DD'));
	private String BOOK_RENT = "INSERT INTO RENT(RENT_ID, BOOK_ID, EMPNO, BOR_DT, RET_DT) VALUES(CONCAT('R', LPAD(RENT_SEQ.NEXTVAL, 7, 0)), ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD'), TO_CHAR(SYSDATE+14, 'YYYY-MM-DD'))";
	private String BOOK_UPDATE_ISRENTABLE = "UPDATE BOOKS SET IS_RENTABLE = ? WHERE BOOK_ID = ?";
	
	
	
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
				book.setIs_rentable(rs.getString("IS_RENTABLE"));
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
				book.setIs_rentable(rs.getString("IS_RENTABLE"));
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
				book.setIs_rentable(rs.getString("IS_RENTABLE"));
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
				book.setIs_rentable(rs.getString("IS_RENTABLE"));
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
	
	//도서 대출
	public void rentBook(String bookid, String empno) {
		/*
		 * 해당 bookid를 검색 -> bookid로 VO 객체 정보 가져와서 대출가능여부 판단 -> 'Y'면 아래코드 실행 -> 실행되면 대출가능여부 'N'으로 업데이트
		 * 															 -> 'N'면 구분가능한 값 리턴 -> 대출불가 오류메시지를 띄우던지, 아니면 애초에 대출가능여부가 'N'이면 대출기능을 비활성화하던지
		 */
		BooksDAO dao = new BooksDAO();
		BooksVO book = dao.getBook(bookid);
		int result = -1;
		//대출가능상태면 rent 실행
		if("Y".equals(book.getIs_rentable())) {
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(BOOK_RENT);
				stmt.setString(1, bookid);
				stmt.setString(2, empno);
				stmt.executeUpdate();
				System.out.println("rent 동작완료");
				
				//대출가능여부 'N' 업데이트
				stmt = conn.prepareStatement(BOOK_UPDATE_ISRENTABLE);
				stmt.setString(1, "N");
				stmt.setString(2, bookid);
				result = stmt.executeUpdate();
				System.out.println("IS_RENTABLE N 업데이트완료");
				System.out.println("업데이트 결과 행 수 : " + result);
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(stmt, conn);
			}
		}
		//대출가능상태가 아니면
	
	}
	
	//자신을 제외한 DUPL 번호를 가진, 동일한 TITLE 명을 가진 도서를 RENT 테이블의 RET_DT 값까지 포함한 BooksVO 리스트  - 테스트중
	public List<BooksVO> getDuplListBooks(int book_dupl, String book_title){
		List<BooksVO> bookList = new ArrayList<BooksVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOOK_TTT);
			//stmt.setString(1, book_title);
			//stmt.setInt(2, book_dupl);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BooksVO book = new BooksVO();
				book.setBook_id(rs.getString("BOOK_ID"));
				book.setDupl(rs.getInt("DUPL"));
				book.setTitle(rs.getString("TITLE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setIn_dt(rs.getDate("IN_DT"));
				book.setIs_rentable(rs.getString("IS_RENTABLE"));
				book.setRet_dt(rs.getDate("RET_DT"));
				System.out.println("title : " +book.getTitle());
				System.out.println("ret_dt : "+book.getRet_dt());
				bookList.add(book);
			}
			
		}catch(SQLException e) {
			
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		
		return bookList;
	}
	
}
