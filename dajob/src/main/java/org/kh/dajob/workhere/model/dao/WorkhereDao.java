package org.kh.dajob.workhere.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("workheredao")
public class WorkhereDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public WorkhereDao() {}
	
	public ArrayList<Workhere> selectWorkhereList(int currentPage, int limit) {
		RowBounds rows = new RowBounds(((currentPage-1)*limit), limit);
		return new ArrayList<Workhere>(sqlSession.selectList("Workhere.selectWorkhereList", null, rows));
	}
	public Workhere selectWorkhere(String no) {
		return sqlSession.selectOne("Workhere.selectWorkhere",no);
	}

	public int getListCount() {
		return sqlSession.selectOne("Workhere.getListCount");
	}

	public int deleteWorkhere(String no) {
		return sqlSession.delete("Workhere.deleteWorkhere");
	}
}
