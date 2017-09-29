package org.kh.dajob.workboard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("workboardDao")
public class WorkBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<WorkBoard> likeCompList(String memberId, int page, int limit) {
		RowBounds rowBounds = new RowBounds(((page - 1) * limit), limit);
		return new ArrayList<WorkBoard>(sqlSession.selectList("WorkBoard.selectList", memberId, rowBounds));
	}

	public int getListCount(String memberId) {
		return sqlSession.selectOne("WorkBoard.getListCount", memberId);
	}

	public int getListCount(WorkBoard w) {
		return sqlSession.selectOne("WorkBoard.getListCount2", w);
	}

	public ArrayList<WorkBoard> likeCompList(WorkBoard w, int page, int limit) {
		RowBounds rowBounds = new RowBounds(((page - 1) * limit), limit);
		return new ArrayList<WorkBoard>(sqlSession.selectList("WorkBoard.selectList2", w, rowBounds));
	}

	public int deleteOne(WorkBoard w) {
		return sqlSession.delete("WorkBoard.deleteOne", w);
	}
	
	public Object likeList(String userid) {
		return sqlSession.selectList("WorkBoard.likeList", userid);
	}

	public int insertWorkboard(WorkBoard w) {
		// TODO Auto-generated method stub
		return sqlSession.insert("WorkBoard.insertWorkboard", w);
	}
}
