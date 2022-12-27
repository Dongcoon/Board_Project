package kr.co.tj.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		
		mvo.setU_id((String)req.getParameter("u_id"));
		mvo = mdao.login(mvo);
		
		forward.setPath("loginFail.html"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true);    // redirect방식:true, forward방식:false
		
		if (mvo == null) {
			System.out.println("로그 : 로그인 에러. 아이디가 없음");
//			HttpSession session = req.getSession();
//            session.setAttribute("login", "fail");
//            forward = new ActionForward();
//            forward.setPath("index.jsp");
//            forward.setRedirect(true);
			
		} else {
			if (mvo.getU_pw().equals((String)req.getParameter("u_pw"))) {
				System.out.println("로그 : 비밀번호 일치");
				
				HttpSession session = req.getSession();
				session.setAttribute("u_id", mvo.getU_id());
				session.setAttribute("u_nickname", mvo.getU_nickname());

				forward.setPath("index.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
				forward.setRedirect(true);    // redirect방식:true, forward방식:false
											  // insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
			} else {
				System.out.println(req.getParameter("u_pw")+" "+mvo.getU_pw());
				System.out.println("로그 : 비밀번호 불일치");
			}
		}
		
		
		return forward;
	}

}
