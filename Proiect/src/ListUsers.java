import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ListUsers {
	public List<String> getItems() {
		try {
		Statement searchForUser = MySQLConnUtils.getMySQLConnection().createStatement();
        List<String> list = new ArrayList<String>();
        ResultSet rs = searchForUser.executeQuery("SELECT name FROM user,pacient WHERE user.cnp = pacient.cnp");
        while (rs.next())
        	list.add(rs.getString("name"));
        return list;
		}catch(Exception e) {
			e.printStackTrace();
			return new ArrayList<String>();
		}
    }
}
