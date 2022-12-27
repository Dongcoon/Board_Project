package kr.co.tj.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class BoardViewOneAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
				
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();  
		
		bvo.setB_no(Integer.parseInt(req.getParameter("b_no")));
		bvo = bdao.selectOne(bvo); // 게시글 조회
		bvo.setB_readcount(bvo.getB_readcount()+1);
		if (bdao.update(bvo)) {
			System.out.println("boardViewOneAction 로그 : 조회수 수정 성공");
		} else {
			System.out.println("boardViewOneAction 로그 : 조회수 수정 실패");
		}
		
		req.setAttribute("bData", bvo);
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		req.setAttribute("pageNum", pageNum);
		
		forward.setPath("board_view.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
