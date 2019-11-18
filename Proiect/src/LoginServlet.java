import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public LoginServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
 
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 try {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        Statement searchForUser = MySQLConnUtils.getMySQLConnection().createStatement();
        boolean isCorrect = false;
        User temp = new User();
        ResultSet rs = searchForUser.executeQuery("SELECT * FROM user WHERE user_name = '"+userName+"' OR email = '"+userName+"'");
        	if (rs.next()) {
        String x = rs.getString("password");
        	if (rs.getString("password").equals(password))
        		{isCorrect = true;
        		List<String> empty = new ArrayList<String>();
        		temp = new User(rs.getString("user_name"),rs.getString("name"), rs.getString("password"),rs.getString("email"),rs.getString("gender"), rs.getLong("cnp"), empty);
        		}
        	}
        if (isCorrect == false) {
            String errorMessage = "Invalid userName or Password";
 
            request.setAttribute("errorMessage", errorMessage);
 
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp");
 
            dispatcher.forward(request, response);
            return;
        }
        User loginedUser = temp;
        AppUtils.storeLoginedUser(request.getSession(), loginedUser);
 
        // 
        int redirectId = -1;
        try {
            redirectId = Integer.parseInt(request.getParameter("redirectId"));
        } catch (Exception e) {
        }
        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            response.sendRedirect(requestUri);
        } else {
            // Default after successful login
            // redirect to /userInfo page
        	int employeeId;
        	Statement searchForRole = MySQLConnUtils.getMySQLConnection().createStatement();
            ResultSet rs2 = searchForRole.executeQuery("SELECT ID, POZITIE, CABINET FROM ANGAJAT WHERE USER_NAME = '"+loginedUser.getUserName() + "'");
        	if (rs2.next()) {
        		employeeId = rs2.getInt("id");
        		switch (rs2.getString("pozitie")){
        		case "administrator":
        			loginedUser = new Administrator(loginedUser);
        	        AppUtils.storeLoginedUser(request.getSession(), loginedUser);
        			response.sendRedirect(request.getContextPath() + "/admin"); break;
        		case "secretara":
        			loginedUser = new Secretara(loginedUser, rs2.getString("cabinet"));
        	        AppUtils.storeLoginedUser(request.getSession(), loginedUser);
        			response.sendRedirect(request.getContextPath() + "/secretara");
        			break;
        		case "doctor":
        			Statement getSpecializare = MySQLConnUtils.getMySQLConnection().createStatement();
        			ResultSet rs3 = getSpecializare.executeQuery("SELECT SPECIALIZARE FROM DOCTOR WHERE ID = "+
        			employeeId + ")");
        			loginedUser = new Doctor(loginedUser, rs3.getString("specializare"), rs2.getString("cabinet"));
        	        AppUtils.storeLoginedUser(request.getSession(), loginedUser);
        			response.sendRedirect(request.getContextPath() + "/doctor");
        			break;
        		default:
        			response.sendRedirect(request.getContextPath() + "/userInfo");
        		}
        	}
        	else {
        		Statement getAsigurat = MySQLConnUtils.getMySQLConnection().createStatement();
    			ResultSet rs3 = getAsigurat.executeQuery("SELECT ASIGURAT FROM PACIENT WHERE CNP = "+
    			rs.getLong("cnp"));
    			loginedUser = new Pacient(loginedUser, rs.getString("cnp"));
    	        AppUtils.storeLoginedUser(request.getSession(), loginedUser);
    			response.sendRedirect(request.getContextPath() + "/pacient");
        	}
        }
 }catch(Exception e) {
	 e.printStackTrace();
 }
 
    }
 
}