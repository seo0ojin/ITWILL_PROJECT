package com.itwill.shop.order.pay;

import lombok.Data;
import lombok.NonNull;

@Data
public class Account {
	@NonNull
	private String accountNo;
	@NonNull
	private String bank;
	@NonNull
	private String accountOwner;
}
