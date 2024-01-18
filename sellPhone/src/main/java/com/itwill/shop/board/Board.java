package com.itwill.shop.board;

import java.util.Date;

import com.itwill.shop.product.Product;
import com.itwill.shop.user.User;

/**
 * 
 */
public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardReadCount;
	private int boardGroupNo;
	private int boardStep;
	private int boardDepth;
	private Product product;
	private User user;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String boardTitle, String boardContent, Date boardDate, int boardReadCount,
			int boardGroupNo, int boardStep, int boardDepth, Product product, User user) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardReadCount = boardReadCount;
		this.boardGroupNo = boardGroupNo;
		this.boardStep = boardStep;
		this.boardDepth = boardDepth;
		this.product = product;
		this.user = user;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}

	public int getBoardGroupNo() {
		return boardGroupNo;
	}

	public void setBoardGroupNo(int boardGroupNo) {
		this.boardGroupNo = boardGroupNo;
	}

	public int getBoardStep() {
		return boardStep;
	}

	public void setBoardStep(int boardStep) {
		this.boardStep = boardStep;
	}

	public int getBoardDepth() {
		return boardDepth;
	}

	public void setBoardDepth(int boardDepth) {
		this.boardDepth = boardDepth;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardReadCount=" + boardReadCount + ", boardGroupNo=" + boardGroupNo
				+ ", boardStep=" + boardStep + ", boardDepth=" + boardDepth + ", product=" + product + ", user=" + user
				+ "]\n";
	}
	
	
}
