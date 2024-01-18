-- insert(새글)
insert into board(board_no, board_title, board_content, board_date, user_id, product_no, board_groupno, board_step, board_depth) values(board_board_no_seq.nextval, '제목' || board_board_no_seq.currval, '내용' || board_board_no_seq.currval, sysdate, '1111', 3, board_board_no_seq.currval, 1, 0);

-- update(답글)
update board set board_step = board_step + 1 where board_step > 1 and board_groupno = 8;

-- insert(답글)
insert into board(board_no, board_title, board_content, board_date, user_id, product_no, board_groupno, board_step, board_depth) values(board_board_no_seq.nextval, '답변' || board_board_no_seq.currval, '답변내용' || board_board_no_seq.currval, sysdate, '1111', 2, 8, 2, 1);