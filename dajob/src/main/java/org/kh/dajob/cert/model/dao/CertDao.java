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
	
	public int countCert(String userid) {
		return sqlSession.selectOne("Cert.countCert", userid);
	}
	
	public ArrayList<Cert> selectList() {
		return new ArrayList<Cert>(sqlSession.selectList("Cert.selectList"));
	}

	public ArrayList<UserCert> selectUserCertList(String userid) {
		return new ArrayList<UserCert>(sqlSession.selectList("Cert.selectUserCert", userid));
	}
	
	public ArrayList<UserCert> selectMyCertList(String userid) {
		return new ArrayList<UserCert>(sqlSession.selectList("Cert.selectMyCert", userid));
	}
	
	public int insertUserCert(Map<String, Object> map) {
		return sqlSession.insert("Cert.insertUserCert", map);		
	}

	public int deleteUserCert(String member_id) {
		return sqlSession.delete("Cert.deleteUserCert", member_id);
	}
}
