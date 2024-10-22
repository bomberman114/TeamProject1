package com.green.user.resume.vo;

public class UserResumeVo {

	private int    user_resume_idx;        // 이력서 번호
	private String user_title;             // 개인회원 이력서 제목
	private String user_id;                // 개인회원 아이디
	private String user_name;              // 개인회원 이름
	private String user_birth;             // 개인회원 생일
	private String user_phone;             // 개인회원 연락처
	private String user_email;             // 개인회원 이메일
	private int    region_idx;             // 지역
	private String region_address;         // 개인회원 상세 주소
	private String user_intro;             // 자소서
	private String user_resume_regdate;    // 이력서 등록일
	
	public UserResumeVo () {}

	public UserResumeVo(int user_resume_idx, String user_title, String user_id, String user_name, String user_birth,
			String user_phone, String user_email, int region_idx, String region_address, String user_intro,
			String user_resume_regdate) {
		super();
		this.user_resume_idx = user_resume_idx;
		this.user_title = user_title;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.region_idx = region_idx;
		this.region_address = region_address;
		this.user_intro = user_intro;
		this.user_resume_regdate = user_resume_regdate;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public String getUser_title() {
		return user_title;
	}

	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
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

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getRegion_address() {
		return region_address;
	}

	public void setRegion_address(String region_address) {
		this.region_address = region_address;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public String getUser_resume_regdate() {
		return user_resume_regdate;
	}

	public void setUser_resume_regdate(String user_resume_regdate) {
		this.user_resume_regdate = user_resume_regdate;
	}

	@Override
	public String toString() {
		return "UserResumeVo [user_resume_idx=" + user_resume_idx + ", user_title=" + user_title + ", user_id="
				+ user_id + ", user_name=" + user_name + ", user_birth=" + user_birth + ", user_phone=" + user_phone
				+ ", user_email=" + user_email + ", region_idx=" + region_idx + ", region_address=" + region_address
				+ ", user_intro=" + user_intro + ", user_resume_regdate=" + user_resume_regdate + "]";
	}
	
	

}
