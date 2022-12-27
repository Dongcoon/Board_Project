package kr.co.tj.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class BoardDeleteAction implements Action {

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

		BoardVO bvo = new BoardVO();
		BoardDAO bdao = new BoardDAO();
		bvo.setB_no(Integer.parseInt(req.getParameter("b_no")));
		bvo = bdao.selectOne(bvo);
		
		if (u_id != null && u_id.equals(bvo.getU_id())) {
			System.out.println("bvo.getB_no() : "+bvo.getB_no());
			
			if (bdao.delete(bvo)) {
				System.out.println("boardDeleteAction 로그 : 삭제성공");
			} else {
				System.out.println("boardDeleteAction 로그 : 삭제실패");
			}			
		} else {
			System.out.println("boardDeleteAction 로크 : 게시글의 작성자가 아님");
		}		
				
		forward.setPath("boardViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
