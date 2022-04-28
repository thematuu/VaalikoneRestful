package data;

public class User {
	private int id;
	private String username;
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(String id, String username) {
		// TODO Auto-generated constructor stub
		setId(id);
		this.username=username;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setId(String id) {
		try {
			this.id = Integer.parseInt(id);
		}
		catch(NumberFormatException | NullPointerException e) {
			//Do nothing - the value of id won't be changed
		}
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
}
