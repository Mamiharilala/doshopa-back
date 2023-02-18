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
import doshopa.Token;
import front.PageCreate;
import system.Categorie;
import system.Generalize;
import system.MapModel;
import system.Utilisateur;
import util.Constant;
import util.DBConnect;
import util.Mail;
import util.Utility;

/**
 * Servlet implementation class InscriptionServlet
 */
@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Categorie cat = new Categorie();
			cat.setCompleteTableName("sexe");
			Categorie[] sexe= (Categorie[])Generalize.getListObject(cat, null);
			request.setAttribute("sexe", sexe);
			RequestDispatcher view=request.getRequestDispatcher("doshopa/pages/inscription.jsp");
			view.forward(request,response);
		}catch(Exception e) {
			
		}
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection c = null;
		String uri = request.getScheme() + "://" +   // "http" + "://
		             request.getServerName()+"/confirmationmail?ref=";
		Utilisateur u = null;
		try {
			c = new DBConnect().getConnection();
			PageCreate pv = new PageCreate(new MapModel());
			pv.completeAllField(request);
			u = (Utilisateur)pv.getMapModel();
			u.setRole_id(Constant.publicID);		
			String pwd = u.getMot_passe();
			u.setEtat(Constant.validatedState);
			u.insertIntoTable(c);
  			boolean val = u.treatLogin(u.getLogin(), pwd);
 			request.getSession().setAttribute("user", u);
  			if (val) {
  				Token token = new Token();
  				token.setToken(Utility.encrypt(String.valueOf(new java.util.Date().getTime()),c));
  				token.setUtilisateur_id(u.getId());
  				token.setLast_update(Utility.currentSQLDate());
  				token.insertIntoTable(c);
  				uri = uri+token.getToken();
  				Mail.sentMailSubscribe(u.getMail(),u.getNom()+" "+u.getPrenom(), uri, "+261 38 05 878 43");
  				response.sendRedirect(request.getContextPath()+"/accueil");				
			}else {
				throw new Exception("Echec d\'authentification");
			}
        	
		} catch (Exception e) {	 
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

}
