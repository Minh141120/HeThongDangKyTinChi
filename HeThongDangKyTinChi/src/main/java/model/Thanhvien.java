package model;

public class Thanhvien {
	private int id;
	private String username;
	private String password;
	private String vaitro;
	private Hoten hoten;

	// Constructor
	public Thanhvien() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getVaitro() {
		return vaitro;
	}

	public void setVaitro(String vaitro) {
		this.vaitro = vaitro;
	}

	public Hoten getHoten() {
		return hoten;
	}

	public void setHoten(Hoten hoten) {
		this.hoten = hoten;
	}
}
