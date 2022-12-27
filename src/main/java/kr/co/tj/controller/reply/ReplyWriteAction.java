package kr.co.tj.controller.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.ReplyDAO;
import kr.co.tj.model.vo.ReplyVO;

public class ReplyWriteAction implements Action {

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
		// 임시코드
		u_id = "write0";
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		
		// 여기에 코드 작성
		// 해당 Action과 관련된 vo,dao 컨트롤 처리
		// view페이지로 전송할 데이터 설정 
		ReplyVO rvo = new ReplyVO();
		ReplyDAO rdao = new ReplyDAO();
		
		String r_content = req.getParameter("r_content");
		r_content = r_content.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		
		
		rvo.setR_content(r_content);
		rvo.setR_writer(u_id);
		
		if (rdao.writeReply(rvo, b_no)) {
			forward.setPath("main.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
			forward.setRedirect(true); // redirect방식:true, forward방식:false
										// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		} else {
			System.out.println("ReplyWriteAction 로그 : write 에러");
			//throw new Exception("boardWriteAction 로그 : write 에러");
		}
		
		forward.setPath("xxx.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
