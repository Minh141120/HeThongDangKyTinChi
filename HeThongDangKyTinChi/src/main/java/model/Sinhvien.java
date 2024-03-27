package model;

public class Sinhvien {
	private int id;
	private String masv;
	private Hoten hoten;

	// Constructor
	public Sinhvien() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMasv() {
		return masv;
	}

	public void setMasv(String masv) {
		this.masv = masv;
	}

	public Hoten getHoten() {
		return hoten;
	}

	public void setHoten(Hoten hoten) {
		this.hoten = hoten;
	}
}
