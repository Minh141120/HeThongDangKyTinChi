package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Giangvien;
import model.Hoten;
import model.Kiphoc;
import model.Lichhoc;
import model.Lophocphan;
import model.Ngayhoc;
import model.Phonghoc;
import model.Tuanhoc;

public class LichhocDAO extends DAO {
	public LichhocDAO() {
		super();
// TODO Auto-generated constructor stub
	}

	/**
	 * lay danh sach cac kip hoc cua lop hoc phan @idLHP
	 * 
	 * @param idLHP: id lop hoc phan
	 * @return danh sach cac kip hoc, moi kip hoc tuong ung mot lich hoc
	 */
	public ArrayList<Lichhoc> getLHcuaLHP(int idLHP) {
		ArrayList<Lichhoc> kq = null;
		String sql = "{call LichLHP(?)}";// su dung stored procedure
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idLHP);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<Lichhoc>();
				Lichhoc lh = new Lichhoc();
				lh.setId(rs.getInt("id"));
				lh.setTen(rs.getString("ten"));
				// lop hoc phan
				Lophocphan lhp = new Lophocphan();
				lhp.setId(idLHP);
				lh.setLophocphan(lhp);
				// giang vien
				Giangvien gv = new Giangvien();
				gv.setId(rs.getInt("idgiangvien"));
				Hoten ht = new Hoten();
				ht.setHodem(rs.getString("hodemgv"));
				ht.setTen(rs.getString("tengv"));
				gv.setHoten(ht);
				lh.setGiangvien(gv);
				// Phong hoc
				Phonghoc ph = new Phonghoc();
				ph.setId(rs.getInt("idphonghoc"));
				ph.setTen(rs.getString("tenphong"));
				lh.setPhonghoc(ph);
				// Tuan hoc
				Tuanhoc tu = new Tuanhoc();
				tu.setId(rs.getInt("idtuan"));
				tu.setTen(rs.getString("tentuan"));
				lh.setTuanhoc(tu);
				// Ngay hoc
				Ngayhoc ng = new Ngayhoc();
				ng.setId(rs.getInt("idngay"));
				ng.setTen(rs.getString("tenngay"));
				lh.setNgayhoc(ng);
				// Kip hoc
				Kiphoc ki = new Kiphoc();
				ki.setId(rs.getInt("idkip"));
				ki.setTen(rs.getString("tenkip"));
				lh.setKiphoc(ki);
				kq.add(lh);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}
}