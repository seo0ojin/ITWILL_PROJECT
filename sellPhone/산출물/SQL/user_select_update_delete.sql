delete from userinfo where user_id = '3333';

update userinfo set user_password='1122',
                 user_name='name수정',
                 user_email='email수정',
                 user_email_send=0,
                 user_jumin='jumin수정',
                 user_phone ='phone수정'
                 where user_id = '1111';

select * from userinfo;

select * from userinfo where user_id = '2222';
desc userinfo;
commit;
