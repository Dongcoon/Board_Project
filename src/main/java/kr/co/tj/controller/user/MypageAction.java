package kr.co.tj.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.MemberVO;

public class MypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ActionForward forward = null;
		
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		HttpSession session = req.getSession();
		vo = dao.mypage((String)session.getAttribute("u_id"));
		
		req.setAttribute("mypage", vo);
		if(vo != null) {
			forward = new ActionForward();
			forward.setPath("mypage.jsp");
			forward.setRedirect(false);
		} else {
			throw new Exception("mypage 로딩 중 에러발생!");
		}		
		
		return forward;
	}

}
