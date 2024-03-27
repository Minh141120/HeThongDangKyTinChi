package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Dangkihoc;
import model.Khoa;
import model.Kihoc;
import model.Lophocphan;
import model.Monhoc;
import model.MonhocKihoc;
import model.Sinhvien;
import model.SinhvienKhoa;

public class DangkihocDAO extends DAO {

	public DangkihocDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * lay danh sach cac lop hoc phan ma @idSVK da dang ki trong hoc ki @idKihoc
	 * 
	 * @param idSVK:   id sinh vien khoa
	 * @param idKihoc: id ki hoc
	 * @return dang sach dang ki hoc
	 */
	public ArrayList<Dangkihoc> getDKcuaSV(int idSVK, int idKihoc) {
		ArrayList<Dangkihoc> kq = null;
		String sql = "{call DKcuaSVtheoKi(?,?)}"; // su dung stored procedure
		LichhocDAO ld = new LichhocDAO();
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idSVK);
			cs.setInt(2, idKihoc);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<Dangkihoc>();
				Dangkihoc dk = new Dangkihoc();
				dk.setId(rs.getInt("id"));
				// lop hoc phan
				Lophocphan lhp = new Lophocphan();
				lhp.setId(rs.getInt("idlhp"));
				lhp.setTen(rs.getString("tenlhp"));
				lhp.setDsLichhoc(ld.getLHcuaLHP(lhp.getId())); // get lich
				// monhockihoc
				MonhocKihoc mhkh = new MonhocKihoc();
				mhkh.setId(rs.getInt("idmhkh"));
				// monhoc
				Monhoc mh = new Monhoc();
				mh.setId(rs.getInt("idmh"));
				mh.setTen(rs.getString("tenmh"));
				mh.setSoTC(rs.getInt("sotc"));
				mhkh.setMonhoc(mh);
				// kihoc
				Kihoc kh = new Kihoc();
				kh.setId(idKihoc);
				mhkh.setKihoc(kh);
				lhp.setMonhocKihoc(mhkh);
				dk.setLophocphan(lhp);
				// sinhvienkhoa
				SinhvienKhoa svk = new SinhvienKhoa();
				svk.setId(idSVK);
				// sinh vien
				Sinhvien sv = new Sinhvien();
				sv.setId(rs.getInt("idsinhvien"));
				svk.setSinhvien(sv);
				// khoa
				Khoa k = new Khoa();
				k.setId(rs.getInt("idkhoa"));
				svk.setKhoa(k);
				dk.setSinhvienKhoa(svk);
				kq.add(dk);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}

	public boolean luuDKcuaSV(ArrayList<Dangkihoc> listDK) {
		if ((listDK == null) || (listDK.size() == 0))
			return false;
		boolean kq = false;
		String sqlXoa = "DELETE FROM tbldangkihoc WHERE idsinhvienkhoa=? AND idlophocphan IN "
				+ "(SELECT a.id FROM tbllophocphan a, tblmonhockihoc b WHERE b.idkihoc = ? AND a.idmonhockihoc=b.id)";
		String sqlThem = "INSERT INTO tbldangkihoc(idsinhvienkhoa, idlophocphan) VALUES(?,?)";
		try {
			this.con.setAutoCommit(false);
			// xoa het dang ki cu
			int idSVK = listDK.get(0).getSinhvienKhoa().getId();
			int idKihoc = listDK.get(0).getLophocphan().getMonhocKihoc().getKihoc().getId();
			PreparedStatement psXoa = con.prepareStatement(sqlXoa);
			psXoa.setInt(1, idSVK);
			psXoa.setInt(2, idKihoc);
			psXoa.executeUpdate();
			// them lai dang ki nhu dang ki moi
			for (Dangkihoc dk : listDK) {
				PreparedStatement psThem = con.prepareStatement(sqlThem);
				psThem.setInt(1, dk.getSinhvienKhoa().getId());
				psThem.setInt(2, dk.getLophocphan().getId());
				psThem.executeUpdate();
			}
			this.con.commit(); // cmt dong nay ney chay che do JUnit test
			kq = true;
		} catch (Exception e) {
			try {
				this.con.rollback(); // cmt dong nay ney chay che do JUnit test
			} catch (Exception ee) {
				kq = false;
				ee.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				this.con.setAutoCommit(true); // cmt dong nay neu chay che do JUnit test
			} catch (Exception e) {
				kq = false;
				e.printStackTrace();
			}
		}
		return kq;
	}
}
