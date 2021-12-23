package com.today.DTO;

public class boardDTO {
		private int m_article_seq;
		private String m_article_subject;
		private String m_article_content;
		private String m_article_img;
		private String m_article_date;
		private int m_article_likes;
		private String mb_id;
		private String m_article_region;
		private int m_article_latitude;
		private int m_article_logitude;
		
		public boardDTO(int m_article_seq, String m_article_subject, String m_article_content, String m_article_img,
				String m_article_date, String mb_id, String m_article_region) {
			super();
			this.m_article_seq = m_article_seq;
			this.m_article_subject = m_article_subject;
			this.m_article_content = m_article_content;
			this.m_article_img = m_article_img;
			this.m_article_date = m_article_date;
			this.mb_id = mb_id;
			this.m_article_region = m_article_region;
		}

		public int getM_article_seq() {
			return m_article_seq;
		}

		public String getM_article_subject() {
			return m_article_subject;
		}

		public String getM_article_content() {
			return m_article_content;
		}

		public String getM_article_img() {
			return m_article_img;
		}

		public String getM_article_date() {
			return m_article_date;
		}

		public int getM_article_likes() {
			return m_article_likes;
		}

		public String getMb_id() {
			return mb_id;
		}

		public String getM_article_region() {
			return m_article_region;
		}

		public int getM_article_latitude() {
			return m_article_latitude;
		}

		public int getM_article_logitude() {
			return m_article_logitude;
		}
		
		
		
		
 
		
}
