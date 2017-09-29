package org.kh.dajob.workJobAndSkill.model.vo;

public class WorkSkill implements java.io.Serializable{
	private static final long serialVersionUID = 11111111212L;
	private String skill_code;
	private String skill_name;
	
	public WorkSkill() {}

	public WorkSkill(String skill_code, String skill_name) {
		super();
		this.skill_code = skill_code;
		this.skill_name = skill_name;
	}

	@Override
	public String toString() {
		return "WorkSkill [skill_code=" + skill_code + ", skill_name=" + skill_name + "]";
	}

	public String getSkill_code() {
		return skill_code;
	}

	public void setSkill_code(String skill_code) {
		this.skill_code = skill_code;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	
}
