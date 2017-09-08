package org.kh.dajob.interview.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Interview implements Serializable{
	private static final long serialVersionUID = 12111111112L;
	private String interview_no;
	private String interviewer;
	private String interviewee;
	private String interview_question;
	private String interview_answer;
	private Date interview_date;
	private String interview_status;
	private String work_no;
	
	public Interview() {}

	public String getInterview_no() {
		return interview_no;
	}

	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}

	public String getInterviewer() {
		return interviewer;
	}

	public void setInterviewer(String interviewer) {
		this.interviewer = interviewer;
	}

	public String getInterviewee() {
		return interviewee;
	}

	public void setInterviewee(String interviewee) {
		this.interviewee = interviewee;
	}

	public String getInterview_question() {
		return interview_question;
	}

	public void setInterview_question(String interview_question) {
		this.interview_question = interview_question;
	}

	public String getInterview_answer() {
		return interview_answer;
	}

	public void setInterview_answer(String interview_answer) {
		this.interview_answer = interview_answer;
	}

	public Date getInterview_date() {
		return interview_date;
	}

	public void setInterview_date(Date interview_date) {
		this.interview_date = interview_date;
	}

	public String getInterview_status() {
		return interview_status;
	}

	public void setInterview_status(String interview_status) {
		this.interview_status = interview_status;
	}

	public String getWork_no() {
		return work_no;
	}

	public void setWork_no(String work_no) {
		this.work_no = work_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Interview(String interview_no, String interviewer, String interviewee, String interview_question,
			String interview_answer, Date interview_date, String interview_status, String work_no) {
		super();
		this.interview_no = interview_no;
		this.interviewer = interviewer;
		this.interviewee = interviewee;
		this.interview_question = interview_question;
		this.interview_answer = interview_answer;
		this.interview_date = interview_date;
		this.interview_status = interview_status;
		this.work_no = work_no;
	}

	@Override
	public String toString() {
		return "Interview [interview_no=" + interview_no + ", interviewer=" + interviewer + ", interviewee="
				+ interviewee + ", interview_question=" + interview_question + ", interview_answer=" + interview_answer
				+ ", interview_date=" + interview_date + ", interview_status=" + interview_status + ", work_no="
				+ work_no + "]";
	}

	
}
