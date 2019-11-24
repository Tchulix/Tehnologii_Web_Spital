

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
 * Servlet implementation class AdminCreeazaDoctor
 */
@WebServlet("/admin_creeaza_doctor")
public class AdminCreeazaDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCreeazaDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Administrator)
		{RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/admin_creeaza_doctor.jsp");
		dispatcher.forward(request, response);return;}
		if (AppUtils.getLoginedUser(request.getSession()) instanceof Secretara)
		{response.sendRedirect(request.getContextPath() + "/secretara");return;}
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
		Statement searchForExistingUser = MySQLConnUtils.getMySQLConnection().createStatement();
        ResultSet rs = searchForExistingUser.executeQuery("SELECT * FROM user WHERE user_name = '"+request.getParameter("userName")+"' OR email = '"+request.getParameter("email")+"'");
        if (rs.next()) {
        	return;
        }
		Statement addUser = MySQLConnUtils.getMySQLConnection().createStatement();
        User temp;
        String gender;
    	if (request.getParameter("gender").equals("female")==true)
    		gender = "F";
    	else gender = "M";
    	String queryIs = "INSERT INTO USER (user_name, email, cnp, password, gender) VALUES (' " 
        + request.getParameter("userName") + "', '" + request.getParameter("name") + ", '" + request.getParameter("email") + "', " +
        		Long.parseLong(request.getParameter("cnp")) + ", '" + request.getParameter("password") +
        				"', '" + gender + "';";
        addUser.executeUpdate("INSERT INTO USER (user_name, name, email, cnp, password, gender) VALUES ('" 
        + request.getParameter("userName") + "', '"+ request.getParameter("name") +  "', '" + request.getParameter("email") + "', " +
        		Long.parseLong(request.getParameter("cnp")) + ", '" + request.getParameter("password") +
        				"', '" + gender + "');");
        List<String> empty = new ArrayList<String>();
    	temp = new User(request.getParameter("userName"), request.getParameter("name"), request.getParameter("email"), request.getParameter("password"),
    			gender, Long.parseLong(request.getParameter("cnp")), empty);
    	Statement addAngajat = MySQLConnUtils.getMySQLConnection().createStatement();
    	addAngajat.executeUpdate("INSERT INTO ANGAJAT (user_name, data_angajarii, pozitie, cabinet) VALUES ('" + request.getParameter("userName") + "', '" + 
    	Integer.parseInt(request.getParameter("an")) + "-" + Integer.parseInt(request.getParameter("luna")) 
    	+ "-" + Integer.parseInt(request.getParameter("zi")) + "', 'doctor', '" +
    			request.getParameter("cabinet") + "');");
    	Statement getAngajatID = MySQLConnUtils.getMySQLConnection().createStatement();
    	int angajatID = 0;
    	ResultSet angID = getAngajatID.executeQuery("SELECT id FROM ANGAJAT WHERE user_name = '"+
    	request.getParameter("userName")+ "'");
    	if (angID.next())
        angajatID = angID.getInt("id");
        Statement addDoctor = MySQLConnUtils.getMySQLConnection().createStatement();
        addDoctor.executeUpdate("INSERT INTO DOCTOR (id, specializare) VALUES (" 
        + angajatID + ", '" + request.getParameter("specialitate") + "');");
        response.sendRedirect(request.getContextPath() + "/admin");
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

}
