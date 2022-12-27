package kr.co.tj.controller.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.MemberDAO;
import kr.co.tj.model.vo.MemberVO;

public class UserIdChkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
		
		String u_id = req.getParameter("u_id");
		System.out.println("들어온 id : " + u_id);

		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();
		vo.setU_id(u_id);

		int flag = dao.m_checkId(u_id);

		System.out.println(flag);
		if (flag == 0) {
			System.out.println("중복");
		} else {
			System.out.println("가능");
		}
		PrintWriter out = res.getWriter();
//			req.setAttribute("flag", "false");
		out.write(flag + ""); // 문자열로 던지기 위해서 +""
				
//		forward.setPath("xxx.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
//		forward.setRedirect(false); // redirect방식:true, forward방식:false
									// insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
