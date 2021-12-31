package com.today.DTO;

public class memberDTO {

	private	String mb_id;
	private String mb_pw;
	private String mb_nickname;
	private String mb_phone;
	private String mb_region;
	
	// 회원가입
	public memberDTO(String mb_id, String mb_pw, String mb_nickname, String mb_phone, String mb_region) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_nickname = mb_nickname;
		this.mb_phone = mb_phone;
		this.mb_region = mb_region;
	}
	
	// 로그인
	public memberDTO(String mb_id, String mb_pw) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
	}
	
	
	// 로그인 후 세션용
	public memberDTO(String mb_id, String mb_phone, String mb_region) {
		super();
		this.mb_id = mb_id;
		this.mb_phone = mb_phone;
		this.mb_region = mb_region;
	}

	
	
	public memberDTO(String mb_id, String mb_pw, String mb_nickname, String mb_region) {
		super();
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_nickname = mb_nickname;
		this.mb_region = mb_region;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_nickname() {
		return mb_nickname;
	}
	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_region() {
		return mb_region;
	}
	public void setMb_region(String mb_region) {
		this.mb_region = mb_region;
	}
	
	
	
}	
	