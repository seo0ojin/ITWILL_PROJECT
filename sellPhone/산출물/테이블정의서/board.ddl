DROP TABLE PAYMENT CASCADE CONSTRAINTS;
DROP TABLE BANK_PAY CASCADE CONSTRAINTS;
DROP TABLE CARD_PAY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE ORDER_ITEM CASCADE CONSTRAINTS;
DROP TABLE ORDERS CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE PLAN CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE SPEC CASCADE CONSTRAINTS;
DROP TABLE USERINFO CASCADE CONSTRAINTS;

CREATE TABLE USERINFO(
		user_id                       		VARCHAR2(30)		 NULL ,
		user_password                 		VARCHAR2(20)		 NULL ,
		user_name                     		VARCHAR2(10)		 NULL ,
		user_email                    		VARCHAR2(30)		 NULL ,
		user_email_send               		NUMBER(10)		 NULL ,
		user_jumin                    		VARCHAR2(20)		 NULL ,
		user_phone                    		VARCHAR2(20)		 NULL ,
		user_gender                   		VARCHAR2(10)		 NULL 
);


CREATE TABLE SPEC(
		spec_no                       		NUMBER(10)		 NULL ,
		spec_network                  		VARCHAR2(10)		 NULL ,
		spec_brand                    		VARCHAR2(10)		 NULL ,
		spec_release                  		DATE		 NULL ,
		spec_color                    		VARCHAR2(10)		 NULL ,
		spec_display                  		NUMBER(10)		 NULL ,
		spec_size                     		VARCHAR2(30)		 NULL ,
		spec_weight                   		VARCHAR2(10)		 NULL ,
		spec_RAM                      		VARCHAR2(10)		 NULL ,
		spec_battery                  		VARCHAR2(10)		 NULL ,
		spec_OS                       		VARCHAR2(10)		 NULL ,
		spec_cam                      		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE SPEC_spec_no_SEQ;

CREATE SEQUENCE SPEC_spec_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE PRODUCT(
		product_no                    		NUMBER(10)		 NULL ,
		product_name                  		VARCHAR2(20)		 NULL ,
		product_model                 		VARCHAR2(20)		 NULL ,
		product_price                 		NUMBER(10)		 NULL ,
		product_storage               		VARCHAR2(10)		 NULL ,
		product_color                 		VARCHAR2(10)		 NULL ,
		product_image                 		VARCHAR2(100)		 NULL ,
		product_detail                		VARCHAR2(100)		 NULL ,
		spec_no                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE PRODUCT_product_no_SEQ;

CREATE SEQUENCE PRODUCT_product_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE PLAN(
		plan_no                       		NUMBER(10)		 NULL ,
		plan_name                     		VARCHAR2(30)		 NULL ,
		plan_dc                       		NUMBER(10)		 NULL ,
		plan_fare                     		NUMBER(10)		 NULL ,
		plan_desc                     		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE PLAN_plan_no_SEQ;

CREATE SEQUENCE PLAN_plan_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE CART(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(20)		 NULL ,
		plan_no                       		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE CART_cart_no_SEQ;

CREATE SEQUENCE CART_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE ORDERS(
		order_no                      		NUMBER(10)		 NULL ,
		order_fee                     		NUMBER(20)		 NULL ,
		order_date                    		DATE		 NULL ,
		delivery                      		VARCHAR2(100)		 NULL ,
		delivery_req                  		VARCHAR2(100)		 NULL ,
		delivery_status               		VARCHAR2(100)  DEFAULT '배송준비'		 NULL ,
		delivery_receiver             		VARCHAR2(100)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL 
);

DROP SEQUENCE ORDERS_order_no_SEQ;

CREATE SEQUENCE ORDERS_order_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE ORDER_ITEM(
		oi_no                         		NUMBER(10)		 NULL ,
		contact                       		VARCHAR2(30)		 NULL ,
		plan_no                       		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		order_no                      		NUMBER(10)		 NULL 
);

DROP SEQUENCE ORDER_ITEM_oi_no_SEQ;

CREATE SEQUENCE ORDER_ITEM_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;



CREATE TABLE BOARD(
		board_no                      		NUMBER(10)		 NULL ,
		board_title                   		VARCHAR2(30)		 NOT NULL,
		board_content                 		VARCHAR2(1000)		 NULL ,
		board_date                    		DATE		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		user_id                       		VARCHAR2(30)		 NULL, 
		readcount							NUMBER DEFAULT(0),
		groupno								NUMBER NOT NULL,
		step								NUMBER NOT NULL,
		depth								NUMBER DEFAULT (0)
);

DROP SEQUENCE BOARD_board_no_SEQ;

CREATE SEQUENCE BOARD_board_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE CARD_PAY(
		card_no                       		NUMBER(10)		 NULL ,
		card_expire                   		DATE		 NULL ,
		card_owner                    		VARCHAR2(20)		 NULL 
);

DROP SEQUENCE CARD_PAY_card_no_SEQ;

CREATE SEQUENCE CARD_PAY_card_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE BANK_PAY(
		account_no                    		NUMBER(10)		 NULL ,
		bank                          		VARCHAR2(10)		 NULL ,
		account_owner                 		VARCHAR2(20)		 NULL 
);

DROP SEQUENCE BANK_PAY_account_no_SEQ;

CREATE SEQUENCE BANK_PAY_account_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


CREATE TABLE PAYMENT(
		payment_no                    		NUMBER(10)		 NULL ,
		payment                       		VARCHAR2(100)		 NULL ,
		payment_date                  		DATE		 NULL ,
		card_no                       		NUMBER(10)		 NULL ,
		account_no                    		NUMBER(10)		 NULL ,
		order_no                      		NUMBER(10)		 NULL 
);

DROP SEQUENCE PAYMENT_payment_no_SEQ;

CREATE SEQUENCE PAYMENT_payment_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;


ALTER TABLE USERINFO ADD CONSTRAINT IDX_USERINFO_PK PRIMARY KEY (user_id);

ALTER TABLE SPEC ADD CONSTRAINT IDX_SPEC_PK PRIMARY KEY (spec_no);

ALTER TABLE PRODUCT ADD CONSTRAINT IDX_PRODUCT_PK PRIMARY KEY (product_no);
ALTER TABLE PRODUCT ADD CONSTRAINT IDX_PRODUCT_FK0 FOREIGN KEY (spec_no) REFERENCES SPEC (spec_no);

ALTER TABLE PLAN ADD CONSTRAINT IDX_PLAN_PK PRIMARY KEY (plan_no);

ALTER TABLE CART ADD CONSTRAINT IDX_CART_PK PRIMARY KEY (cart_no);
ALTER TABLE CART ADD CONSTRAINT IDX_CART_FK0 FOREIGN KEY (plan_no) REFERENCES PLAN (plan_no);
ALTER TABLE CART ADD CONSTRAINT IDX_CART_FK1 FOREIGN KEY (product_no) REFERENCES PRODUCT (product_no);
ALTER TABLE CART ADD CONSTRAINT IDX_CART_FK2 FOREIGN KEY (user_id) REFERENCES USERINFO (user_id);

ALTER TABLE ORDERS ADD CONSTRAINT IDX_ORDERS_PK PRIMARY KEY (order_no);
ALTER TABLE ORDERS ADD CONSTRAINT IDX_ORDERS_FK0 FOREIGN KEY (user_id) REFERENCES USERINFO (user_id);

ALTER TABLE ORDER_ITEM ADD CONSTRAINT IDX_ORDER_ITEM_PK PRIMARY KEY (oi_no);
ALTER TABLE ORDER_ITEM ADD CONSTRAINT IDX_ORDER_ITEM_FK0 FOREIGN KEY (plan_no) REFERENCES PLAN (plan_no);
ALTER TABLE ORDER_ITEM ADD CONSTRAINT IDX_ORDER_ITEM_FK1 FOREIGN KEY (product_no) REFERENCES PRODUCT (product_no);
ALTER TABLE ORDER_ITEM ADD CONSTRAINT IDX_ORDER_ITEM_FK2 FOREIGN KEY (order_no) REFERENCES ORDERS (order_no) ON DELETE CASCADE;

ALTER TABLE BOARD ADD CONSTRAINT IDX_BOARD_PK PRIMARY KEY (board_no);
ALTER TABLE BOARD ADD CONSTRAINT IDX_BOARD_FK0 FOREIGN KEY (product_no) REFERENCES PRODUCT (product_no);
ALTER TABLE BOARD ADD CONSTRAINT IDX_BOARD_FK1 FOREIGN KEY (user_id) REFERENCES USERINFO (user_id);

ALTER TABLE CARD_PAY ADD CONSTRAINT IDX_CARD_PAY_PK PRIMARY KEY (card_no);

ALTER TABLE BANK_PAY ADD CONSTRAINT IDX_BANK_PAY_PK PRIMARY KEY (account_no);

ALTER TABLE PAYMENT ADD CONSTRAINT IDX_PAYMENT_PK PRIMARY KEY (payment_no);
ALTER TABLE PAYMENT ADD CONSTRAINT IDX_PAYMENT_FK0 FOREIGN KEY (card_no) REFERENCES CARD_PAY (card_no);
ALTER TABLE PAYMENT ADD CONSTRAINT IDX_PAYMENT_FK1 FOREIGN KEY (account_no) REFERENCES BANK_PAY (account_no);
ALTER TABLE PAYMENT ADD CONSTRAINT IDX_PAYMENT_FK2 FOREIGN KEY (order_no) REFERENCES ORDERS (order_no);

