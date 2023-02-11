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

import doshopa.Boutique;
import doshopa.Promotion;
import front.Page;
import system.Categorie;
import system.Generalize;
import util.DBConnect;
import util.Utility;

/**
 * Servlet implementation class Galerie
 */
@WebServlet("/galerie")
public class GalerieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GalerieServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			int totalRowInPage = 6;
			String product_key = request.getParameter("product_key");
			String categorie_ref = request.getParameter("categorie_ref");
			// Catégorie de boutique
			Categorie categorie = new Categorie();
			categorie.setCompleteTableName("boutique_categorie_boutique");
			Categorie[] arrayCategorieBoutique = (Categorie[]) Generalize.getListObject(categorie, c);
			request.setAttribute("arrayCategorieBoutique", arrayCategorieBoutique);
			//
			//Boutique
			Boutique boutique = new Boutique();
			String currentPage = util.Utility.stringWithoutNull(request.getParameter("current_page")); 
			if(currentPage.compareTo("")==0) {
				currentPage = "1";
			}
			String where ="";
			if(Utility.stringWithoutNull(product_key).compareTo("")!=0) {
				where+= " AND denomination like'%"+product_key+"%'";
			}
			if(Utility.stringWithoutNull(categorie_ref).compareTo("")!=0) {
				where+= " AND categorie_id like'"+categorie_ref+"'";
			}
			String sql = "";
 			if (currentPage.compareTo("")==0) {
				sql += " LIMIT " + 5 + " OFFSET 0 ";
			} else {
				sql += " LIMIT " + totalRowInPage + " OFFSET "
						+ (Integer.parseInt(currentPage) - 1) * totalRowInPage;
			}
			boutique.setCompleteTableName("boutique_and_categorie");
			Boutique[] arrayBoutique = (Boutique[]) Generalize.getListObjectWithWhere(boutique,where+" "+sql, c);
			request.setAttribute("arrayBoutique", arrayBoutique);
			//pagination article
			String paginationArticle = Page.getpagination(request,Generalize.getCountTable(boutique,where, c),totalRowInPage);
			request.setAttribute("paginationArticle", paginationArticle);
			// display view
			RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/galerie.jsp");
			view.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (c != null) {
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
