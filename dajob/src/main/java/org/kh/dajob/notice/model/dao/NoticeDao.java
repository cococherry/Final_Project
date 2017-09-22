package org.kh.dajob.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.notice.model.vo.NoticeReply;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> selectNoticeList(int currentPage, int limit){
		RowBounds rows = new RowBounds(((currentPage-1)*limit), limit);
		//System.out.println("rows : "+(((currentPage-1)*limit))+", "+limit);
		return new ArrayList<Notice>(sqlSession.selectList("Notice.selectNoticeList", null, rows));
	}
	
	public ArrayList<Notice> selectNoticeTitle(String notice_title){
		return new ArrayList<Notice>(sqlSession.selectList("Notice.selectNoticeTitleList",notice_title));
	}
	
	public ArrayList<NoticeReply> selectReplyList(String notice_no){
		return new ArrayList<NoticeReply>(sqlSession.selectList("Notice.selectNoticeReply",notice_no));
	}
	
	public Notice selectOne(String notice_no) {
		return sqlSession.selectOne("Notice.selectOne",notice_no);
	}
	
	public NoticeReply selectReplyOne() {
		return null;
	}
	
	public int insertNotice(Notice n) {
		return sqlSession.insert("Notice.insertNotice",n);
	}
	
	public int insertNoticeReply(NoticeReply np){
		return sqlSession.insert("Notice.insertNoticeReply", np);
	}
	
	public int updateNotice(Notice n){
		return sqlSession.update("Notice.updateNotice", n);
	}
	
	public int updateNoticeReply(NoticeReply np){
		return sqlSession.update("Notice.updateNoticeReply", np);
	}
	
	public int deleteNotice(String notice_no){
		return sqlSession.delete("Notice.deleteNotice",notice_no);
	}
	
	public int deleteNoticeReply(String notice_repno){
		return sqlSession.delete("Notice.deleteNoticeReply",notice_repno);
	}

	public int getListCount() {
		return sqlSession.selectOne("Notice.getListCount");
	}

	public String selectReplyLast(String notice_rep_writer) {
		return sqlSession.selectOne("Notice.getLastReply",notice_rep_writer);
	}
}
