package org.kh.dajob.cert.model.vo;

import java.io.Serializable;

public class CountCert implements Serializable {

	private static final long serialVersionUID = 2122112122L;
	
	private String cert_value;
	private int cert_count;
	
	public CountCert() {}

	public CountCert(String cert_value, int cert_count) {
		super();
		this.cert_value = cert_value;
		this.cert_count = cert_count;
	}

	@Override
	public String toString() {
		return "CountCert [cert_type=" + cert_value + ", cert_count=" + cert_count + "]";
	}

	public String getCert_value() {
		return cert_value;
	}

	public void setCert_value(String cert_value) {
		this.cert_value = cert_value;
	}

	public int getCert_count() {
		return cert_count;
	}

	public void setCert_count(int cert_count) {
		this.cert_count = cert_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}