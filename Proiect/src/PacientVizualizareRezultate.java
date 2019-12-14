

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PacientVizualizareRezultate
 */
@WebServlet("/pacient_vizualizare_rezultate")
public class PacientVizualizareRezultate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PacientVizualizareRezultate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Pacient)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/pacient_vizualizare_rezultate.jsp");
		request.setAttribute("programare_id", request.getParameter("progId"));
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
