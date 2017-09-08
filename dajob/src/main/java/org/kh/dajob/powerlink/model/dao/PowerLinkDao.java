package org.kh.dajob.powerlink.model.dao;

import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("powerlinkDao")
public class PowerLinkDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public PowerLink selectId(String memberId) {
		return sqlSession.selectOne("PowerLink.selectId", memberId);
	}
	
	
}
