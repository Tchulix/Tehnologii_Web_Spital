import java.util.List;

public class Administrator extends User{
	public Administrator() {
		
	}

	public Administrator(User user) {
		this.setCnp(user.getCnp());
		this.setEmail(user.getEmail());
		this.setGender(user.getGender());
		this.setName(user.getName());
		this.setPagesAvailable(user.getPagesAvailable());
		this.setPassword(user.getPassword());
		this.setUserName(user.getUserName());
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
