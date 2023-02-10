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

// import com.sun.corba.se.impl.javax.rmi.CORBA.Util;

import doshopa.Article;
import doshopa.Boutique;
import front.Page;
import system.Generalize;
import system.MapModel;
import util.DBConnect;

/**
 * Servlet implementation class BoutiqueServlet
 */
@WebServlet("/boutiques/*")
public class BoutiqueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoutiqueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			Boutique tempBoutique = new Boutique();
			int totalRowInPage = 6;
			tempBoutique.setCompleteTableName("boutique_libcomplet");
			tempBoutique.setId(request.getParameter("ref"));
			Boutique boutique = (Boutique)Generalize.getById(tempBoutique, c);
			Article tempArticle = new Article();
			String currentPage = util.Utility.stringWithoutNull(request.getParameter("current_page")); 
			if(currentPage.compareTo("")==0) {
				currentPage = "1";
			}
			String sql = "";
 			if (currentPage.compareTo("")==0) {
				sql += " LIMIT " + 5 + " OFFSET 0 ";
			} else {
				sql += " LIMIT " + totalRowInPage + " OFFSET "
						+ (Integer.parseInt(currentPage) - 1) * totalRowInPage;
			}
			tempArticle.setCompleteTableName("article_libcomplet_valider"); 
			String where =" AND boutique_id like '"
					+request.getParameter("ref")+ "' "+sql;
			Article[]arrayArticle = (Article[])Generalize.getListObjectWithWhere(tempArticle, where, c);	
			request.setAttribute("arrayArticle", arrayArticle);
			request.setAttribute("boutique", boutique);
			
			String paginationArticle = Page.getpagination(request,Generalize.getCountTable(tempArticle," AND boutique_id like '"
					+request.getParameter("ref")+ "' ", c),totalRowInPage);
			request.setAttribute("paginationArticle", paginationArticle);
			RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/boutique.jsp");
			view.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
