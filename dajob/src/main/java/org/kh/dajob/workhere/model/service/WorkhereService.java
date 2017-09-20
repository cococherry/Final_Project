package org.kh.dajob.workhere.model.service;

import java.util.ArrayList;

import org.kh.dajob.workhere.model.vo.Workhere;
import org.springframework.stereotype.Service;


public interface WorkhereService {

	ArrayList<Workhere> selectWorkhereList();
	Workhere selectWorkhere(String no);
}
