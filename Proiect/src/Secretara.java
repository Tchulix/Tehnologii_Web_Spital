
public class Secretara extends User {
	private String cabinet;
	public String getCabinet() {
		return cabinet;
	}

	public void setCabinet(String cabinet) {
		this.cabinet = cabinet;
	}

	public Secretara() {
		
	}
	
	public Secretara(User user, String cabinet) {
		this.setCnp(user.getCnp());
		this.setEmail(user.getEmail());
		this.setGender(user.getGender());
		this.setName(user.getName());
		this.setPagesAvailable(user.getPagesAvailable());
		this.setPassword(user.getPassword());
		this.setUserName(user.getUserName());
		this.cabinet = cabinet;
		// TODO Auto-generated constructor stub
	}
}
