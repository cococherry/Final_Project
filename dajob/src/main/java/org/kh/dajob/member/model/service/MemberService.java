package org.kh.dajob.member.model.service;

import java.util.ArrayList;

import org.kh.dajob.member.model.vo.Company;
import org.kh.dajob.member.model.vo.CompanyType;
import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.member.model.vo.User;
import org.kh.dajob.workboard.model.vo.WorkBoard;

public interface MemberService {
	Member loginMember(Member m);
	
	ArrayList<CompanyType> selectCompanyList();
	
	ArrayList<Company> selectCompanyAll();
	
	ArrayList<User> selectUserAll();
	
	User selectUser(Member m);
	
	Company selectCompany(Member m);
	
	int checkIdDup(String id);
	
	int insertMember(Member m);
	
	int insertUser(User u);
	
	int insertCompany(Company c);

	int updateMember(Member m);

	int deleteMember(String id);
	
	ArrayList<WorkBoard> likeCompList(String memberId, int page);

	int getListCount(String memberId);
	
	
}
