package com.today.DTO;

public class mainPageDTO {

	private String w_index;
	private String w_local;
	private String w_status;
	private String w_temp;
	private String w_body_temp;
	private String w_humidity;
	private String w_wind;
	
	public mainPageDTO(String w_index, String w_local, String w_status, String w_temp, String w_body_temp,
			String w_humidity, String w_wind) {
		super();
		this.w_index = w_index;
		this.w_local = w_local;
		this.w_status = w_status;
		this.w_temp = w_temp;
		this.w_body_temp = w_body_temp;
		this.w_humidity = w_humidity;
		this.w_wind = w_wind;
	}
	
	public mainPageDTO(String w_local, String w_status, String w_temp) {
		super();
		this.w_local = w_local;
		this.w_status = w_status;
		this.w_temp = w_temp;
	}

	public mainPageDTO(String w_status) {
		super();
		this.w_status = w_status;
	}

	public String getW_index() {
		return w_index;
	}

	public void setW_index(String w_index) {
		this.w_index = w_index;
	}

	public String getW_local() {
		return w_local;
	}

	public void setW_local(String w_local) {
		this.w_local = w_local;
	}

	public String getW_status() {
		return w_status;
	}

	public void setW_status(String w_status) {
		this.w_status = w_status;
	}

	public String getW_temp() {
		return w_temp;
	}

	public void setW_temp(String w_temp) {
		this.w_temp = w_temp;
	}

	public String getW_body_temp() {
		return w_body_temp;
	}

	public void setW_body_temp(String w_body_temp) {
		this.w_body_temp = w_body_temp;
	}

	public String getW_humidity() {
		return w_humidity;
	}

	public void setW_humidity(String w_humidity) {
		this.w_humidity = w_humidity;
	}

	public String getW_wind() {
		return w_wind;
	}

	public void setW_wind(String w_wind) {
		this.w_wind = w_wind;
	}
	
}
