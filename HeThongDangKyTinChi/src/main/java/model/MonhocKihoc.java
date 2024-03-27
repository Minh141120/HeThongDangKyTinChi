package model;

public class MonhocKihoc {
	private int id;
	private Monhoc monhoc;
	private Kihoc kihoc;

	// Constructor
	public MonhocKihoc() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Monhoc getMonhoc() {
		return monhoc;
	}

	public void setMonhoc(Monhoc monhoc) {
		this.monhoc = monhoc;
	}

	public Kihoc getKihoc() {
		return kihoc;
	}

	public void setKihoc(Kihoc kihoc) {
		this.kihoc = kihoc;
	}
}
