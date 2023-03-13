package memberone;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		if(id == null || id.equals("") || pass == null || pass.equals("")) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "아이디와 비밀번호를 입력하주세요.");
			response.sendRedirect("login.jsp");
			return;
		}
		int result = new MemberDAO().loginCheck(id, pass);
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공메시지");
			request.getSession().setAttribute("messageContent", "로그인에 성공했습니다.");
			response.sendRedirect("main.jsp");
		}
		else if(result == 2) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "비밀번호를 다시 확인하세요.");
			response.sendRedirect("login.jsp");
		}
		else if(result == 0) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "회원 아이디가 존재하지 않습니다.");
			response.sendRedirect("login.jsp");
		}
		else if(result == 0) {
			request.getSession().setAttribute("messageType", "오류메시지");
			request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
			response.sendRedirect("login.jsp");
		}
	}

}
