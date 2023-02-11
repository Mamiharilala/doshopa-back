package servlet.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doshopa.Blog;
import doshopa.Boutique;
import system.Generalize;

/**
 * Servlet implementation class Blog
 */
@WebServlet("/blog")
public class BlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Blog tempBlog = new Blog();
			tempBlog.setCompleteTableName("boutique_blog_valider");
			tempBlog.setId(request.getParameter("ref"));
 			Blog blog = (Blog)Generalize.getById(tempBlog, null);
			request.setAttribute("blog", blog);
			//boutique
			Boutique tempBoutique = new Boutique();
 			tempBoutique.setCompleteTableName("boutique_libcomplet");
			tempBoutique.setId(blog.getBoutique_id());
			Boutique boutique = (Boutique)Generalize.getById(tempBoutique, null);
			request.setAttribute("boutique", boutique);
			//display view
			RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/blog.jsp");
			view.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
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
