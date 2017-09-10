package org.kh.dajob.itinfo.model.dao;

import java.util.ArrayList;

import org.kh.dajob.itinfo.model.vo.Itinfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("itinfoDao")
public class ItinfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Itinfo> selectR5List() {
		return null;
	}

	public ArrayList<Itinfo> selectList() {
		return null;
	}

	public Itinfo selectOne(String itinfo_no) {
		return null;
	}

	public int insertItinfo(Itinfo itinfo) {
		return 0;
	}

	public int updateItinfo(Itinfo itinfo) {
		return 0;
	}

	public int deleteItinfo(String itinfo_no) {
		return 0;
	}
 
}
