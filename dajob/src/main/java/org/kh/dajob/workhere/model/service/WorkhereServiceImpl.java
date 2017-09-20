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
	public ArrayList<Workhere> selectWorkhereList() {
		return workhereDao.selectWorkhereList();
	}
	public Workhere selectWorkhere(String no) {
		return workhereDao.selectWorkhere(no);
	};
	
}
