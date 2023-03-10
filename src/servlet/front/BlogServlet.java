package servlet.front;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doshopa.Blog;
import doshopa.Boutique;
import front.Page;
import system.Categorie;
import system.Generalize;
import system.Utilisateur;
import util.DBConnect;
import util.Utility;

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
		Connection c = null;
		try {
			Blog tempBlog = new Blog();
			tempBlog.setCompleteTableName("boutique_blog_valider");
			tempBlog.setId(request.getParameter("ref"));	
			c = new DBConnect().getConnection();
			if(Utility.stringWithoutNull(tempBlog.getId()).compareTo("")!=0) {
				Blog blog = (Blog)Generalize.getById(tempBlog, c);
				Utilisateur u = (Utilisateur) request.getSession().getAttribute("user");
				if(u!=null) {
					blog.incrementView(u.getId());
				}
				request.setAttribute("blog", blog);
				//boutique
				Boutique tempBoutique = new Boutique();
	 			tempBoutique.setCompleteTableName("boutique_libcomplet");
				tempBoutique.setId(blog.getBoutique_id());
				Boutique boutique = (Boutique)Generalize.getById(tempBoutique, c);
				request.setAttribute("boutique", boutique);
				//display view
				RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/blog.jsp");
				view.forward(request, response);
			}else {
				int totalRowInPage = 6;
 				String currentPage = util.Utility.stringWithoutNull(request.getParameter("current_page")); 
				if(currentPage.compareTo("")==0) {
					currentPage = "1";
				}
				String where ="";
				String sql = "";
	 			if (currentPage.compareTo("")==0) {
					sql += " LIMIT " + 5 + " OFFSET 0 ";
				} else {
					sql += " LIMIT " + totalRowInPage + " OFFSET "
							+ (Integer.parseInt(currentPage) - 1) * totalRowInPage;
				}
 				Blog[] arrayBlog = (Blog[]) Generalize.getListObjectWithWhere(tempBlog,where+" "+sql, c);
				request.setAttribute("arrayBlog", arrayBlog);
				//pagination article
				String paginationBlog = Page.getpagination(request,Generalize.getCountTable(tempBlog,where, c),totalRowInPage);
				request.setAttribute("paginationBlog", paginationBlog);
				RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/blog_list.jsp");
				view.forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(c!=null) {
				try {
					c.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
