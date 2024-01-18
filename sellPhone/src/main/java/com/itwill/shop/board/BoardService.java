package com.itwill.shop.board;

import java.util.List;

public class BoardService {

	BoardDao boardDao;
	
	public BoardService() throws Exception {
		boardDao = new BoardDaoImplMyBatis();
	}
	
	public int insert(Board board) throws Exception {
		
		return boardDao.insert(board);
	}
	
	public int insertReply(Board board) throws Exception {
		
		return boardDao.insertReply(board);
	}
	
	public Board findBoard(int boardNo) throws Exception {
		Board board = boardDao.findBoard(boardNo);
		
		return board;
	}
	
	public BoardListPageMakerDto findBoardList(int productNo, int currentPage) throws Exception {
		int totRecordCount = boardDao.getBoardCount(productNo);
		
		PageMaker pageMaker = new PageMaker(totRecordCount, currentPage);
		
		List<Board> boardList = boardDao.findBoardList(productNo, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		System.out.println(boardList);
		
		BoardListPageMakerDto pageMakeBoardList = new BoardListPageMakerDto();
		pageMakeBoardList.itemList = boardList;
		pageMakeBoardList.pageMaker = pageMaker;
		
		return pageMakeBoardList;
	}
	
	public int update(Board board) throws Exception {
		
		return boardDao.update(board);
	}
	
	public int delete(int boardNo) throws Exception{
		Board tempBoard = boardDao.findBoard(boardNo);
		boolean rExist = boardDao.countReplay(tempBoard);
		
		if (rExist) {
			boardDao.deleteReply(tempBoard.getBoardDepth(), tempBoard.getBoardGroupNo());
		}
		return boardDao.delete(tempBoard.getBoardNo());
	}
	
	public void increaseReadCount(int boardNo) throws Exception {
		
		boardDao.increaseReadCount(boardNo);
	}
	
	public int deleteReply(int depth, int groupNo) throws Exception {
		
		return boardDao.deleteReply(depth, groupNo);
	}
}
