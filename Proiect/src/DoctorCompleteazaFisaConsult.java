

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
 * Servlet implementation class DoctorCompleteazaFisaConsult
 */
@WebServlet("/doctor_completeaza_fisa_consult")
public class DoctorCompleteazaFisaConsult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static int getDoctorId(HttpServletRequest request) {
		try {
			Statement getDoctorId = MySQLConnUtils.getMySQLConnection().createStatement();
			ResultSet rs = getDoctorId.executeQuery("SELECT id FROM ANGAJAT WHERE user_name = '"+
					AppUtils.getLoginedUser(request.getSession()).getUserName() + "';");
			if (rs.next()) {
				return rs.getInt("id");}
			return 0;}
		catch (Exception e) {
			e.printStackTrace();return 0;
		}
	}
	
	public static int getProgramareId(HttpServletRequest request) {
		try {
			Statement getProgramareId = MySQLConnUtils.getMySQLConnection().createStatement();
			ResultSet rs = getProgramareId.executeQuery("SELECT id FROM PROGRAMARE WHERE doctor_id = '"+
					getDoctorId(request) + "' AND data_programarii = DATE(CURDATE());");
			if (rs.next()) {
				return rs.getInt("id");}
			return 0;}
		catch (Exception e) {
			e.printStackTrace();return 0;
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorCompleteazaFisaConsult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				if (AppUtils.getLoginedUser(request.getSession()) instanceof Doctor)
				{
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/doctor_completeaza_fisa_consult.jsp");
					request.setAttribute("doctor_id", getDoctorId(request));
					request.setAttribute("programare_id", request.getParameter("progId"));
					dispatcher.forward(request, response);return;}
				if (AppUtils.getLoginedUser(request.getSession()) instanceof Secretara)
				{response.sendRedirect(request.getContextPath() + "/secretara");return;}
				if (AppUtils.getLoginedUser(request.getSession()) instanceof Administrator)
				{response.sendRedirect(request.getContextPath() + "/admin");return;}
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
		request.setAttribute("doctor_id", getDoctorId(request));
		try {
		updateProgramare = MySQLConnUtils.getMySQLConnection().createStatement();
		String cost = request.getParameter("cost");
    	String queryIs = "UPDATE PROGRAMARE SET cost=" + request.getParameter("cost") + " WHERE ID = " + request.getParameter("progId");
    	updateProgramare.executeUpdate(queryIs);
    	Statement updateConsult;
    	updateConsult = MySQLConnUtils.getMySQLConnection().createStatement();
    	String query2 = "UPDATE CONSULT SET diagnostic='" + request.getParameter("diagnostic") + "', trimitere_catre='" + request.getParameter("trimitere") + "', medicamente='" + request.getParameter("medicamente") + "' WHERE ID = " + request.getParameter("progId");
    	updateConsult.executeUpdate(query2);
    	response.sendRedirect(request.getContextPath()+"/doctor_vizualizeaza_programari");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
	}

}
