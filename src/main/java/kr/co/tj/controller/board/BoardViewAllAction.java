package kr.co.tj.controller.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.common.Action;
import kr.co.tj.controller.common.ActionForward;
import kr.co.tj.model.dao.BoardDAO;
import kr.co.tj.model.vo.BoardVO;

public class BoardViewAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		ActionForward forward = new ActionForward();
				
		BoardDAO bdao = new BoardDAO();
		BoardVO bvo = new BoardVO();

		String category = req.getParameter("category");
		String sub_category = req.getParameter("sub_category");
//		System.out.println("category="+category);
//		System.out.println("sub_category="+sub_category);
		if (category == null) {
			category = "";
		}
		if (sub_category == null) {
			sub_category = "";
		}
		bvo.setCategory(category);
		bvo.setSub_category(sub_category);
		
		// 페이지 처리 시작
		int pageNum = 0;
		if (req.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		} else {
			pageNum = 1;
		}
		
		int totalRows    = 0;  // 전체행의 수
		int totalPage    = 0;  // 전체 페이지 수
		int rowsPerPage  = 20; // 페이지당 출력행 수
		int figPrintPage = 10; // 출력할 페이지 수 
		int startPage    = 1;  // 출력페이지 시작번호
		int[] printPage  = new int[figPrintPage]; // 출력페이지

		totalRows = bdao.countData(bvo);		 
		totalPage = (int)(totalRows/rowsPerPage) + 1;
		
		for (int i=0; i<figPrintPage; i++) {
			printPage[i] = -1;
		}
		startPage = ((int)(pageNum-1)/figPrintPage)*figPrintPage+1;
		for (int i=0; i<figPrintPage; i++) {
			printPage[i] = startPage+i;
			if ((startPage-1)*rowsPerPage + i*rowsPerPage  > totalRows) {
				printPage[i] = -1;
				break;
			}
		}
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("printPage", printPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("category", category);
		req.setAttribute("sub_category", sub_category);
		// 페이지 처리 끝
		
		// 보드 리스트 처리
		ArrayList<BoardVO> boardList = bdao.selectAll(bvo,pageNum,rowsPerPage);
//		System.out.println("리스트별 행수 : "+boardList.size());
		req.setAttribute("bList", boardList);
		
		forward.setPath("main.jsp"); // 이동할 페이지(앞에 / 붙이면 안됨!)
		forward.setRedirect(false);  // redirect방식:true, forward방식:false
									 // insert/delete/update등의 동작 이후에는 true로 설정하여 redirect로 이동처리
		
		return forward;
	}

}
