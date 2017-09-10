package org.kh.dajob.itinfo.model.vo;

import java.sql.Date;

public class Itinfo implements java.io.Serializable{
	
	private static final long serialVersionUID = 111111122L;
	
	private String itinfo_no;
	private String itinfo_title;
	private String itinfo_content;
	private String itinfo_img;
	private Date itinfo_date;
	
	public Itinfo() {
		super();
	}
	
	public Itinfo(String itinfo_title, String itinfo_content, String itinfo_img) {
		super();
		this.itinfo_title = itinfo_title;
		this.itinfo_content = itinfo_content;
		this.itinfo_img = itinfo_img;
	}
	
	public Itinfo(String itinfo_no, String itinfo_title, String itinfo_content, String itinfo_img, Date itinfo_date) {
		super();
		this.itinfo_no = itinfo_no;
		this.itinfo_title = itinfo_title;
		this.itinfo_content = itinfo_content;
		this.itinfo_img = itinfo_img;
		this.itinfo_date = itinfo_date;
	}
	
	@Override
	public String toString() {
		return "itinfo [itinfo_no=" + itinfo_no + ", itinfo_title=" + itinfo_title + ", itinfo_content="
				+ itinfo_content + ", itinfo_img=" + itinfo_img + ", itinfo_date=" + itinfo_date + "]";
	}

	public String getItinfo_no() {
		return itinfo_no;
	}
	public void setItinfo_no(String itinfo_no) {
		this.itinfo_no = itinfo_no;
	}
	public String getItinfo_title() {
		return itinfo_title;
	}
	public void setItinfo_title(String itinfo_title) {
		this.itinfo_title = itinfo_title;
	}
	public String getItinfo_content() {
		return itinfo_content;
	}
	public void setItinfo_content(String itinfo_content) {
		this.itinfo_content = itinfo_content;
	}
	public String getItinfo_img() {
		return itinfo_img;
	}
	public void setItinfo_img(String itinfo_img) {
		this.itinfo_img = itinfo_img;
	}
	public Date getItinfo_date() {
		return itinfo_date;
	}
	public void setItinfo_date(Date itinfo_date) {
		this.itinfo_date = itinfo_date;
	}
}
