package org.kh.dajob.workboard.model.service;

import java.util.ArrayList;

import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.workboard.model.dao.WorkBoardDao;
import org.kh.dajob.workboard.model.vo.WorkBoard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workboardService")
public class WorkBoardServiceImpl implements WorkBoardService{
	@Autowired
	private WorkBoardDao workboardDao;

	@Override
	public ArrayList<WorkBoard> likeCompList(String memberId, int page, int limit) {
		return workboardDao.likeCompList(memberId, page, limit);
	}

	@Override
	public int getListCount(String memberId) {
		return workboardDao.getListCount(memberId);
	}

	@Override
	public int getListCount(WorkBoard w) {
		return workboardDao.getListCount(w);
	}

	@Override
	public ArrayList<WorkBoard> likeCompList(WorkBoard w, int page, int limit) {
		return workboardDao.likeCompList(w, page, limit);
	}

	@Override
	public int deleteOne(WorkBoard w) {
		return workboardDao.deleteOne(w);
	}
	
	@Override
	public Object likeList(Member m) {
		String userid = m.getMember_id();
		return workboardDao.likeList(userid);
	}
	@Override
	public int workboardInsert(WorkBoard w) {
		return workboardDao.insertWorkboard(w);
	}
}
