package com.green.applicaions.vo;

public class ApplicaionVo {

	private int applications_idx;        // 지원내역키
	private int user_resume_idx;         // 이력서 번호
	private int company_recruit_idx;     // 채용 공고 번호
	private String application_status;   // 지원상태 (심사중private String합격private String불합격)
	private String applied_date;         // 지원날짜
	
	public ApplicaionVo () {}

	public ApplicaionVo(int applications_idx, int user_resume_idx, int company_recruit_idx, String application_status,
			String applied_date) {
		super();
		this.applications_idx = applications_idx;
		this.user_resume_idx = user_resume_idx;
		this.company_recruit_idx = company_recruit_idx;
		this.application_status = application_status;
		this.applied_date = applied_date;
	}

	public int getApplications_idx() {
		return applications_idx;
	}

	public void setApplications_idx(int applications_idx) {
		this.applications_idx = applications_idx;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	public String getApplication_status() {
		return application_status;
	}

	public void setApplication_status(String application_status) {
		this.application_status = application_status;
	}

	public String getApplied_date() {
		return applied_date;
	}

	public void setApplied_date(String applied_date) {
		this.applied_date = applied_date;
	}

	@Override
	public String toString() {
		return "ApplicaionVo [applications_idx=" + applications_idx + ", user_resume_idx=" + user_resume_idx
				+ ", company_recruit_idx=" + company_recruit_idx + ", application_status=" + application_status
				+ ", applied_date=" + applied_date + "]";
	}
	
	
	

}
