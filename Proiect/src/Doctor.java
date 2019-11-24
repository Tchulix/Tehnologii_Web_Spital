
public class Doctor extends User{
	private String specializare;
	private String cabinet;
	public Doctor() {
		
	}
	
	public Doctor(User user, String specializare, String cabinet) {
		this.setCnp(user.getCnp());
		this.setEmail(user.getEmail());
		this.setGender(user.getGender());
		this.setName(user.getName());
		this.setPagesAvailable(user.getPagesAvailable());
		this.setPassword(user.getPassword());
		this.setUserName(user.getUserName());
		this.specializare = specializare;
		this.cabinet = cabinet;
		// TODO Auto-generated constructor stub
	}

	public String getCabinet() {
		return cabinet;
	}

	public void setCabinet(String cabinet) {
		this.cabinet = cabinet;
	}

	public String getSpecializare() {
		return specializare;
	}

	public void setSpecializare(String specializare) {
		this.specializare = specializare;
	}

}
