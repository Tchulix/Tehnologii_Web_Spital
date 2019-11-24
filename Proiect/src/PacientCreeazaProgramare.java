

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PacientCreeazaProgramare
 */
@WebServlet("/pacient_creeaza_programare")
public class PacientCreeazaProgramare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacientCreeazaProgramare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Pacient)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pacient_creeaza_programare.jsp");
		dispatcher.forward(request, response);return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Secretara)
		{response.sendRedirect(request.getContextPath() + "/secretara");return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Doctor)
		{response.sendRedirect(request.getContextPath() + "/doctor");return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Administrator)
		{response.sendRedirect(request.getContextPath() + "/admin");return;}
		response.sendRedirect(request.getContextPath()+"/");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			User loginedUser = AppUtils.getLoginedUser(request.getSession());
			long cnp = loginedUser.getCnp();
			Statement addProgramare = MySQLConnUtils.getMySQLConnection().createStatement();
	    	String queryIs = "INSERT INTO PROGRAMARE (pacient_cnp, doctor_id, data_programarii, cost) VALUES (" 
	        + cnp + ", '" + request.getParameter("doctorName") + "', '" + Integer.parseInt(request.getParameter("an")) + "-" + Integer.parseInt(request.getParameter("luna")) 
	    	+ "-" + Integer.parseInt(request.getParameter("zi")) + "', 0);";
	        addProgramare.executeUpdate(queryIs);
	        
	    	
	    	Statement getProgramareID = MySQLConnUtils.getMySQLConnection().createStatement();
	    	int progrID = 0;
	    	ResultSet progID = getProgramareID.executeQuery("SELECT id FROM PROGRAMARE WHERE pacient_cnp = "+
	    	request.getParameter("pacientName")+ " AND doctor_id = " + request.getParameter("doctorName") + " AND "
	    			+ "data_programarii = '" + Integer.parseInt(request.getParameter("an")) + "-" + Integer.parseInt(request.getParameter("luna")) 
	    	    	+ "-" + Integer.parseInt(request.getParameter("zi")) + "';");
	    	if (progID.next())
	        progrID = progID.getInt("id");
	    	
	    	Statement addConsult = MySQLConnUtils.getMySQLConnection().createStatement();
	    	String query2 = "INSERT INTO CONSULT (id, diagnostic, trimitere_catre, medicamente) VALUES (" + progrID + ",'','','');";
	    	addConsult.executeUpdate(query2);
	    
	        response.sendRedirect(request.getContextPath() + "/pacient");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
