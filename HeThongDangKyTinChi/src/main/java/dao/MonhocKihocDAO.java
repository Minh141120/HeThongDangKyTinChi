package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Kihoc;
import model.Monhoc;
import model.MonhocKihoc;

public class MonhocKihocDAO extends DAO {
	public MonhocKihocDAO() {
		super();
// TODO Auto-generated constructor stub
	}

	/**
	 * Lay danh sach cac mon hoc duoc day trong hoc ki @idKihoc
	 * 
	 * @param idSVK:   id cua sinh vien theo khoa/nganh hoc
	 * @param idKihoc: id cua ki hoc dang chon
	 * @return danh sach cac mon hoc duoc phep
	 */
	public ArrayList<MonhocKihoc> getMHcuaSV(int idSVK, int idKihoc) {
		ArrayList<MonhocKihoc> kq = null;
		String sql = "{call MHmaSVduocDK(?,?)}";// su dung stored procedure
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idSVK);
			cs.setInt(2, idKihoc);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<MonhocKihoc>();
				MonhocKihoc mhkh = new MonhocKihoc();
				mhkh.setId(rs.getInt("idmhkh"));
//mon hoc
				Monhoc mh = new Monhoc();
				mh.setId(rs.getInt("idmh"));
				mh.setTen(rs.getString("tenmh"));
				mh.setSoTC(rs.getInt("sotc"));
				mhkh.setMonhoc(mh);
//ki hoc
				Kihoc kh = new Kihoc();
				kh.setId(idKihoc);
				mhkh.setKihoc(kh);
				kq.add(mhkh);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}
}