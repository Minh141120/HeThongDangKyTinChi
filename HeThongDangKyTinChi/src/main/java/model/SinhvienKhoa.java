package model;

public class SinhvienKhoa {
	private int id;
	private Sinhvien sinhvien;
	private Khoa khoa;

	// Constructor
	public SinhvienKhoa() {
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Sinhvien getSinhvien() {
		return sinhvien;
	}

	public void setSinhvien(Sinhvien sinhvien) {
		this.sinhvien = sinhvien;
	}

	public Khoa getKhoa() {
		return khoa;
	}

	public void setKhoa(Khoa khoa) {
		this.khoa = khoa;
	}
}
