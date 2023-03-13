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
			request.getSession().setAttribute("messageType", "�����޽���");
			request.getSession().setAttribute("messageContent", "���̵�� ��й�ȣ�� �Է����ּ���.");
			response.sendRedirect("login.jsp");
			return;
		}
		int result = new MemberDAO().loginCheck(id, pass);
		if(result == 1) {
			request.getSession().setAttribute("messageType", "�����޽���");
			request.getSession().setAttribute("messageContent", "�α��ο� �����߽��ϴ�.");
			response.sendRedirect("main.jsp");
		}
		else if(result == 2) {
			request.getSession().setAttribute("messageType", "�����޽���");
			request.getSession().setAttribute("messageContent", "��й�ȣ�� �ٽ� Ȯ���ϼ���.");
			response.sendRedirect("login.jsp");
		}
		else if(result == 0) {
			request.getSession().setAttribute("messageType", "�����޽���");
			request.getSession().setAttribute("messageContent", "ȸ�� ���̵� �������� �ʽ��ϴ�.");
			response.sendRedirect("login.jsp");
		}
		else if(result == 0) {
			request.getSession().setAttribute("messageType", "�����޽���");
			request.getSession().setAttribute("messageContent", "�����ͺ��̽� ������ �߻��߽��ϴ�.");
			response.sendRedirect("login.jsp");
		}
	}

}
