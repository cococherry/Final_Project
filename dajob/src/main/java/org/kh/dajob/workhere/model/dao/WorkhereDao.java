package org.kh.dajob.workhere.model.dao;

import java.util.ArrayList;

import org.kh.dajob.workhere.model.vo.Workhere;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("workheredao")
public class WorkhereDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public WorkhereDao() {}
	
	public ArrayList<Workhere> selectWorkhereList() {
		return new ArrayList<Workhere>(sqlSession.selectList("Workhere.selectWorkhereList"));
	}
	public Workhere selectWorkhere(String no) {
		return sqlSession.selectOne("Workhere.selectWorkhereList",no);
	}
}
