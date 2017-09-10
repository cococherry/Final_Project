package org.kh.dajob.notice.model.service;

import java.util.ArrayList;

import org.kh.dajob.notice.model.dao.NoticeDao;
import org.kh.dajob.notice.model.vo.Notice;
import org.kh.dajob.notice.model.vo.NoticeReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public ArrayList<Notice> selectNoticeTitle(String notice_title) {
		return noticeDao.selectNoticeTitle(notice_title);
	}

	@Override
	public ArrayList<NoticeReply> selectReplyList() {
		return noticeDao.selectReplyList();
	}

	@Override
	public Notice selectOne() {
		return noticeDao.selectOne();
	}

	@Override
	public NoticeReply selectReplyOne() {
		return noticeDao.selectReplyOne();
	}

	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(n);
	}

	@Override
	public int insertNoticeReply(NoticeReply np) {
		return noticeDao.insertNoticeReply(np);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(n);
	}

	@Override
	public int updateNoticeReply(NoticeReply np) {
		return noticeDao.updateNoticeReply(np);
	}

	@Override
	public int deleteNotice(String notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public int deleteNoticeReply(String notice_repno) {
		return noticeDao.deleteNoticeReply(notice_repno);
	}
}
