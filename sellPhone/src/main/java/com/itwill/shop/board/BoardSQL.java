package com.itwill.shop.board;

public class BoardSQL {

	public static final String BOARD_INSERT = "insert into board(board_no, board_title, board_content, board_date, user_id, product_no, board_groupno, board_step) values(board_board_no_seq.nextval, ?, ?, sysdate, ?, ?, board_board_no_seq.currval, 1)";
	public static final String BOARD_UPDATE_STEP_REPLY = "update board set board_step = board_step + 1 where board_step > 1 and board_groupno = ?";
	public static final String BOARD_INSERT_REPLY = "insert into board(board_no, board_title, board_content, board_date, user_id, product_no, board_groupno, board_step, board_depth) values(board_board_no_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?)";
	public static final String BOARD_UDATE_BY_BOARDNO = "update board set board_title = ?, board_content = ? where board_no = ?";
	public static final String BOARD_DELETE_BY_BOARDNO = "delete board where board_no = ?";
	public static final String BOARD_SELECT_BY_BOARDNO = "select board_no, board_title, board_content, board_date, user_id from board where board_no = ?";
	public static final String BOARD_UPDATE_READ_COUNT_BY_BOARDNO = "update board set board_readcount = board_readcount + 1 where board_no = ?";
	public static final String BOARD_SELECT_LIST_BY_ROWNUM_RANGE = "select board_no, board_title, board_content, board_date, user_id, board_readcount, board_groupno, board_step, board_depth from (\r\n"
			+ "    select rownum idx,\r\n"
			+ "            sorted_board.* from (select board_no,\r\n"
			+ "                                        board_title,\r\n"
			+ "                                        board_content,\r\n"
			+ "                                        board_date,\r\n"
			+ "                                        board_readcount,\r\n"
			+ "                                        user_id,\r\n"
			+ "                                        b.product_no,\r\n"
			+ "                                        board_groupno,\r\n"
			+ "                                        board_step,\r\n"
			+ "                                        board_depth\r\n"
			+ "                                        from board b\r\n"
			+ "                                        join product p\r\n"
			+ "                                        on b.product_no = p.product_no\r\n"
			+ "                                        order by board_groupno desc, board_step asc\r\n"
			+ "                                ) sorted_board\r\n"
			+ "                ) rownum_board\r\n"
			+ "where product_no = ? and rownum_board.idx >= ? and rownum_board.idx <= ?";
	
	public static final String BOARD_SELECT_COUNT_TOT_RECORD = "select count(*) from board";
	
}
