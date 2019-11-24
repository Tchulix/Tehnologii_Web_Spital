

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SIgnUpServlet
 */
@WebServlet("/signup")
public class SIgnUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SIgnUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher //
        = this.getServletContext().getRequestDispatcher("/WEB-INF/signup.jsp");

dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String userName = request.getParameter("userName");
	        String password = request.getParameter("password");
	        String email = request.getParameter("email");
	        Statement searchForExistingUser = MySQLConnUtils.getMySQLConnection().createStatement();
	        ResultSet rs = searchForExistingUser.executeQuery("SELECT * FROM user WHERE user_name = '"+userName+"' OR email = '"+email+"'");
	        if (rs.next()) {
	        	return;
	        }
	        if (isValidEmailAddress(email)==false)
	        	return;
        	Statement addNewUser = MySQLConnUtils.getMySQLConnection().createStatement();
        	String gender;
        	if (request.getParameter("gender").equals("female")==true)
        		gender = "F";
        	else gender = "M";
        	addNewUser.executeUpdate("INSERT INTO USER (user_name, email, cnp, "
        			+ "password, gender, name) VALUES ('" + userName + "', '" + email + "', " + 
        			request.getParameter("cnp") +", '" + password + "', '" + 
        			gender + "', '" + request.getParameter("name") + "')");
        	String asigurat;
        	if (request.getParameter("asigurat") == null)
        		asigurat = "Nu";
        	else if (request.getParameter("asigurat") == "Nu")
        		asigurat = "Nu";
        	else asigurat = "Da";
        	addNewUser.executeUpdate("INSERT INTO PACIENT (cnp, asigurat) VALUES (" + 
        			request.getParameter("cnp") + ", '" + asigurat + "')");
        	List<String> empty = new ArrayList<String>();
        	User loginedUser = new User(userName, request.getParameter("name"), email, password,
        			gender, Long.parseLong(request.getParameter("cnp")), empty);
        	Pacient pac = new Pacient(loginedUser, asigurat);
        	AppUtils.storeLoginedUser(request.getSession(), pac);
        	response.sendRedirect(request.getContextPath() + "/pacient");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public boolean isValidEmailAddress(String email) {
	    return true;
	}
}
