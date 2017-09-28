package org.kh.dajob.cert.model.vo;

public class Cert implements java.io.Serializable {
	
	private static final long serialVersionUID = 2111111111L;
	
	private String cert_no;
	private String cert_name;
	private String cert_type;
	private String cert_value;
	
	public Cert() {}

	public Cert(String cert_no, String cert_name, String cert_type, String cert_value) {
		super();
		this.cert_no = cert_no;
		this.cert_name = cert_name;
		this.cert_type = cert_type;
		this.cert_value = cert_value;
	}

	@Override
	public String toString() {
		return "Cert [cert_no=" + cert_no + ", cert_name=" + cert_name + ", cert_type=" + cert_type + ", cert_value="
				+ cert_value + "]";
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
