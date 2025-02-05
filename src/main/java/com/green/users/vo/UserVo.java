package com.green.users.vo;


public class UserVo {
	private String user_id;
	private String user_passwd;
	private String user_name;
	private String user_phone;
	private String user_email;
	private String user_regdate;
	
	public UserVo() {
	    // 기본 생성자
	}
	
	public UserVo(String user_id, String user_passwd, String user_name, String user_phone, String user_email,
			String user_regdate) {
		super();
		this.user_id = user_id;
		this.user_passwd = user_passwd;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_regdate = user_regdate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_passwd() {
		return user_passwd;
	}

	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(String user_regdate) {
		this.user_regdate = user_regdate;
	}

	@Override
	public String toString() {
		return "UserVo [user_id=" + user_id + ", user_passwd=" + user_passwd + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_regdate=" + user_regdate + "]";
	}
	
	

}
