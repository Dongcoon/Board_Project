package kr.co.tj.controller.letter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.LetterDAO;
import kr.co.tj.model.vo.LetterVO;

public class LetterViewOneAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
				
		LetterDAO ldao = new LetterDAO();
		LetterVO lvo = new LetterVO();  
		
		String whether = req.getParameter("whether");
		
		int l_no = Integer.parseInt(req.getParameter("l_no"));
		lvo = ldao.viewLetter(l_no, whether);
		
		req.setAttribute("letter", lvo);
		
		forward.setPath("letterInfo.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
