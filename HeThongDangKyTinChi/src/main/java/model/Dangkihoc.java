package model;

public class Dangkihoc {
	private int id;
	private Lophocphan lophocphan;
	private SinhvienKhoa sinhvienKhoa;

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Lophocphan getLophocphan() {
		return lophocphan;
	}

	public void setLophocphan(Lophocphan lophocphan) {
		this.lophocphan = lophocphan;
	}

	public SinhvienKhoa getSinhvienKhoa() {
		return sinhvienKhoa;
	}

	public void setSinhvienKhoa(SinhvienKhoa sinhvienKhoa) {
		this.sinhvienKhoa = sinhvienKhoa;
	}
}
