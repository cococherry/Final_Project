package org.kh.dajob.workboard.model.vo;

import java.util.Date;

public class WorkBoard implements java.io.Serializable{
	
	private static final long serialVersionUID = 61111111111L;
	
	private String work_no;
	private String work_title;
	private String work_content;
	private String work_writer;
	private Date work_date;
	private String work_job;
	private String work_skill;
	private String work_career;
	private String work_workplace;
	private Date work_startdate;
	private Date work_enddate;
	
	public String getWork_workplace() {
		return work_workplace;
	}
	public void setWork_workplace(String work_workplace) {
		this.work_workplace = work_workplace;
	}
  
	public String getWork_no() {
		return work_no;
	}
	public void setWork_no(String work_no) {
		this.work_no = work_no;
	}
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public String getWork_writer() {
		return work_writer;
	}
	public void setWork_writer(String work_writer) {
		this.work_writer = work_writer;
	}
	public Date getWork_date() {
		return work_date;
	}
	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}
	public String getWork_job() {
		return work_job;
	}
	public void setWork_job(String work_job) {
		this.work_job = work_job;
	}
	public String getWork_skill() {
		return work_skill;
	}
	public void setWork_skill(String work_skill) {
		this.work_skill = work_skill;
	}
	public String getWork_career() {
		return work_career;
	}
	public void setWork_career(String work_career) {
		this.work_career = work_career;
	}
	public Date getWork_startdate() {
		return work_startdate;
	}
	public void setWork_startdate(Date work_startdate) {
		this.work_startdate = work_startdate;
	}
	public Date getWork_enddate() {
		return work_enddate;
	}
	public void setWork_enddate(Date work_enddate) {
		this.work_enddate = work_enddate;
	}
}
