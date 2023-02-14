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

import doshopa.Article;
import doshopa.BoutiqueCommande;
import front.Page;
import system.Generalize;
import system.Utilisateur;
import util.DBConnect;

/**
 * Servlet implementation class PanierServlet
 */
@WebServlet("/panier")
public class PanierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PanierServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			Utilisateur u = (Utilisateur) request.getSession().getAttribute("user");
			if(u==null) {
				response.sendRedirect("/login");
			}else {
				String idCommande = u.getIdCommandeMere(c);
				request.setAttribute("idCommande", idCommande);
				//Commande
				int totalRowInPage = 5;
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
	 			BoutiqueCommande boutiqueCommande = new BoutiqueCommande();
	 			boutiqueCommande.setCompleteTableName("commandeliste"); 
				String where =" AND utilisateur_id like '"
						+u.getId()+ "' order by date_fille desc "+sql;
				BoutiqueCommande[]arrayCommande = (BoutiqueCommande[])Generalize.getListObjectWithWhere(boutiqueCommande, where, c);	
				request.setAttribute("arrayCommande", arrayCommande);
				//pagination article
				String paginationArticle = Page.getpagination(request,Generalize.getCountTable(boutiqueCommande," AND utilisateur_id like '"
						+u.getId()+ "' ", c),totalRowInPage);
				request.setAttribute("paginationCommande", paginationArticle);
				RequestDispatcher view = request.getRequestDispatcher("doshopa/pages/panier.jsp");
				view.forward(request, response);
			}
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
		
	}

}
