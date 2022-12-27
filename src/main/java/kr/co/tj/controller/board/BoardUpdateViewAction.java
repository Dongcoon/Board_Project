package kr.co.tj.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class BoardUpdateViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		bvo.setB_no(Integer.parseInt(req.getParameter("b_no")));
		
		bvo = bdao.selectOne(bvo);
		if (bvo != null) {
			System.out.println("boardUpdateAction 로그 : 수정할 데이터 존재함");
			req.setAttribute("bData", bvo);
		} else {
			System.out.println("boardUpdateAction 로그 : 수정할 데이터가 없음");
		}
		
		forward.setPath("update.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
