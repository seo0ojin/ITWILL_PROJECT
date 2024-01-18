drop table userinfo;

insert into userinfo(user_id,
                    user_password,
                    user_name,
                    user_email,
                    user_email_send,
                    user_jumin,
                    user_phone,
                    user_gender) 
    values('1111','1111','김씨','111@naver.com',0,'111112-211111','222-1111-2222','M') ;
                    
insert into userinfo
    values('2222','2222','최씨','222@naver.com',1,'222223-322222','333-2222-3333','F') ;
                    
insert into userinfo
    values('3333','3333','강씨','333@naver.com',1,'33334-43333','444-3333-4444','F') ;