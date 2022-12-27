package kr.co.tj.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;
import kr.co.tj.model.vo.MemberVO;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		String u_id = null;
		String u_nickname = null;
		HttpSession session = req.getSession(false);
		if(session.getAttribute("u_id") != null){
			u_id = (String) session.getAttribute("u_id");
			u_nickname = (String) session.getAttribute("u_nickname");
		}
		
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();
		
		String b_title = req.getParameter("b_title");
		b_title = b_title.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll("\'", "'");
		String b_content = req.getParameter("b_content");
		b_content = b_content.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll("\'", "'");
		String category = req.getParameter("category");
		String sub_category = req.getParameter("sub_category");
		
		bvo.setB_title(b_title);
		bvo.setB_content(b_content);
		bvo.setB_writer(u_nickname);
		bvo.setCategory(category);
		bvo.setSub_category(sub_category);
		bvo.setU_id(u_id);		
		//System.out.println(bvo);
		System.out.println(category);
		System.out.println(sub_category);
		if (bdao.insert(bvo)) {
			forward.setPath("boardViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
			forward.setRedirect(true); // redirect방식:true, forward방식:false
										// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		} else {
			System.out.println("boardWriteAction 로그 : write 에러");
			//throw new Exception("boardWriteAction 로그 : write 에러");
		}
				
		forward.setPath("boardViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true);  // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
