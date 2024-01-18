package com.itwill.shop.board;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.swing.plaf.basic.BasicToolTipUI;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.product.Product;
import com.itwill.shop.user.User;

class BoardDaoImplMyBatisTest {
	
	BoardDaoImplMyBatis boardDaoImplMyBatis;

	@BeforeEach
	void setUp() throws Exception {
		boardDaoImplMyBatis = new BoardDaoImplMyBatis();
	}

	@Test
	void testBoardDaoImplMyBatis() throws Exception {
		boardDaoImplMyBatis = new BoardDaoImplMyBatis();
	}
	
	
	@Test
	void testInsert() throws Exception {
	    Board board = new Board(0, "제목제목", "내용내용", null, 0, 0, 0, 0, new Product(3), new User("1111"));
	    int insertRowCount = boardDaoImplMyBatis.insert(board);
	    
	    assertTrue(insertRowCount == 1, "삽입 실패");
	}

	@Disabled
	@Test
	void testInsertReply() throws Exception {
		
		int insertRowCount = boardDaoImplMyBatis.insertReply(new Board(85, "답변", "답변", null, 0, 0, 0, 0, new Product(2), new User("1111")));
	    
	    assertTrue(insertRowCount == 1, "삽입 실패");
	}
	
	@Disabled
	@Test
	void testFindBoardList() throws Exception{
		List<Board> boardList = boardDaoImplMyBatis.findBoardList(2, 1, 5);
		
		assertNotNull(boardList);
		assertTrue(boardList.size() > 0);
		System.out.println(boardList);
	}
	
	@Disabled
	@Test
	void testFindBoard() throws Exception {
		Board board = boardDaoImplMyBatis.findBoard(57);
		
		assertNotNull(board);
		assertSame(57, board.getBoardNo());
		System.out.println(board);
	}
	
	@Disabled
	@Test
	void testUpdate() throws Exception{
		int updateRowCount = boardDaoImplMyBatis.update(new Board(82, "제목수정", "내용수정", null, 0, 0, 0, 0, null, null));
		
		assertTrue(updateRowCount == 1, "수정 실패");
	}
	
	@Disabled
	@Test
	void testDelete() throws Exception {
		int deleteRowCount = boardDaoImplMyBatis.delete(82);
		
		assertTrue(deleteRowCount == 1, "삭제 실패");
	}
	
	@Disabled
	@Test
	void testIncreaseReadCount() throws Exception {
		boardDaoImplMyBatis.increaseReadCount(73);
	}
	
	
	@Test
	void testGetBoardCount() throws Exception{
		int totCount = boardDaoImplMyBatis.getBoardCount(3);
		System.out.println("totCount " + totCount);
	}

}
