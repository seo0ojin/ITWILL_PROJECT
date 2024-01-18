package com.itwill.shop.user;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class User {
	private String userId;
	private String userPassword;
	private String userName;
	private String  userEmail;
	private int userEmailSend;
	private String userJumin;
	private String userPhone;
	private String userGender;
	public User() {
		// TODO Auto-generated constructor stub
	}
	 

	public User(String userId, String userPassword, String userName, String userEmail, int userEmailSend,
			String userJumin, String userPhone, String userGender) {
		super();
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userEmailSend = userEmailSend;
		this.userJumin = userJumin;
		this.userPhone = userPhone;
		this.userGender = userGender;
	}

	
	
	public User(String userId) {
		super();
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserEmailSend() {
		return userEmailSend;
	}

	public void setUserEmailSend(int userEmailSend) {
		this.userEmailSend = userEmailSend;
	}

	public String getUserJumin() {
		return userJumin;
	}

	public void setUserJumin(String userJumin) {
		this.userJumin = userJumin;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	/*패스워드 일치여부*/
	public boolean isMatchPassword(String userPassword) {
		boolean isMatch=false;
		if(this.userPassword.equals(userPassword)) {
			isMatch=true;
		}
		return isMatch;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPassword=" + userPassword + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userEmailSend=" + userEmailSend + ", userJumin=" + userJumin + ", userPhone="
				+ userPhone + ", userGender=" + userGender + "]";
	}
	
	
}
