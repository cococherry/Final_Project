package org.kh.dajob.cert.model.vo;

public class Cert implements java.io.Serializable {
	
	private static final long serialVersionUID = 2111111111L;
	
	private String cert_no;
	private String cert_name;
	private String cert_type;
	
	public Cert() {}

	public Cert(String cert_no, String cert_name, String cert_type) {
		super();
		this.cert_no = cert_no;
		this.cert_name = cert_name;
		this.cert_type = cert_type;
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
	
}
