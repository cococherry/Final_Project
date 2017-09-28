package org.kh.dajob.cert.model.vo;

import java.sql.Date;

public class TotalCert implements java.io.Serializable {
	
	private static final long serialVersionUID = 21414124L;
	
	private String cert_no;
	private String cert_name;
	private String cert_type;
	private String member_id;
	private Date cert_date;
	private String cert_value;
	
	public TotalCert() {}

	public TotalCert(String cert_no, String cert_name, String cert_type, String member_id, Date cert_date,
			String cert_value) {
		super();
		this.cert_no = cert_no;
		this.cert_name = cert_name;
		this.cert_type = cert_type;
		this.member_id = member_id;
		this.cert_date = cert_date;
		this.cert_value = cert_value;
	}

	@Override
	public String toString() {
		return "TotalCert [cert_no=" + cert_no + ", cert_name=" + cert_name + ", cert_type=" + cert_type
				+ ", member_id=" + member_id + ", cert_date=" + cert_date + ", cert_value=" + cert_value + "]";
	}

	public String getCert_no() {
		return cert_no;
	}

	public void setCert_no(String cert_no) {
		this.cert_no = cert_no;
	}

	public String getCert_name() {
		return cert_name;
	}

	public void setCert_name(String cert_name) {
		this.cert_name = cert_name;
	}

	public String getCert_type() {
		return cert_type;
	}

	public void setCert_type(String cert_type) {
		this.cert_type = cert_type;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getCert_date() {
		return cert_date;
	}

	public void setCert_date(Date cert_date) {
		this.cert_date = cert_date;
	}

	public String getCert_value() {
		return cert_value;
	}

	public void setCert_value(String cert_value) {
		this.cert_value = cert_value;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}