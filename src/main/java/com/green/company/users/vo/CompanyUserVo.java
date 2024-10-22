package com.green.company.users.vo;

public class CompanyUserVo {

	private String company_id;              // 기업회원 아이디
	private String company_passwd;          // 기업회원 비밀번호
	private String company_user_name;       // 기업회원 이름
	private String company_phone;           // 기업회원 연락처
	private String company_name;            // 기업회원 회사명
	private int company_bcode;              // 기업회원 사업자등록번호
	private String company_boss_name;       // 기업회원 대표자명
	private String company_email;           // 기업공식 이메일
	private String company_user_email;      // 기업회원 이메일
	private String company_regdate;         // 기업회원 가입일
	private String company_establish;       // 기업 설립일

	public CompanyUserVo () {}

	public CompanyUserVo(String company_id, String company_passwd, String company_user_name, String company_phone,
			String company_name, int company_bcode, String company_boss_name, String company_email,
			String company_user_email, String company_regdate, String company_establish) {
		super();
		this.company_id = company_id;
		this.company_passwd = company_passwd;
		this.company_user_name = company_user_name;
		this.company_phone = company_phone;
		this.company_name = company_name;
		this.company_bcode = company_bcode;
		this.company_boss_name = company_boss_name;
		this.company_email = company_email;
		this.company_user_email = company_user_email;
		this.company_regdate = company_regdate;
		this.company_establish = company_establish;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_passwd() {
		return company_passwd;
	}

	public void setCompany_passwd(String company_passwd) {
		this.company_passwd = company_passwd;
	}

	public String getCompany_user_name() {
		return company_user_name;
	}

	public void setCompany_user_name(String company_user_name) {
		this.company_user_name = company_user_name;
	}

	public String getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public int getCompany_bcode() {
		return company_bcode;
	}

	public void setCompany_bcode(int company_bcode) {
		this.company_bcode = company_bcode;
	}

	public String getCompany_boss_name() {
		return company_boss_name;
	}

	public void setCompany_boss_name(String company_boss_name) {
		this.company_boss_name = company_boss_name;
	}

	public String getCompany_email() {
		return company_email;
	}

	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}

	public String getCompany_user_email() {
		return company_user_email;
	}

	public void setCompany_user_email(String company_user_email) {
		this.company_user_email = company_user_email;
	}

	public String getCompany_regdate() {
		return company_regdate;
	}

	public void setCompany_regdate(String company_regdate) {
		this.company_regdate = company_regdate;
	}

	public String getCompany_establish() {
		return company_establish;
	}

	public void setCompany_establish(String company_establish) {
		this.company_establish = company_establish;
	}

	@Override
	public String toString() {
		return "CompanyUserVo [company_id=" + company_id + ", company_passwd=" + company_passwd + ", company_user_name="
				+ company_user_name + ", company_phone=" + company_phone + ", company_name=" + company_name
				+ ", company_bcode=" + company_bcode + ", company_boss_name=" + company_boss_name + ", company_email="
				+ company_email + ", company_user_email=" + company_user_email + ", company_regdate=" + company_regdate
				+ ", company_establish=" + company_establish + "]";
	}

	
	
	
	
	
}
