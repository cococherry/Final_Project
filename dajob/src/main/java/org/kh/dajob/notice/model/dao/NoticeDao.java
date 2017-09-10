package org.kh.dajob.notice.model.dao;

import java.util.ArrayList;

import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.notice.model.vo.NoticeReply;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> selectNoticeList(){
		return null;
	}
	
	public ArrayList<Notice> selectNoticeTitle(String notice_title){
		return null;
	}
	
	public ArrayList<NoticeReply> selectReplyList(){
		return null;
	}
	
	public Notice selectOne() {
		return null;
	}
	
	public NoticeReply selectReplyOne() {
		return null;
	}
	
	public int insertNotice(Notice n) {
		return 0;
	}
	
	public int insertNoticeReply(NoticeReply np){
		return 0;
	}
	
	public int updateNotice(Notice n){
		return 0;
	}
	
	public int updateNoticeReply(NoticeReply np){
		return 0;
	}
	
	public int deleteNotice(String notice_no){
		return 0;
	}
	
	public int deleteNoticeReply(String notice_repno){
		return 0;
	}
}
