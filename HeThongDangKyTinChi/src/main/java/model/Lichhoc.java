package model;

public class Lichhoc {
	private int id;
	private String ten;
	private Lophocphan lophocphan;
	private Giangvien giangvien;
	private Phonghoc phonghoc;
	private Tuanhoc tuanhoc;
	private Ngayhoc ngayhoc;
	private Kiphoc kiphoc;

	// Getter and Setter for id
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	// Getter and Setter for ten
	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	// Getter and Setter for lophocphan
	public Lophocphan getLophocphan() {
		return lophocphan;
	}

	public void setLophocphan(Lophocphan lophocphan) {
		this.lophocphan = lophocphan;
	}

	// Getter and Setter for giangvien
	public Giangvien getGiangvien() {
		return giangvien;
	}

	public void setGiangvien(Giangvien giangvien) {
		this.giangvien = giangvien;
	}

	// Getter and Setter for phonghoc
	public Phonghoc getPhonghoc() {
		return phonghoc;
	}

	public void setPhonghoc(Phonghoc phonghoc) {
		this.phonghoc = phonghoc;
	}

	// Getter and Setter for tuanhoc
	public Tuanhoc getTuanhoc() {
		return tuanhoc;
	}

	public void setTuanhoc(Tuanhoc tuanhoc) {
		this.tuanhoc = tuanhoc;
	}

	// Getter and Setter for ngayhoc
	public Ngayhoc getNgayhoc() {
		return ngayhoc;
	}

	public void setNgayhoc(Ngayhoc ngayhoc) {
		this.ngayhoc = ngayhoc;
	}

	// Getter and Setter for kiphoc
	public Kiphoc getKiphoc() {
		return kiphoc;
	}

	public void setKiphoc(Kiphoc kiphoc) {
		this.kiphoc = kiphoc;
	}
}
