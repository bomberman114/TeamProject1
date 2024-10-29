package com.green.common.user.resum.skill.vo;

public class CommonUserResumSkillVo {

	private int    common_user_idx;
	private String skill_name;        // 스킬명
	private int    user_resume_idx;   // 이력서 번호

	public CommonUserResumSkillVo () {}

	public CommonUserResumSkillVo(int common_user_idx, String skill_name, int user_resume_idx) {
		super();
		this.common_user_idx = common_user_idx;
		this.skill_name = skill_name;
		this.user_resume_idx = user_resume_idx;
	}

	public int getCommon_user_idx() {
		return common_user_idx;
	}

	public void setCommon_user_idx(int common_user_idx) {
		this.common_user_idx = common_user_idx;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	public int getUser_resume_idx() {
		return user_resume_idx;
	}

	public void setUser_resume_idx(int user_resume_idx) {
		this.user_resume_idx = user_resume_idx;
	}

	@Override
	public String toString() {
		return "CommonUserResumSkillVo [common_user_idx=" + common_user_idx + ", skill_name=" + skill_name
				+ ", user_resume_idx=" + user_resume_idx + "]";
	}
	
	
	
}
