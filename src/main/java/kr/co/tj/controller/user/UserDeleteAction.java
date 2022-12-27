package kr.co.tj.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;

public class UserDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ActionForward forward = null;
		
		MemberDAO dao = new MemberDAO();
		
		
		if(dao.delete(req.getParameter("u_id"))) {
			HttpSession session = req.getSession();
			session.invalidate();
			
			forward = new ActionForward();
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		} else {
			throw new Exception("회원삭제 중 에러발생!");
		}
				
		
		return forward;
	}

}
