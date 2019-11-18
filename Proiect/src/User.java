import java.util.List;

public class User {
	private String userName;
	private String email;
	private String password;
	private String gender;
	private String name;
	private long cnp;
	private List<String> pagesAvailable;
	
	public User(){
		
	}

	public List<String> getPagesAvailable() {
		return pagesAvailable;
	}

	public void setPagesAvailable(List<String> pagesAvailable) {
		this.pagesAvailable = pagesAvailable;
	}

	public User(String userName, String name, String email, String password, String gender, long cnp, List<String> pagesAvailable) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.cnp = cnp;
		this.name = name;
		this.pagesAvailable = pagesAvailable;
	}

	public String getUserName() {
		return userName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getCnp() {
		return cnp;
	}

	public void setCnp(long cnp) {
		this.cnp = cnp;
	}
	
	
}
