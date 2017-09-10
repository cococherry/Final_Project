package org.kh.dajob.notice.model.vo;

import java.sql.Date;

public class NoticeReply implements java.io.Serializable{
	private static final long serialVersionUID = 111111121L;
	
	private String notice_repno;
	private String notice_no;
	private String notice_rep_content;
	private String notice_rep_writer;
	private Date notice_rep_date;
	private String notice_rep_level;
	private String notice_rep_ref;
	
	public NoticeReply() {
		super();
	}
	
	public NoticeReply(String notice_no, String notice_rep_content) {
		super();
		this.notice_no = notice_no;
		this.notice_rep_content = notice_rep_content;
	}
	
	public NoticeReply(String notice_repno, String notice_no, String notice_rep_content, String notice_rep_writer,
			Date notice_rep_date, String notice_rep_level, String notice_rep_ref) {
		super();
		this.notice_repno = notice_repno;
		this.notice_no = notice_no;
		this.notice_rep_content = notice_rep_content;
		this.notice_rep_writer = notice_rep_writer;
		this.notice_rep_date = notice_rep_date;
		this.notice_rep_level = notice_rep_level;
		this.notice_rep_ref = notice_rep_ref;
	}
	
	@Override
	public String toString() {
		return "NoticeReply [notice_repno=" + notice_repno + ", notice_no=" + notice_no + ", notice_rep_content="
				+ notice_rep_content + ", notice_rep_writer=" + notice_rep_writer + ", notice_rep_date="
				+ notice_rep_date + ", notice_rep_level=" + notice_rep_level + ", notice_rep_ref=" + notice_rep_ref
				+ "]";
	}
	
	public String getNotice_repno() {
		return notice_repno;
	}
	public void setNotice_repno(String notice_repno) {
		this.notice_repno = notice_repno;
	}
	public String getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(String notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_rep_content() {
		return notice_rep_content;
	}
	public void setNotice_rep_content(String notice_rep_content) {
		this.notice_rep_content = notice_rep_content;
	}
	public String getNotice_rep_writer() {
		return notice_rep_writer;
	}
	public void setNotice_rep_writer(String notice_rep_writer) {
		this.notice_rep_writer = notice_rep_writer;
	}
	public Date getNotice_rep_date() {
		return notice_rep_date;
	}
	public void setNotice_rep_date(Date notice_rep_date) {
		this.notice_rep_date = notice_rep_date;
	}
	public String getNotice_rep_level() {
		return notice_rep_level;
	}
	public void setNotice_rep_level(String notice_rep_level) {
		this.notice_rep_level = notice_rep_level;
	}
	public String getNotice_rep_ref() {
		return notice_rep_ref;
	}
	public void setNotice_rep_ref(String notice_rep_ref) {
		this.notice_rep_ref = notice_rep_ref;
	}
}
