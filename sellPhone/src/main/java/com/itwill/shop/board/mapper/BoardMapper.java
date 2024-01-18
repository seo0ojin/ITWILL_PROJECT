package com.itwill.shop.board.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.board.Board;

public interface BoardMapper {

	@ResultMap("BoardResultMap")
	@Insert("insert into board(board_no, board_title, board_content, board_date, user_id,\r\n"
			+ "		product_no, board_groupno, board_step)\r\n"
			+ "		values(board_board_no_seq.nextval, #{boardTitle}, #{boardContent},\r\n"
			+ "		sysdate, #{user.userId}, #{product.productNo},\r\n"
			+ "		board_board_no_seq.currval,1)")
	int insert(Board board) throws Exception;
	
	@Update("update board set board_step = board_step + 1 where board_step > #{boardStep} and board_groupno = #{boardGroupNo}")
	int updateReply(Board temp) throws Exception;

	@ResultMap("BoardResultMap")
	@Insert("insert into board(board_no, board_title, board_content, board_date, user_id, product_no, board_groupno, board_step, board_depth)\r\n"
			+ "		values(board_board_no_seq.nextval, #{boardTitle}, #{boardContent},sysdate, #{user.userId}, #{product.productNo}, #{boardGroupNo}, #{boardStep}, #{boardDepth})")
	int insertReply(Board board) throws Exception;
	
	@ResultMap("BoardResultMap")
	@Select("SELECT board_no, board_title, board_content, board_date, product_no,\r\n"
			+ "		user_id,\r\n"
			+ "		board_readcount, board_groupno, board_step, board_depth\r\n"
			+ "		FROM (\r\n"
			+ "		SELECT ROWNUM idx,\r\n"
			+ "		sorted_board.*\r\n"
			+ "		FROM (\r\n"
			+ "		SELECT board_no,\r\n"
			+ "		board_title,\r\n"
			+ "		board_content,\r\n"
			+ "		board_date,\r\n"
			+ "		board_readcount,\r\n"
			+ "		user_id,\r\n"
			+ "		b.product_no,\r\n"
			+ "		board_groupno,\r\n"
			+ "		board_step,\r\n"
			+ "		board_depth\r\n"
			+ "		FROM board b\r\n"
			+ "		JOIN product p ON b.product_no = p.product_no\r\n"
			+ "		ORDER BY board_groupno DESC, board_step asc\r\n"
			+ "		) sorted_board\r\n"
			+ "		) rownum_board\r\n"
			+ "		WHERE product_no = #{productNo} AND rownum_board.idx >= #{start} AND\r\n"
			+ "		rownum_board.idx <= #{last}")
	List<Board> findBoardList(Map param) throws Exception;

	@ResultMap("BoardResultMap")
	@Select("select board_no, board_title, board_content, board_date, product_no, board_step, board_groupno, board_depth, user_id\r\n"
			+ "		from board where board_no = #{boardNo}")
	Board findBoard(int boardNo) throws Exception;

	@Update("update board set board_title = #{boardTitle}, board_content = #{boardContent} where board_no = #{boardNo}\r\n"
			+ "")
	int update(Board board) throws Exception;

	@Delete("delete board where board_no = #{boardNo}")
	int delete(int boardNo) throws Exception;
	
	/**
	 * 답글 삭제 메서드
	 */
	@Delete("delete from board where board_depth >= #{boardDepth} and board_groupno = #{boardGroupNo}")
	int deleteReply(@Param("boardDepth") int depth, @Param("boardGroupNo") int groupNo) throws Exception;

	@Update("update board set board_readcount = board_readcount + 1 where board_no = #{boardNo}")
	void increaseReadCount(int number) throws Exception;
	
	@Select("select count(*) from board where product_no = #{product_no}")
	int getBoardCount(int productNo) throws Exception;
	
	@Select("select count(*) cnt from board where board_groupno = #{boardGroupNo} and board_depth >= #{boardDepth} and board_step >= #{boardStep} order by board_step, board_depth asc")
	int countReplay(Board board) throws SQLException;

}
