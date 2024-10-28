package com.green.common.company.recruit.skill.vo;

public class CommonCompanyRecruitSkillVo {

	private int common_company_idx;
	private String skill_name;        // 스킬명
	private int company_recruit_idx;  // 회사채용공고 번호
	
	public CommonCompanyRecruitSkillVo() {
	}
	
	public CommonCompanyRecruitSkillVo(int common_company_idx, String skill_name, int company_recruit_idx) {
		super();
		this.common_company_idx = common_company_idx;
		this.skill_name = skill_name;
		this.company_recruit_idx = company_recruit_idx;
	}

	public int getCommon_company_idx() {
		return common_company_idx;
	}

	public void setCommon_company_idx(int common_company_idx) {
		this.common_company_idx = common_company_idx;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	public int getCompany_recruit_idx() {
		return company_recruit_idx;
	}

	public void setCompany_recruit_idx(int company_recruit_idx) {
		this.company_recruit_idx = company_recruit_idx;
	}

	@Override
	public String toString() {
		return "ComminCompanyRecruitSkillVo [common_company_idx=" + common_company_idx + ", skill_name=" + skill_name
				+ ", company_recruit_idx=" + company_recruit_idx + "]";
	}
	
	
	
	

}
