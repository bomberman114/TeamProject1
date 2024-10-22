package com.green.service.center.vo;

public class ServiceCenterVo {

	private String service_center_idx;
	private String user_id;                  // 개인회원 아이디
	private String company_id;               // 기업회원 아이디
	private String writer;                   // 작성자
	private String title;                    // 제목
	private String content;                  // 내용

	public ServiceCenterVo () {}

	public ServiceCenterVo(String service_center_idx, String user_id, String company_id, String writer, String title,
			String content) {
		super();
		this.service_center_idx = service_center_idx;
		this.user_id = user_id;
		this.company_id = company_id;
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public String getService_center_idx() {
		return service_center_idx;
	}

	public void setService_center_idx(String service_center_idx) {
		this.service_center_idx = service_center_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	@Override
	public String toString() {
		return "ServiceCenterVo [service_center_idx=" + service_center_idx + ", user_id=" + user_id + ", company_id="
				+ company_id + ", writer=" + writer + ", title=" + title + ", content=" + content + "]";
	}
	
	
	
}
