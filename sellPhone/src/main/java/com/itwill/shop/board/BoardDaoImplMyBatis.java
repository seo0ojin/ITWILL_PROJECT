package com.itwill.shop.board;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.board.mapper.BoardMapper;

public class BoardDaoImplMyBatis implements BoardDao {
	
	private SqlSessionFactory sqlSessionFactory;

	public BoardDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = 
				new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	@Override
	public int insert(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int rowCount = boardMapper.insert(board);
		
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public int insertReply(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		
		Board temp = boardMapper.findBoard(board.getBoardNo());
	    System.out.println(">>>>>>>>>>>>>>"+temp);
		
		boardMapper.updateReply(temp);
		
		board.setBoardGroupNo(temp.getBoardGroupNo());
		board.setBoardStep(temp.getBoardStep()+1);
		board.setBoardDepth(temp.getBoardDepth()+1);
		System.out.println("temp"+temp.getBoardNo());System.out.println("board"+board.getBoardNo());
		
		boardMapper.insertReply(board);
		sqlSession.commit();
		sqlSession.close();
		return 0;
	}
	
	@Override
	public List<Board> findBoardList(int productNo, int start, int last) throws Exception{
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		Map param = new HashMap();
		
		param.put("productNo", productNo);
		param.put("start", start);
		param.put("last", last);
		
		List<Board> boardList = boardMapper.findBoardList(param);
		
		sqlSession.close();
		return boardList;
	}
	
	@Override
	public Board findBoard(int boardNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
	
		Board board = boardMapper.findBoard(boardNo);
		
		sqlSession.close();
		return board;
	}
	
	@Override
	public int update(Board board) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int rowCount = boardMapper.update(board);
		
		sqlSession.close();
		return rowCount;
	}
	
	
	@Override
	public int delete(int boardNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int rowCount = boardMapper.delete(boardNo);
		
		sqlSession.close();
		return rowCount;
	}
	
	@Override
	public void increaseReadCount(int number) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		boardMapper.increaseReadCount(number);
	
		sqlSession.close();
	}
	
	@Override
	public int getBoardCount(int productNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int totCount = boardMapper.getBoardCount(productNo);
		
		sqlSession.close();
		return totCount;
	}
	
	@Override
	public boolean countReplay(Board board) throws SQLException {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int rowCount = boardMapper.countReplay(board);
		
		Boolean isExist = false;
		if (rowCount > 1) {
			isExist = true;
		}
		
		sqlSession.close();
		return isExist;
	}
	
	@Override
	public int deleteReply(int depth, int groupNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		int rowCount = boardMapper.deleteReply(depth, groupNo);
		
		sqlSession.close();
		return rowCount;
	}
}
