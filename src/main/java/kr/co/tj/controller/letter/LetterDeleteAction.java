package kr.co.tj.controller.letter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.LetterDAO;
import kr.co.tj.model.vo.LetterVO;

public class LetterDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		// 여기에 코드 작성
		// 해당 Action과 관련된 vo,dao 컨트롤 처리
		// view페이지로 전송할 데이터 설정 
		LetterDAO ldao = new LetterDAO();
		
		String[] l_noList = req.getParameterValues("letter_no_arr");
		System.out.println(l_noList.length);
		String whether = req.getParameter("whether");
		System.out.println(whether);
		
		if(l_noList.length==0) {
			System.out.println("LetterDeleteAction 로그 : 1개 삭제하기");
			int l_no = Integer.parseInt(req.getParameter("l_no"));
			if (ldao.deleteLetter(l_no, whether)) {
				forward.setPath("letterViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
				forward.setRedirect(false); // redirect방식:true, forward방식:false
											// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
			} else {
				System.out.println("LetterDeleteAction 로그 : delete 에러");
			}
		}else {
				System.out.println("LetterDeleteAction 로그 : 2개이상 삭제하기");
				if (ldao.deleteManyLetter(l_noList, whether)) {
					forward.setPath("letterViewAllAction.do"); // 이동할 페이지(앞에 / 붙이면 안됨!)
					forward.setRedirect(false); // redirect방식:true, forward방식:false
												// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
				} else {
					System.out.println("LetterDeleteAction 로그 : delete 에러");
				}
			
		}
		
		
		forward.setPath("letterViewAllAction.do?whether="+whether); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(true); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
