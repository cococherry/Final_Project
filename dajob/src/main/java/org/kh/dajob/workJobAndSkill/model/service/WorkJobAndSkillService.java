package org.kh.dajob.workJobAndSkill.model.service;

import java.util.ArrayList;

import org.kh.dajob.workJobAndSkill.model.vo.*;

public interface WorkJobAndSkillService {
	ArrayList<WorkJob> selectJobList();
	ArrayList<WorkSkill> selectSkillList();
}
