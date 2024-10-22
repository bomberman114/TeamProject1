package com.green.review.company.vo;

public class ReviewCompanyVo {

	private String review_company_idx; // 리뷰번호
	private String user_id; // 개인회원 아이디
	private String writer; // 작성자
	private String company_name; // 기업명
	private String title; // 제목
	private String content; // 내용
	private String star; // 평점
	private String menu_idx;
	
	public ReviewCompanyVo () {}

	public ReviewCompanyVo(String review_company_idx, String user_id, String writer, String company_name, String title,
			String content, String star, String menu_idx) {
		super();
		this.review_company_idx = review_company_idx;
		this.user_id = user_id;
		this.writer = writer;
		this.company_name = company_name;
		this.title = title;
		this.content = content;
		this.star = star;
		this.menu_idx = menu_idx;
	}

	public String getReview_company_idx() {
		return review_company_idx;
	}

	public void setReview_company_idx(String review_company_idx) {
		this.review_company_idx = review_company_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(String menu_idx) {
		this.menu_idx = menu_idx;
	}

	@Override
	public String toString() {
		return "ReviewCompanyVo [review_company_idx=" + review_company_idx + ", user_id=" + user_id + ", writer="
				+ writer + ", company_name=" + company_name + ", title=" + title + ", content=" + content + ", star="
				+ star + ", menu_idx=" + menu_idx + "]";
	}
	
	

}
