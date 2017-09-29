package org.kh.dajob.workJobAndSkill.model.service;

import java.util.ArrayList;

import org.kh.dajob.workJobAndSkill.model.dao.WorkJobAndSkillDao;
import org.kh.dajob.workJobAndSkill.model.vo.WorkJob;
import org.kh.dajob.workJobAndSkill.model.vo.WorkSkill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workJobnSkillService")
public class WorkJobAndSkillServiceImpl implements WorkJobAndSkillService {

	@Autowired
	private WorkJobAndSkillDao workJobnSkillDao;
	
	@Override
	public ArrayList<WorkJob> selectJobList() {
		return workJobnSkillDao.selectJobList();
	}

	@Override
	public ArrayList<WorkSkill> selectSkillList() {
		return workJobnSkillDao.selectSkillList();
	}

}
