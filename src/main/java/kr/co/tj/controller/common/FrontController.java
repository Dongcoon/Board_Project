package kr.co.tj.controller.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.tj.controller.board.BoardDeleteAction;
import kr.co.tj.controller.board.BoardSearchAction;
import kr.co.tj.controller.board.BoardUpdateAction;
import kr.co.tj.controller.board.BoardUpdateViewAction;
import kr.co.tj.controller.board.BoardViewAllAction;
import kr.co.tj.controller.board.BoardViewOneAction;
import kr.co.tj.controller.board.BoardWriteAction;
import kr.co.tj.controller.letter.LetterDeleteAction;
import kr.co.tj.controller.letter.LetterViewAllAction;
import kr.co.tj.controller.letter.LetterViewOneAction;
import kr.co.tj.controller.letter.LetterWriteAction;
import kr.co.tj.controller.user.LoginAction;
import kr.co.tj.controller.user.LogoutAction;
import kr.co.tj.controller.user.MypageAction;
import kr.co.tj.controller.user.UserDeleteAction;
import kr.co.tj.controller.user.UserIdChkAction;
import kr.co.tj.controller.user.UserIdSearchAction;
import kr.co.tj.controller.user.UserSignupAction;
import kr.co.tj.controller.user.UserUpdateAction;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = null;
		
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String command = uri.substring(cp.length());
//		System.out.println(uri);
//		System.out.println(cp);
//		System.out.println(command);
		
		if (command.equals("/boardViewAllAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
				forward = new BoardViewAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardWriteAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new BoardWriteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardUpdateAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new BoardUpdateAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/boardUpdateViewAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new BoardUpdateViewAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDeleteAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new BoardDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardViewOneAction.do")) {
			System.out.println("Frontcontroller ?????? : ??????????????? ??????");
			try {
				forward = new BoardViewOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardSearchAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ?????? ??????");
			try {
				forward = new BoardSearchAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/boardSubctgAction.do")) {
			System.out.println("Frontcontroller ?????? : ?????????????????? ??????");
			try {
//				forward = new BoardSubctgAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/letterWriteAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
				forward = new LetterWriteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/letterDeleteAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
				forward = new LetterDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/letterBatchDeleteAction.do")) {
			System.out.println("Frontcontroller ?????? : ?????? ???????????? ??????");
			try {
//				forward = new LetterBatchDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/letterViewAllAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????????????????? ??????");
			try {
				forward = new LetterViewAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/letterViewOneAction.do")) {
			System.out.println("Frontcontroller ?????? : ??????(??????)?????? ??????");
			try {
				forward = new LetterViewOneAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/replyWriteAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
//				forward = new ReplyWriteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/replyDeleteAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
//				forward = new ReplyDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/replyUpdateAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
//				forward = new ReplyUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/replyViewAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
//				forward = new ReplyViewAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/userSignupAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
				forward = new UserSignupAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/userUpdateAction.do")) {
			System.out.println("Frontcontroller ?????? : ?????????????????? ??????");
			try {
				forward = new UserUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/userDeleteAction.do")) {
			System.out.println("Frontcontroller ?????? : ???????????? ??????");
			try {
				forward = new UserDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/idCheckAction.do")) {
			System.out.println("Frontcontroller ?????? : ID check ??????");
			try {
				forward = new UserIdChkAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/idSearchAction.do")) {
			System.out.println("Frontcontroller ?????? : ID check ??????");
			try {
				forward = new UserIdSearchAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (command.equals("/loginAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new LoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/mypageAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new MypageAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/logoutAction.do")) {
			System.out.println("Frontcontroller ?????? : ????????? ??????");
			try {
				forward = new LogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("FrontController ?????? : "+command+" Action??? ???????????? ??????");
			//throw new Exception("FrontController ?????? : "+command+" Action??? ???????????? ??????");
		}
			
		/*
		else if (command.equals("/.do")) {
			System.out.println("Frontcontroller ?????? : ??????");
			try {
				forward = new Action().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		*/
			
		// ActionForward.isRedirect ????????? ???????????? ??????
		if (forward != null) {
			if (forward.isRedirect()) {
				// sendRedirect??? ???????????? ??????, ????????? Action??????????????? path????????? '/'??? ???????????? ???
				// (forward.setPath("/??????") -> forward.setPath("??????"))
				System.out.println("sendRedirect -> forward.getPath() : "+forward.getPath());
				response.sendRedirect(forward.getPath());				
			} else {
				System.out.println("forward -> forward.getPath() : "+forward.getPath());
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);				
			}				
		} else {
			System.out.println("FrontController ?????? : forward is null!");
			//throw new Exception("FrontController ?????? : forward is null");
		}			
			
		
	}

}
