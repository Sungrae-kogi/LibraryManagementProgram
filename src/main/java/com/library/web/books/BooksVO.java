package com.library.web.books;

import java.sql.Date;

public class BooksVO {
	private String book_id;
	private int dupl;
	private String title;
	private String isbn;
	private String author;
	private Date in_dt;
	
	
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
	
	
	
}
