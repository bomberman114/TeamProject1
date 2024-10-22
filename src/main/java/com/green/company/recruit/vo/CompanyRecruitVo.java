package com.green.company.recruit.vo;

public class CompanyRecruitVo {

	
	  private int    company_recruit_idx;             // 채용공고 번호
	  private String company_id;                      // 기업회원 아이디
	  private String company_name;                    // 기업회원 회사명
	  private String recruit_title;                   // 채용공고 제목
	  private String skill_stack;                     // 필요한   기술스택
	  private String company_job;                     // 모집부문
	  private String getman;                          // 모집인원 (value 00private Stringreadonly)
	  private int    region_idx;                      // 근무지역
	  private String company_address;                 // 근무위치 (=회사위치)
	  private String company_info;                    // 기업정보
	  private String application_deadline;            // 접수기간 (데드라인)
	  private String company_establish;               // 기업     설립일
	  private String company_recruit_regdate;         // 채용공고 등록일
	  
	  public CompanyRecruitVo () {}

	public CompanyRecruitVo(int company_recruit_idx, String company_id, String company_name, String recruit_title,
			String skill_stack, String company_job, String getman, int region_idx, String company_address,
			String company_info, String application_deadline, String company_establish,
			String company_recruit_regdate) {
		super();
		this.company_recruit_idx = company_recruit_idx;
		this.company_id = company_id;
		this.company_name = company_name;
		this.recruit_title = recruit_title;
		this.skill_stack = skill_stack;
		this.company_job = company_job;
		this.getman = getman;
		this.region_idx = region_idx;
		this.company_address = company_address;
		this.company_info = company_info;
		this.application_deadline = application_deadline;
		this.company_establish = company_establish;
		this.company_recruit_regdate = company_recruit_regdate;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getRecruit_title() {
		return recruit_title;
	}

	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}

	public String getSkill_stack() {
		return skill_stack;
	}

	public void setSkill_stack(String skill_stack) {
		this.skill_stack = skill_stack;
	}

	public String getCompany_job() {
		return company_job;
	}

	public void setCompany_job(String company_job) {
		this.company_job = company_job;
	}

	public String getGetman() {
		return getman;
	}

	public void setGetman(String getman) {
		this.getman = getman;
	}

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getCompany_address() {
		return company_address;
	}

	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}

	public String getCompany_info() {
		return company_info;
	}

	public void setCompany_info(String company_info) {
		this.company_info = company_info;
	}

	public String getApplication_deadline() {
		return application_deadline;
	}

	public void setApplication_deadline(String application_deadline) {
		this.application_deadline = application_deadline;
	}

	public String getCompany_establish() {
		return company_establish;
	}

	public void setCompany_establish(String company_establish) {
		this.company_establish = company_establish;
	}

	public String getCompany_recruit_regdate() {
		return company_recruit_regdate;
	}

	public void setCompany_recruit_regdate(String company_recruit_regdate) {
		this.company_recruit_regdate = company_recruit_regdate;
	}

	@Override
	public String toString() {
		return "CompanyRecruitVo [company_recruit_idx=" + company_recruit_idx + ", company_id=" + company_id
				+ ", company_name=" + company_name + ", recruit_title=" + recruit_title + ", skill_stack=" + skill_stack
				+ ", company_job=" + company_job + ", getman=" + getman + ", region_idx=" + region_idx
				+ ", company_address=" + company_address + ", company_info=" + company_info + ", application_deadline="
				+ application_deadline + ", company_establish=" + company_establish + ", company_recruit_regdate="
				+ company_recruit_regdate + "]";
	}
	  


}
