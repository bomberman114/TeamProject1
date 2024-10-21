package com.green.community.vo;

public class CommunityVo {

	private String community_idx;
	private String company_id;        // 기업회원 아이디
	private String user_id;           // 개인회원 아이디
	private String community_title;   // 제목
	private String community_content; // 내용
	private String menu_idx;          // 메뉴idx
	
	public CommunityVo () {}

	public CommunityVo(String community_idx, String company_id, String user_id, String community_title,
			String community_content, String menu_idx) {
		super();
		this.community_idx = community_idx;
		this.company_id = company_id;
		this.user_id = user_id;
		this.community_title = community_title;
		this.community_content = community_content;
		this.menu_idx = menu_idx;
	}

	public String getCommunity_idx() {
		return community_idx;
	}

	public void setCommunity_idx(String community_idx) {
		this.community_idx = community_idx;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCommunity_title() {
		return community_title;
	}

	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}

	public String getCommunity_content() {
		return community_content;
	}

	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}

	public String getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(String menu_idx) {
		this.menu_idx = menu_idx;
	}

	@Override
	public String toString() {
		return "CommunityVo [community_idx=" + community_idx + ", company_id=" + company_id + ", user_id=" + user_id
				+ ", community_title=" + community_title + ", community_content=" + community_content + ", menu_idx="
				+ menu_idx + "]";
	}
	
	

}
