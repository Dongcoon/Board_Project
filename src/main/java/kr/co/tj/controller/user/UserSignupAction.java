package kr.co.tj.controller.user;

// �Ϸ�

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.MemberVO;

public class UserSignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ActionForward forward = null;
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setU_id(req.getParameter("u_id"));
		vo.setU_pw(req.getParameter("u_pw"));
		vo.setU_name(req.getParameter("u_name"));
		vo.setU_nickname(req.getParameter("u_nickname"));
		vo.setU_jumin(req.getParameter("u_jumin1")+req.getParameter("u_jumin2"));
		vo.setU_email(req.getParameter("u_email"));
		
		if(dao.insert(vo)) {
			forward = new ActionForward();
			forward.setPath("signupsuccess.html");
			forward.setRedirect(true);			
		} else {
			throw new Exception("회원가입중 에러발생!");
		}
		
		
		return forward;
	}

}
