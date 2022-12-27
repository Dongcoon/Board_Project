package kr.co.tj.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.MemberVO;

public class UserUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		ActionForward forward = null;
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setU_pw(req.getParameter("u_pw"));
		vo.setU_nickname(req.getParameter("u_nickname"));
		vo.setU_id(req.getParameter("u_id"));
		
		if(dao.update(vo)) {
			HttpSession session = req.getSession();
			session.setAttribute("u_id", vo.getU_id());
			session.setAttribute("u_nickname", vo.getU_nickname());
			
			forward = new ActionForward();
			forward.setPath("boardViewAllAction.do");
			forward.setRedirect(true);
		} else {
			throw new Exception("회원수정 중 에러발생!");
		}	
		
		return forward;
	}

}
