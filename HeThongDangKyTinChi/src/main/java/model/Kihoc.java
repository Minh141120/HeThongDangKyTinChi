package model;

public class Kihoc {
	private int id;
	private Namhoc namhoc;
	private Hocki hocki;

	// Constructor
	public Kihoc() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Namhoc getNamhoc() {
		return namhoc;
	}

	public void setNamhoc(Namhoc namhoc) {
		this.namhoc = namhoc;
	}

	public Hocki getHocki() {
		return hocki;
	}

	public void setHocki(Hocki hocki) {
		this.hocki = hocki;
	}
}
