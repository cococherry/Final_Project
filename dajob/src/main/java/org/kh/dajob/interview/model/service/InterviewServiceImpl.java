package org.kh.dajob.interview.model.service;

import java.util.ArrayList;

import org.kh.dajob.interview.model.dao.InterviewDao;
import org.kh.dajob.interview.model.vo.Interview;
import org.kh.dajob.member.model.dao.MemberDao;
import org.kh.dajob.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("interviewService")
public class InterviewServiceImpl implements InterviewService{

	@Autowired
	private InterviewDao interviewDao;
	
	public InterviewServiceImpl(){}
	@Override
	public Interview selectInterview(Interview i) {
		return interviewDao.selectInterview(i);
	};
	@Override
	public ArrayList<Interview> selectInterviewList(){
		return interviewDao.selectInterviewList();
	};
	@Override
	public ArrayList<Interview> selectInterviewList(Member m){
		return interviewDao.selectInterviewList(m);
	};
	
	@Override
	public int insertInterview(Interview i) {
		return interviewDao.insertInterview(i);
	};
	@Override
	public int deleteInterview(String id) {
		return interviewDao.deleteInterview(id);
	};
	@Override
	public int updateInterview(Interview i) {
		return interviewDao.updateInterview(i);
	};

}
