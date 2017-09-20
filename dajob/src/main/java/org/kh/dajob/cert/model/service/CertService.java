package org.kh.dajob.cert.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.kh.dajob.cert.model.vo.Cert;
import org.kh.dajob.cert.model.vo.UserCert;
import org.kh.dajob.member.model.vo.Member;

public interface CertService {
	ArrayList<Cert> selectList();
	
	ArrayList<UserCert> selectUserCertList(Member m);
	
	ArrayList<UserCert> selectMyCertList(Member m);
	
	int insertUserCert(Map<String, Object> map);
	
	int deleteUserCert(String member_id);
	
	int countCert(String userid);
}
