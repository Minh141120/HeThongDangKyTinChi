package model;

import java.util.ArrayList;
import java.util.List;

public class Lophocphan {
	private int id;
	private String ten;
	private int sisotoida;
	private int sisothucte;
	private MonhocKihoc monhocKihoc;
	private List<Lichhoc> dsLichhoc;

	// Constructor
	public Lophocphan() {
		this.dsLichhoc = new ArrayList<>();
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public int getSisotoida() {
		return sisotoida;
	}

	public void setSisotoida(int sisotoida) {
		this.sisotoida = sisotoida;
	}

	public int getSisothucte() {
		return sisothucte;
	}

	public void setSisothucte(int sisothucte) {
		this.sisothucte = sisothucte;
	}

	public MonhocKihoc getMonhocKihoc() {
		return monhocKihoc;
	}

	public void setMonhocKihoc(MonhocKihoc monhocKihoc) {
		this.monhocKihoc = monhocKihoc;
	}

	public List<Lichhoc> getDsLichhoc() {
		return dsLichhoc;
	}

	public void setDsLichhoc(List<Lichhoc> dsLichhoc) {
		this.dsLichhoc = dsLichhoc;
	}

	// Method to add a single lichhoc to the list
	public void addLichhoc(Lichhoc lichhoc) {
		this.dsLichhoc.add(lichhoc);
	}
}
