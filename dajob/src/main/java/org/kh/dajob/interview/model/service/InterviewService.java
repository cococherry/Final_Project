package org.kh.dajob.interview.model.service;

import java.util.ArrayList;

import org.kh.dajob.interview.model.vo.Interview;
import org.kh.dajob.member.model.vo.Member;

public interface InterviewService {
	
	Interview selectInterview(String interview_no);
	ArrayList<Interview> selectInterviewList();
	ArrayList<Interview> selectInterviewList(Member m);
	int insertInterview(Interview i);
	int deleteInterview(String id);
	int updateInterview(Interview i);
	String selectCompanyName(Interview i);

}
