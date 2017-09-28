package org.kh.dajob.cert.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.kh.dajob.cert.model.vo.Cert;
import org.kh.dajob.cert.model.vo.CountCert;
import org.kh.dajob.cert.model.vo.TotalCert;
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
	
	public ArrayList<TotalCert> totalCert(String userid) {
		return new ArrayList<TotalCert>(sqlSession.selectList("selectTotalCert", userid));
	}
	
	public ArrayList<CountCert> countCert(String userid) {
		return new ArrayList<CountCert>(sqlSession.selectList("Cert.selectCountCert", userid));
	}	
		
	public int insertUserCert(Map<String, Object> map) {
		return sqlSession.insert("Cert.insertUserCert", map);		
	}

	public int deleteUserCert(String member_id) {
		return sqlSession.delete("Cert.deleteUserCert", member_id);
	}
	
	public ArrayList<TotalCert> recommendCert(String userid){
		return new ArrayList<TotalCert>(sqlSession.selectList("Cert.recommendCert", userid));
	}
}
