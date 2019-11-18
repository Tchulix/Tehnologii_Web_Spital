

import java.io.IOException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SecretaraModificaProgramare
 */
@WebServlet("/secretara_modifica_programare")
public class SecretaraModificaProgramare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecretaraModificaProgramare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Secretara)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/secretara_modifica_programare.jsp");
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
		try {
		if (request.getParameter("Sterge")!=null)
		{
			Statement deleteConsult = MySQLConnUtils.getMySQLConnection().createStatement();
			deleteConsult.executeUpdate("DELETE FROM CONSULT WHERE ID = " + request.getParameter("programareName"));
			Statement deleteProgramare = MySQLConnUtils.getMySQLConnection().createStatement();
			String programareName = request.getParameter("programareName");
			deleteProgramare.executeUpdate("DELETE FROM PROGRAMARE WHERE ID = " + request.getParameter("programareName"));
			return;
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
