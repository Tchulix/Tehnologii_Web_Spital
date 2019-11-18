
public class Pacient extends User {
	private String asigurat;
	
	public Pacient() {
		
	}
	
	public Pacient(User user, String asigurat) {
		this.setCnp(user.getCnp());
		this.setEmail(user.getEmail());
		this.setGender(user.getGender());
		this.setName(user.getName());
		this.setPagesAvailable(user.getPagesAvailable());
		this.setPassword(user.getPassword());
		this.setUserName(user.getUserName());
		this.asigurat = asigurat;
	}
}
