package org.kh.dajob.itinfo.model.service;

import java.util.ArrayList;

import org.kh.dajob.itinfo.model.dao.ItinfoDao;
import org.kh.dajob.itinfo.model.vo.Itinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItinfoServiceImpl implements ItinfoService {

	@Autowired
	private ItinfoDao itinfoDao;
	
	@Override
	public ArrayList<Itinfo> selectR5List() {
		return itinfoDao.selectR5List();
	}

	@Override
	public ArrayList<Itinfo> selectList() {
		return itinfoDao.selectList();
	}

	@Override
	public Itinfo selectOne(String itinfo_no) {
		return itinfoDao.selectOne(itinfo_no);
	}

	@Override
	public int insertItinfo(Itinfo itinfo) {
		return itinfoDao.insertItinfo(itinfo);
	}

	@Override
	public int updateItinfo(Itinfo itinfo) {
		return itinfoDao.updateItinfo(itinfo);
	}

	@Override
	public int deleteItinfo(String itinfo_no) {
		return itinfoDao.deleteItinfo(itinfo_no);
	}
}
