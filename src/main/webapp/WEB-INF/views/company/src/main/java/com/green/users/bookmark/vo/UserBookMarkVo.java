package com.green.users.bookmark.vo;

public class UserBookMarkVo {
	
	   private int    bookmark_idx;             // 북마크 idx
	   private String user_id;                  // 구직자 id (회원 id)
	   private int    company_recruit_idx;      // 채용공고 번호
	   private String bookmark_date;            // 북마크한 날짜
	   private int    bookmark_check;           // 북마크 체크 확인

	   public UserBookMarkVo () {}

	public UserBookMarkVo(int bookmark_idx, String user_id, int company_recruit_idx, String bookmark_date,
			int bookmark_check) {
		super();
		this.bookmark_idx = bookmark_idx;
		this.user_id = user_id;
		this.company_recruit_idx = company_recruit_idx;
		this.bookmark_date = bookmark_date;
		this.bookmark_check = bookmark_check;
	}

	public int getBookmark_idx() {
		return bookmark_idx;
	}

	public void setBookmark_idx(int bookmark_idx) {
		this.bookmark_idx = bookmark_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public String getBookmark_date() {
		return bookmark_date;
	}

	public void setBookmark_date(String bookmark_date) {
		this.bookmark_date = bookmark_date;
	}

	public int getBookmark_check() {
		return bookmark_check;
	}

	public void setBookmark_check(int bookmark_check) {
		this.bookmark_check = bookmark_check;
	}

	@Override
	public String toString() {
		return "UserBookMarkVo [bookmark_idx=" + bookmark_idx + ", user_id=" + user_id + ", company_recruit_idx="
				+ company_recruit_idx + ", bookmark_date=" + bookmark_date + ", bookmark_check=" + bookmark_check + "]";
	}
	   
	   
	   
}
