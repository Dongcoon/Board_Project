package kr.co.tj.controller.letter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.LetterDAO;
import kr.co.tj.model.vo.LetterVO;

public class LetterWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		// 여기에 코드 작성
		// 해당 Action과 관련된 vo,dao 컨트롤 처리
		// view페이지로 전송할 데이터 설정 
		LetterVO lvo = new LetterVO();
		LetterDAO ldao = new LetterDAO();
		
		String l_title = req.getParameter("l_title");
		l_title = l_title.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String l_content = req.getParameter("l_content");
		l_content = l_content.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		String l_sender = req.getParameter("l_sender");
		String l_receiver = req.getParameter("l_receiver");
		
		lvo.setL_title(l_title);
		lvo.setL_content(l_content);
		lvo.setL_sender(l_sender);
		lvo.setL_receiver(l_receiver);
		
		if (ldao.insertLetter(lvo, "sent") == 1) {
			System.out.println("LetterWriteAction 로그 : sent write 성공");
		} else {
			System.out.println("LetterWriteAction 로그 : sent write 에러");
		}
		
		if (ldao.insertLetter(lvo, "received") == 1) {
			System.out.println("LetterWriteAction 로그 : received write 성공");
		} else {
			System.out.println("LetterWriteAction 로그 : received write 에러");
		}
		
		forward.setPath("letterSent.html"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
