package org.kh.dajob.workhere.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Workhere implements Serializable{

	private static final long serialVersionUID = 13571111114L;
	
	//work_board
	private String work_no;
	private String work_title;
	private String work_content;
	private String work_writer;
	private Date work_date;
	private String work_job;
	private String work_skill;
	private String work_career;	
	private String work_workplace;
	private Timestamp work_startdate;
	private Timestamp work_enddate;
	//member_company
	private String member_id;
	private String company_name;
	private String company_type;
	private int company_staff;
	private int company_capital;
	private String company_code;
	private String company_tel;
	private String company_fax;
	private String company_welfare;
	private Date company_date;
	
	public Workhere( String work_title, String work_content, String work_job, String work_skill,
			String work_career, String work_workplace, Timestamp work_startdate, Timestamp work_enddate,String work_no) {
		super();
		this.work_no = work_no;
		this.work_title = work_title;
		this.work_content = work_content;
		this.work_job = work_job;
		this.work_skill = work_skill;
		this.work_career = work_career;
		this.work_workplace = work_workplace;
		this.work_startdate = work_startdate;
		this.work_enddate = work_enddate;
	}
	public Workhere() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getWork_workplace() {
		return work_workplace;
	}
	public void setWork_workplace(String work_workplace) {
		this.work_workplace = work_workplace;
	}
	public Timestamp getWork_startdate() {
		return work_startdate;
	}
	public void setWork_startdate(Timestamp work_startdate) {
		this.work_startdate = work_startdate;
	}
	public Timestamp getWork_enddate() {
		return work_enddate;
	}
	public void setWork_enddate(Timestamp work_enddate) {
		this.work_enddate = work_enddate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_type() {
		return company_type;
	}
	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}
	public int getCompany_staff() {
		return company_staff;
	}
	public void setCompany_staff(int company_staff) {
		this.company_staff = company_staff;
	}
	public int getCompany_capital() {
		return company_capital;
	}
	public void setCompany_capital(int company_capital) {
		this.company_capital = company_capital;
	}
	public String getCompany_code() {
		return company_code;
	}
	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_fax() {
		return company_fax;
	}
	public void setCompany_fax(String company_fax) {
		this.company_fax = company_fax;
	}
	public String getCompany_welfare() {
		return company_welfare;
	}
	public void setCompany_welfare(String company_welfare) {
		this.company_welfare = company_welfare;
	}
	public Date getCompany_date() {
		return company_date;
	}
	public void setCompany_date(Date company_date) {
		this.company_date = company_date;
	}
	
	public Workhere(String work_no, String work_title, String work_content, String work_writer, Date work_date,
			String work_job, String work_skill, String work_career, String work_workplace, Timestamp work_startdate,
			Timestamp work_enddate, String member_id, String company_name, String company_type, int company_staff,
			int company_capital, String company_code, String company_tel, String company_fax, String company_welfare,
			Date company_date) {
		super();
		this.work_no = work_no;
		this.work_title = work_title;
		this.work_content = work_content;
		this.work_writer = work_writer;
		this.work_date = work_date;
		this.work_job = work_job;
		this.work_skill = work_skill;
		this.work_career = work_career;
		this.work_workplace = work_workplace;
		this.work_startdate = work_startdate;
		this.work_enddate = work_enddate;
		this.member_id = member_id;
		this.company_name = company_name;
		this.company_type = company_type;
		this.company_staff = company_staff;
		this.company_capital = company_capital;
		this.company_code = company_code;
		this.company_tel = company_tel;
		this.company_fax = company_fax;
		this.company_welfare = company_welfare;
		this.company_date = company_date;
	}
	
	@Override
	public String toString() {
		return "Workhere [work_no=" + work_no + ", work_title=" + work_title + ", work_content=" + work_content
				+ ", work_writer=" + work_writer + ", work_date=" + work_date + ", work_job=" + work_job
				+ ", work_skill=" + work_skill + ", work_career=" + work_career + ", work_workplace=" + work_workplace
				+ ", work_startdate=" + work_startdate + ", work_enddate=" + work_enddate + ", member_id=" + member_id
				+ ", company_name=" + company_name + ", company_type=" + company_type + ", company_staff="
				+ company_staff + ", company_capital=" + company_capital + ", company_code=" + company_code
				+ ", company_tel=" + company_tel + ", company_fax=" + company_fax + ", company_welfare="
				+ company_welfare + ", company_date=" + company_date + "]";
	}
	
	
	
}
