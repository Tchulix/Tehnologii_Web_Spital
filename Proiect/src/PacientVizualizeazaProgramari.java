

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
 * Servlet implementation class PacientVizualizeazaProgramari
 */
@WebServlet("/pacient_vizualizare_programari")
public class PacientVizualizeazaProgramari extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	public static long getPacientCnp(HttpServletRequest request) {
		try {
			Statement getDoctorId = MySQLConnUtils.getMySQLConnection().createStatement();
			ResultSet rs = getDoctorId.executeQuery("SELECT cnp FROM USER WHERE user_name = '"+
					AppUtils.getLoginedUser(request.getSession()).getUserName() + "';");
			if (rs.next()) {
				return rs.getLong("cnp");}
			return 0;}
		catch (Exception e) {
			e.printStackTrace();return 0;
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacientVizualizeazaProgramari() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Pacient)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pacient_vizualizare_programari.jsp");
		request.setAttribute("pacient_cnp", getPacientCnp(request));
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
	}

}
