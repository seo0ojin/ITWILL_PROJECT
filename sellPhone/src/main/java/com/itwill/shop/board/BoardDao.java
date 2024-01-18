package com.itwill.shop.board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BoardDao {

	int insert(Board board) throws Exception;

	int insertReply(Board board) throws Exception;

	List<Board> findBoardList(int productNo, int start, int last) throws Exception;

	Board findBoard(int boardNo) throws Exception;

	int update(Board board) throws Exception;

	int delete(int boardNo) throws Exception;
	
	int deleteReply(int depth, int groupNo) throws Exception;

	void increaseReadCount(int number) throws Exception;
	
	int getBoardCount(int productNo) throws Exception;
	
	boolean countReplay(Board board) throws SQLException;
}