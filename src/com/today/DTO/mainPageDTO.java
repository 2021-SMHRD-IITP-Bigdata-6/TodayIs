package com.today.DTO;

public class mainPageDTO {

	private String Weather_stat;
	private String City_index;
	private String City_name;
	private String Temp;
	private String Body_temp;
	private String Hum;
	private String Wind;
	
	public mainPageDTO(String weather_stat, String city_index, String city_name, String temp, String body_temp,
			String hum, String wind) {
		super();
		Weather_stat = weather_stat;
		City_index = city_index;
		City_name = city_name;
		Temp = temp;
		Body_temp = body_temp;
		Hum = hum;
		Wind = wind;
	}

	public mainPageDTO(String weather_stat) {
		super();
		Weather_stat = weather_stat;
	}
	

	public mainPageDTO(String weather_stat, String city_name) {
		super();
		Weather_stat = weather_stat;
		City_name = city_name;
	}

	public String getWeather_stat() {
		return Weather_stat;
	}

	public void setWeather_stat(String weather_stat) {
		Weather_stat = weather_stat;
	}

	public String getCity_index() {
		return City_index;
	}

	public void setCity_index(String city_index) {
		City_index = city_index;
	}

	public String getCity_name() {
		return City_name;
	}

	public void setCity_name(String city_name) {
		City_name = city_name;
	}

	public String getTemp() {
		return Temp;
	}

	public void setTemp(String temp) {
		Temp = temp;
	}

	public String getBody_temp() {
		return Body_temp;
	}

	public void setBody_temp(String body_temp) {
		Body_temp = body_temp;
	}

	public String getHum() {
		return Hum;
	}

	public void setHum(String hum) {
		Hum = hum;
	}

	public String getWind() {
		return Wind;
	}

	public void setWind(String wind) {
		Wind = wind;
	}
	
	
	
}
