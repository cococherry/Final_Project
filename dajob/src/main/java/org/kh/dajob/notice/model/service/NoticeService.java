package org.kh.dajob.notice.model.service;

import java.util.ArrayList;

import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.notice.model.vo.NoticeReply;

public interface NoticeService {
	ArrayList<Notice> selectNoticeList(int currentPage, int limit);
	
	ArrayList<Notice> selectNoticeTitle(String notice_title);
	
	ArrayList<NoticeReply> selectReplyList(String notice_no);
	
	Notice selectOne(String notice_no);
	
	NoticeReply selectReplyOne();
	
	int insertNotice(Notice n);
	
	int insertNoticeReply(NoticeReply np);
	
	int updateNotice(Notice n);
	
	int updateNoticeReply(NoticeReply np);
	
	int deleteNotice(String notice_no);
	
	int deleteNoticeReply(String notice_repno);

	int getListCount();

	String selectReplyLast(String notice_rep_writer);
}
