package kr.co.tj.controller.reply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.ReplyDAO;
import kr.co.tj.model.vo.ReplyVO;

public class ReplyViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		
		// 여기에 코드 작성
		// 해당 Action과 관련된 vo,dao 컨트롤 처리
		// view페이지로 전송할 데이터 설정 
		
		ReplyDAO rdao = new ReplyDAO();
		
		ArrayList<ReplyVO> ReplyList = rdao.viewReply(b_no);
		req.setAttribute("RList", ReplyList);

		
		forward.setPath("xxx.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
