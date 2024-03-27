package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Hocki;
import model.Kihoc;
import model.Namhoc;

public class KihocDAO extends DAO {
	public KihocDAO() {
		super();
// TODO Auto-generated constructor stub
	}

	/**
	 * Lay danh sach cac hoc ki dang mo cho sinh vien chon dang ki hoc
	 * 
	 * @return danh sach ki hoc dang mo dang ki
	 */
	public ArrayList<Kihoc> getKihocdangki() {
		ArrayList<Kihoc> kq = null;
		String sql = "{call kiDangDK()}"; // su dung stored procedure
		try {
			CallableStatement cs = con.prepareCall(sql);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<Kihoc>();
				Kihoc kh = new Kihoc();
				kh.setId(rs.getInt("idkihoc"));
				// nam hoc
				Namhoc nh = new Namhoc();
				nh.setId(rs.getInt("idnamhoc"));
				nh.setTen(rs.getString("namhoc"));
				kh.setNamhoc(nh);
				// hoc ki
				Hocki hk = new Hocki();
				hk.setId(rs.getInt("idhocki"));
				hk.setTen(rs.getString("hocki"));
				kh.setHocki(hk);
				kq.add(kh);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}
}