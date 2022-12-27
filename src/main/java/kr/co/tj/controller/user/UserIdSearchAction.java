package kr.co.tj.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class UserIdSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		
		String u_name = req.getParameter("u_name");
		String u_jumin = req.getParameter("u_jumin1")+req.getParameter("u_jumin2");
		
		mvo.setU_name(u_name);
		mvo.setU_jumin(u_jumin);
		
		mvo = mdao.searchID(mvo);		
		
		if (mvo != null) {
			System.out.println("아이디 찾기 성공 : id="+mvo.getU_id());
			req.setAttribute("u_id", mvo.getU_id());
			forward.setPath("searchedID.jsp");
		} else {
			System.out.println("아이디 찾기 실패!");
			forward.setPath("idsearchfail.html"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		}
		
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
