package org.kh.dajob.cert.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.kh.dajob.cert.model.dao.CertDao;
import org.kh.dajob.cert.model.vo.Cert;
import org.kh.dajob.cert.model.vo.UserCert;
import org.kh.dajob.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertServiceImpl implements CertService {

	@Autowired
	// �쓽議댁꽦 二쇱엯 : Dependancy Injection
	private CertDao certDao;

	@Override
	public ArrayList<Cert> selectList() {
		return certDao.selectList();
	}
	
	@Override
	public ArrayList<UserCert> selectUserCertList(Member m) {
		String userid = m.getMember_id();
		return certDao.selectUserCertList(userid);
	}
	
	@Override
	public ArrayList<UserCert> selectMyCertList(Member m) {
		String userid = m.getMember_id();
		return certDao.selectMyCertList(userid);
	}

	@Override
	public int insertUserCert(Map<String, Object> map) {
		return certDao.insertUserCert(map);
	}

	@Override
	public int deleteUserCert(String member_id) {
		return certDao.deleteUserCert(member_id);
	}

	@Override
	public int countCert(String userid) {
		return certDao.countCert(userid);
	}
	
}
