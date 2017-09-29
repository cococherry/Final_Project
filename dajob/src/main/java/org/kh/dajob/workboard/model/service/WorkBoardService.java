package org.kh.dajob.workboard.model.service;

import java.util.ArrayList;

import org.kh.dajob.member.model.vo.Member;
import org.kh.dajob.workboard.model.vo.WorkBoard;

public interface WorkBoardService {

	int getListCount(String memberId);

	ArrayList<WorkBoard> likeCompList(String memberId, int page, int limit);

	int getListCount(WorkBoard w);

	ArrayList<WorkBoard> likeCompList(WorkBoard w, int page, int limit);

	int deleteOne(WorkBoard w);
	
	Object likeList(Member m);
	
	int workboardInsert(WorkBoard w);

}
