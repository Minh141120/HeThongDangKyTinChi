package model;

public class Giangvien {
	private int id;
	private Hoten hoten;

	public Giangvien() {
		hoten = new Hoten();
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Hoten getHoten() {
		return hoten;
	}

	public void setHoten(Hoten hoten) {
		this.hoten = hoten;
	}
}