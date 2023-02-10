package servletutil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import system.Utilisateur;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			Utilisateur u = (Utilisateur) session.getAttribute("user");
			if (u != null && u.getRole_id().trim().compareTo("admin") == 0) {
				request.getRequestDispatcher(request.getContextPath() + "/container.jsp?content=boutique/dashboard_global_read.jsp").forward(request, response);
			} else if (u != null && u.getRole_id().trim().compareTo("boutique") == 0) {
				request.getRequestDispatcher(request.getContextPath() + "/container.jsp?content=boutique/boutique_dashboard.jsp").forward(request, response);
			}
		}else{
			response.sendRedirect(request.getContextPath() + "/user?action=login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
