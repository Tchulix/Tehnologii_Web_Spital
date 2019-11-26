

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
 * Servlet implementation class DoctorVizualizeazaProgramari
 */
@WebServlet("/doctor_vizualizeaza_programari")
public class DoctorVizualizeazaProgramari extends HttpServlet {
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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorVizualizeazaProgramari() {
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
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/doctor_vizualizeaza_programari.jsp");
			request.setAttribute("doctor_id", getDoctorId(request));
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
		doGet(request, response);
	}

}
