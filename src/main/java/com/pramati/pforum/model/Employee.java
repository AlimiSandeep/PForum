package com.pramati.pforum.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee_reg")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int id;
	@Column
	private String fname;
	@Column
	private String lname;
	@Column(unique = true)
	private int employeeId;
	@Column
//@Temporal(TemporalType.DATE)
//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String dob;
	@Column(unique = true)
	private String email;
	@Column
	private String userName;
	@Column
	private String passkey;
	@Column
	private String desig;
	@Column
	private String location;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasskey() {
		return passkey;
	}

	public void setPasskey(String passkey) {
		this.passkey = passkey;
	}

	public String getDesig() {
		return desig;
	}

	public void setDesig(String desig) {
		this.desig = desig;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", fname=" + fname + ", lname=" + lname + ", employeeId=" + employeeId + ", dob="
				+ dob + ", email=" + email + ", userName=" + userName + ", passkey=" + passkey + ", desig=" + desig
				+ ", location=" + location + "]";
	}

}
