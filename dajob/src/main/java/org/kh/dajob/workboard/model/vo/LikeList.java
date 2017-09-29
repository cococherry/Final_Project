package org.kh.dajob.workboard.model.vo;

import java.io.Serializable;

public class LikeList implements Serializable{

	private static final long serialVersionUID = 12341325225L;
	
	private String member_id;
	private String work_no;
	private String company_name;
	private String work_title;
	
	public LikeList() {}

	public LikeList(String member_id, String work_no, String company_name, String work_title) {
		super();
		this.member_id = member_id;
		this.work_no = work_no;
		this.company_name = company_name;
		this.work_title = work_title;
	}

	@Override
	public String toString() {
		return "LikeList [member_id=" + member_id + ", work_no=" + work_no + ", company_name=" + company_name
				+ ", work_title=" + work_title + "]";
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getWork_no() {
		return work_no;
	}

	public void setWork_no(String work_no) {
		this.work_no = work_no;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getWork_title() {
		return work_title;
	}

	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
