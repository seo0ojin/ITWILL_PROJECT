package com.itwill.shop.order.pay;

import java.util.Date;

import lombok.Data;
import lombok.NonNull;

@Data 
public class Card {
	@NonNull
	private String cardNo;
	@NonNull
	private Date cardExpire;
	@NonNull
	private String cardOwner;
}
