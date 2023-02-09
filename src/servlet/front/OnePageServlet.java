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
import system.Categorie;
import system.Generalize;
import util.DBConnect;

/**
 * Servlet implementation class OnePageServlet
 */
@WebServlet("/accueil")
public class OnePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OnePageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Connection c = null;
		try {
 			c = new DBConnect().getConnection();
			Categorie cat = new Categorie();
			cat.setCompleteTableName("article_categorie");
			Categorie[] articleCategorie = (Categorie[]) Generalize.getListObject(cat, c);
 			// boutique catgeorie boutique
			cat.setCompleteTableName("boutique_categorie_boutique");
			Categorie[] boutique_categorie_boutique = (Categorie[]) Generalize.getListObject(cat, c);
			// 4 first Boutique
			Boutique boutique = new Boutique();
			boutique.setCompleteTableName("boutique_and_categorie_4first");
			Boutique[] arrayBoutique = (Boutique[]) Generalize.getListObject(boutique, c);
			String image = "";
			// 4 first Boutique
			Blog blog = new Blog();
			blog.setCompleteTableName("boutique_blog_4first");
			Blog[] arrayBlog = (Blog[]) Generalize.getListObject(blog, c);
			request.setAttribute("arrayBlog", arrayBlog);
			request.setAttribute("arrayBoutique", arrayBoutique);
			request.setAttribute("articleCategorie", articleCategorie);
			request.setAttribute("boutique_categorie_boutique", boutique_categorie_boutique);
			RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/one_page.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(c!=null) {
				try {
					c.close();
				} catch (SQLException e) {
 					e.printStackTrace();
				} 
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
