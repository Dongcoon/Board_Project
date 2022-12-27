package kr.co.tj.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		bvo.setB_no(Integer.parseInt(req.getParameter("b_no")));
		bvo.setB_title((String)req.getParameter("b_title"));
		bvo.setB_content((String)req.getParameter("b_content"));
		bvo.setCategory((String)req.getParameter("category"));
		bvo.setSub_category((String)req.getParameter("sub_category"));
		bvo.setB_readcount(Integer.parseInt(req.getParameter("b_readcount")));
//		System.out.println("boardUpdateAction 전달 vo : "+bvo);
		
		if (bdao.update(bvo)) {
			System.out.println("boardUpdateAction 로그 : 수정성공");
		} else {
			System.out.println("boardUpdateAction 로그 : 수정실패");
		}
		
		
		forward.setPath("boardViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
