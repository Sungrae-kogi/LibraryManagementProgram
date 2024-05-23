package com.library.web.books;

import java.sql.Date;

import com.library.web.rent.RentVO;

public class BooksVO {
	private String book_id;
	private int dupl;
	private String title;
	private String isbn;
	private String author;
	private Date in_dt;
	private String is_rentable;
	private Date ret_dt;
	
	//join 테이블
	private RentVO rent;
	
	
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public int getDupl() {
		return dupl;
	}
	public void setDupl(int dupl) {
		this.dupl = dupl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getIn_dt() {
		return in_dt;
	}
	public void setIn_dt(Date in_dt) {
		this.in_dt = in_dt;
	}
	public String getIs_rentable() {
		return is_rentable;
	}
	public void setIs_rentable(String is_rentable) {
		this.is_rentable = is_rentable;
	}
	
	public Date getRet_dt() {
		return ret_dt;
	}
	public void setRet_dt(Date ret_dt) {
		this.ret_dt = ret_dt;
	
	
	
	}
	public RentVO getRent() {
		return rent;
	}
	public void setRent(RentVO rent) {
		this.rent = rent;
	}
	
	
	
	
}
