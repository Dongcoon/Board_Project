package kr.co.tj.controller.user;

//완료

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ActionForward forward = new ActionForward();
		forward.setPath("index.jsp");
		forward.setRedirect(true);
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		
		return forward;
	}

}
