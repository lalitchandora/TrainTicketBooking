package com.eBookManagementSytem.models;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, unique = true)
    private String uname;
    
    @Column(nullable = false, unique = true)
    private String uemail;

    @Column(nullable = false)
    private String upwd;

    @Column(nullable = false)
    private Long umobile;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public Long getUmobile() {
		return umobile;
	}

	public void setUmobile(Long umobile) {
		this.umobile = umobile;
	}

 
}
