package org.kh.dajob.interview.model.dao;

import java.util.ArrayList;

import org.kh.dajob.interview.model.vo.Interview;
import org.kh.dajob.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("interviewDao")
public class InterviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public InterviewDao() {}
	
	public Interview selectInterview(Interview i) {
		return sqlSession.selectOne("Interview.selectInterview", i);

	}

	public ArrayList<Interview> selectInterviewList() {
		return new ArrayList<Interview>(sqlSession.selectList("Interview.selectInterviewList"));

	}
	
	public ArrayList<Interview> selectInterviewList(Member m) {
		ArrayList<Interview> list = null;
		String member_id = m.getMember_id();
		if (m.getMember_type_code().equals("C")) {
			list = new ArrayList<Interview>(sqlSession.selectList("Interview.selectInterviewerList",member_id));
		} else if (m.getMember_type_code().equals("U")) {
			list = new ArrayList<Interview>(sqlSession.selectList("Interview.selectIntervieweeList",member_id));
		} else {
			list = new ArrayList<Interview>(sqlSession.selectList("Interview.selectInterviewList"));
		}
		return list;

	}

	public int insertInterview(Interview i) {
		return sqlSession.insert("Interview.insertInterview",i);
	}

	public int deleteInterview(String id) {
		return sqlSession.delete("Interview.deleteInterview",id);
	}

	public int updateInterview(Interview i) {
		return sqlSession.update("Interview.updateInterview",i);
	}

}
