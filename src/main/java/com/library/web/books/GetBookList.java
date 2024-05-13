package com.library.web.books;

import java.util.List;


import jakarta.servlet.ServletContext;

public class GetBookList {
	public static void main(String[] args) {

		// 2. DB 연동 처리 - 사용자 입력 검색정보 전달
		BooksVO vo = new BooksVO();

		BooksDAO boardDAO = new BooksDAO();
		List<BooksVO> bookList = boardDAO.getBooksList();

		for (BooksVO book : bookList) {
			System.out.print("BookId : " + book.getBook_id());
			System.out.print("Dupl : " + book.getDupl());
			System.out.print("Title : " + book.getTitle());
			System.out.print("Isbn : " + book.getIsbn());
			System.out.print("Author : " + book.getAuthor());
			System.out.println("In_dt : " + book.getIn_dt());
		}
	}
}
