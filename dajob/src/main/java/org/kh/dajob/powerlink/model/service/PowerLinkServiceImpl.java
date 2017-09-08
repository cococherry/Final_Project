package org.kh.dajob.powerlink.model.service;

import org.kh.dajob.powerlink.model.dao.PowerLinkDao;
import org.kh.dajob.powerlink.model.vo.PowerLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("powerlinkService")
public class PowerLinkServiceImpl implements PowerLinkService {
	@Autowired
	private PowerLinkDao powerlinkDao;

	@Override
	public PowerLink selectId(String memberId) {
		return powerlinkDao.selectId(memberId);
	}
	
	

}
