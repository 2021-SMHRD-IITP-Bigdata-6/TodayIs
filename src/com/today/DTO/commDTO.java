package com.today.DTO;

public class commDTO {

	private int m_article_seq;
	private int comm_seq;
	private String comm_content;
	private String mb_id;
	private String comm_date;
	
	public commDTO(int m_article_seq, String comm_content, String mb_id) {
		super();
		this.m_article_seq = m_article_seq;
		this.comm_content = comm_content;
		this.mb_id = mb_id;
	}

	public int getM_article_seq() {
		return m_article_seq;
	}

	public void setM_article_seq(int m_article_seq) {
		this.m_article_seq = m_article_seq;
	}

	public String getComm_content() {
		return comm_content;
	}

	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getComm_seq() {
		return comm_seq;
	}

	public void setComm_seq(int comm_seq) {
		this.comm_seq = comm_seq;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}

	public commDTO(int m_article_seq, int comm_seq, String comm_content, String mb_id, String comm_date) {
		super();
		this.m_article_seq = m_article_seq;
		this.comm_seq = comm_seq;
		this.comm_content = comm_content;
		this.mb_id = mb_id;
		this.comm_date = comm_date;
	}
	
	
}
