package kr.co.tj.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public abstract ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
		// # ActionForward
		//   - path : 경로
		//   - redirect : forward/sendredirect
	
}
