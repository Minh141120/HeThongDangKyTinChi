package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Hoten;
import model.Khoa;
import model.Sinhvien;
import model.SinhvienKhoa;

public class SinhvienKhoaDAO extends DAO {
	public SinhvienKhoaDAO() {
		super();
// TODO Auto-generated constructor stub
	}

	/**
	 * lay danh sach cac khoa/nganh ma sinh vien dang hoc de chon dang ki hoc
	 * 
	 * @param idSV: id cua sinh vien
	 * @return danh sach cacs doi tuong SinhvienKhoa
	 */
	public ArrayList<SinhvienKhoa> getNganhcuaSV(int idSV) {
		ArrayList<SinhvienKhoa> kq = null;
		String sql = "{call nganhcuaSV(?)}";// su dung stored procedure
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idSV);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<SinhvienKhoa>();
				SinhvienKhoa svk = new SinhvienKhoa();
				svk.setId(rs.getInt("idsvk"));
// sinh vien
				Sinhvien sv = new Sinhvien();
				sv.setId(rs.getInt("id"));
				sv.setMasv(rs.getString("masv"));
//hoten
				Hoten ht = new Hoten();
				ht.setHodem(rs.getString("hodem"));
				ht.setTen(rs.getString("ten"));
				sv.setHoten(ht);
				svk.setSinhvien(sv);
//khoa
				Khoa k = new Khoa();
				k.setId(rs.getInt("idkhoa"));
				k.setTen(rs.getString("tenkhoa"));
				svk.setKhoa(k);
				kq.add(svk);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}
}