package com.inter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// 기능을 구현하는 것이 아닌 규칙을 정하는 곳이기 때문에 기능을 정의할수없다.
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;

}
