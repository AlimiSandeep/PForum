package com.pramati.pforum.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "contactus")
public class Contactus {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int userid;
	private String uname;
	private String email;
	private String msgTitle;
	private String msgDesc;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgDesc() {
		return msgDesc;
	}

	public void setMsgDesc(String msgDesc) {
		this.msgDesc = msgDesc;
	}

	@Override
	public String toString() {
		return "Contactus [userid=" + userid + ", uname=" + uname + ", email=" + email + ", msgTitle=" + msgTitle
				+ ", msgDesc=" + msgDesc + "]";
	}

}
