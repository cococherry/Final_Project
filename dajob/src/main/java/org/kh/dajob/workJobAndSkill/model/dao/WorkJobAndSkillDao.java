package org.kh.dajob.workJobAndSkill.model.dao;

import java.util.ArrayList;
import org.kh.dajob.workJobAndSkill.model.vo.WorkJob;
import org.kh.dajob.workJobAndSkill.model.vo.WorkSkill;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("workJobnSkillDao")
public class WorkJobAndSkillDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<WorkJob> selectJobList() {
		return new ArrayList<WorkJob>(sqlSession.selectList("JobAndSkill.selectJobList"));
	}

	public ArrayList<WorkSkill> selectSkillList() {
		return new ArrayList<WorkSkill>(sqlSession.selectList("JobAndSkill.selectSkillList"));
	}

}
