package com.library.web.rent;

public class RentVO {
	private String rent_id;
	private String book_id;
	private String empno;
	private String bor_dt;
	private String ret_dt;
	
	public String getRent_id() {
		return rent_id;
	}
	public void setRent_id(String rent_id) {
		this.rent_id = rent_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getBor_dt() {
		return bor_dt;
	}
	public void setBor_dt(String bor_dt) {
		this.bor_dt = bor_dt;
	}
	public String getRet_dt() {
		return ret_dt;
	}
	public void setRet_dt(String ret_dt) {
		this.ret_dt = ret_dt;
	}
	
}
