-- update
update board set board_title = '제목수정', board_content = '내용수정' where board_no = 3;

-- update(readcount)
update board set board_readcount = board_readcount + 1 where board_no = 3;

-- delete
delete board where board_no = 5;

-- select pk(rownum)
select board_no, board_title, board_content, board_date, user_id from board where board_no = 3;

-- select all(rownum)
select board_no, board_title, board_content, board_date, user_id, board_readcount, board_groupno, board_step, board_depth from (
    select rownum idx,
            sorted_board.* from (select board_no,
                                        board_title,
                                        board_content,
                                        board_date,
                                        board_readcount,
                                        user_id,
                                        b.product_no,
                                        board_groupno,
                                        board_step,
                                        board_depth
                                        from board b
                                        join product p
                                        on b.product_no = p.product_no
                                        order by board_groupno desc, board_step asc
                                ) sorted_board
                ) rownum_board;