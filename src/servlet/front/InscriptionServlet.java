package servlet.front;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import doshopa.Boutique;
import front.PageCreate;
import system.Categorie;
import system.Generalize;
import system.MapModel;
import system.Utilisateur;
import util.Constant;
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
		try {
			PageCreate pv = new PageCreate(new MapModel());
			pv.completeAllField(request);
			Utilisateur u = (Utilisateur)pv.getMapModel();
			u.setRole_id("public");
			
			String pwd = u.getMot_passe();
			u.controlInsert();
			u.setMot_passe(Utility.encrypt(u.getMot_passe(),null));
			u.insertIntoTable(null);
			u.setEtat(Constant.validatedState);
			u.updateIntoTable(null);
 			boolean val = u.treatLogin(u.getLogin(), pwd);
 			request.getSession().setAttribute("user", u);
  			if (val) {
				response.sendRedirect("/doshopa/accueil");
			}else {
				throw new Exception("Echec d\'authentification");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}