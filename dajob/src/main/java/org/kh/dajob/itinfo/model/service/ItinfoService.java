package org.kh.dajob.itinfo.model.service;

import java.util.ArrayList;

import org.kh.dajob.itinfo.model.vo.Itinfo;

public interface ItinfoService {
	ArrayList<Itinfo> selectR5List();
	
	ArrayList<Itinfo> selectList();
	
	Itinfo selectOne(String itinfo_no);
	
	int insertItinfo(Itinfo itinfo);
	
	int updateItinfo(Itinfo itinfo);
	
	int deleteItinfo(String itinfo_no);
}
