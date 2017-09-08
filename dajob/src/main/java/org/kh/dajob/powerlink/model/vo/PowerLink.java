package org.kh.dajob.powerlink.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PowerLink implements Serializable{
	private static final long serialVersionUID = 51111111111L;
	
	private String member_id;
	private Date powerlink_date;
	private int powerlink_cnt;
	private int powerlink_time;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getPowerlink_date() {
		return powerlink_date;
	}
	public void setPowerlink_date(Date powerlink_date) {
		this.powerlink_date = powerlink_date;
	}
	public int getPowerlink_cnt() {
		return powerlink_cnt;
	}
	public void setPowerlink_cnt(int powerlink_cnt) {
		this.powerlink_cnt = powerlink_cnt;
	}
	public int getPowerlink_time() {
		return powerlink_time;
	}
	public void setPowerlink_time(int powerlink_time) {
		this.powerlink_time = powerlink_time;
	}
	
	

}
