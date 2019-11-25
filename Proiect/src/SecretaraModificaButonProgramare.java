

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecretaraModificaButonProgramare
 */
@WebServlet("/secretara_modifica_buton_programare")
public class SecretaraModificaButonProgramare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecretaraModificaButonProgramare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Secretara)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/secretara_modifica_buton_programare.jsp");
		dispatcher.forward(request, response);return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Administrator)
		{response.sendRedirect(request.getContextPath() + "/admin");return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Doctor)
		{response.sendRedirect(request.getContextPath() + "/doctor");return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Pacient)
		{response.sendRedirect(request.getContextPath() + "/pacient");return;}
		response.sendRedirect(request.getContextPath()+"/");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Statement updateProgramare;
		try {
		updateProgramare = MySQLConnUtils.getMySQLConnection().createStatement();
    	String queryIs = "UPDATE PROGRAMARE SET doctor_id=" + request.getParameter("doctorName") + ", data_programarii='" 
        + Integer.parseInt(request.getParameter("an")) + "-" + Integer.parseInt(request.getParameter("luna")) 
    	+ "-" + Integer.parseInt(request.getParameter("zi")) + "' WHERE pacient_cnp='"+request.getParameter("pacientName")+"';";
    	updateProgramare.executeUpdate(queryIs);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
        response.sendRedirect(request.getContextPath() + "/pacient");
	}

}
