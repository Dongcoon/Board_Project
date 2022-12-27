package kr.co.tj.controller.letter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.LetterDAO;
import kr.co.tj.model.vo.LetterVO;

public class LetterViewAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		String u_id = null;
		HttpSession session = req.getSession(false);
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
		}
//		// 임시코드
//		u_id = "write0";
		String whether = req.getParameter("whether");
		LetterDAO ldao = new LetterDAO();
		
		ArrayList<LetterVO> LetterList = ldao.getLetterList(u_id, whether);
		req.setAttribute("LList", LetterList);
		
		forward.setPath("post.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false);  // redirect방식:true, forward방식:false
									 // insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
