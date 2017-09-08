package org.kh.dajob.cert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.kh.dajob.cert.model.vo.Cert;
import org.kh.dajob.cert.model.vo.UserCert;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("certDao")
public class CertDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Cert> selectList() {
		return new ArrayList<Cert>(sqlSession.selectList("Cert.selectList"));
	}

	public ArrayList<UserCert> selectUserCertList(String userid) {
		return new ArrayList<UserCert>(sqlSession.selectList("Cert.selectUserCert", userid));
	}
	
	public int insertUserCert(Map<String, Object> map) {
		return sqlSession.insert("Cert.insertUserCert", map);		
	}

	public int deleteUserCert(String member_id) {
		return sqlSession.delete("Cert.deleteUserCert", member_id);
	}
}
