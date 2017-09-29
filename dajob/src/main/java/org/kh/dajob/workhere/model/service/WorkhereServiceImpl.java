package org.kh.dajob.workhere.model.service;

import java.util.ArrayList;


import org.kh.dajob.workhere.model.dao.WorkhereDao;
import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WorkhereServiceImpl implements WorkhereService{

	@Autowired
	private WorkhereDao workhereDao;
	
	public WorkhereServiceImpl() {}
	
	@Override
	public ArrayList<Workhere> selectWorkhereList(int currentPage, int limit) {
		return workhereDao.selectWorkhereList(currentPage,limit);
	}
	public Workhere selectWorkhere(String no) {
		return workhereDao.selectWorkhere(no);
	};
	@Override
	public int getListCount() {
		return workhereDao.getListCount();
	}
	@Override
	public int deleteWorkhere(String no) {
		return workhereDao.deleteWorkhere(no);
	};
	@Override
	public int updateWorkhere(Workhere w) {
		return workhereDao.updateWorkhere(w);
	};
}
