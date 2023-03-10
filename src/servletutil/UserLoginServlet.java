package servletutil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/user/*")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = "";
		action += request.getParameter("action");
		HttpSession session = request.getSession();
		if (action.compareTo("logout") == 0) {
			session.removeAttribute("user");
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/oadmin/index");
		}else {
			request.getRequestDispatcher(request.getContextPath() + "/auth/login.jsp").forward(request, response);
		}
	}

}
