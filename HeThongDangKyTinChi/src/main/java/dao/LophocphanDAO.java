package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Kihoc;
import model.Lophocphan;
import model.Monhoc;
import model.MonhocKihoc;

public class LophocphanDAO extends DAO {
	public LophocphanDAO() {
		super();
// TODO Auto-generated constructor stub
	}

	/**
	 * lay danh sach cac lop hoc phan cua @idMHKH ma sinh vien @idSVK
	 * 
	 * @param idMHKH: id cua mon hoc ki hoc
	 * @param idSVK:  id cua sinh vien khoa
	 * @return: danh sach lop hoc phan con co the dang ki duoc
	 */
	public ArrayList<Lophocphan> getLHPchoSVdangki(int idSVK, int idMHKH) {
		ArrayList<Lophocphan> kq = null;
		String sql = "{call LHPchoSVdangki(?,?)}";// su dung stored procedure
		try {
			CallableStatement cs = con.prepareCall(sql);
			cs.setInt(1, idSVK);
			cs.setInt(2, idMHKH);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				if (kq == null)
					kq = new ArrayList<Lophocphan>();
				Lophocphan lhp = new Lophocphan();
				lhp.setId(rs.getInt("id"));
				lhp.setTen(rs.getString("ten"));
				lhp.setSisotoida(rs.getInt("sisotoida"));
				lhp.setSisothucte(rs.getInt("sisothuc"));
//monhockihoc
				MonhocKihoc mhkh = new MonhocKihoc();
				mhkh.setId(idMHKH);
//monhoc
				Monhoc mh = new Monhoc();
				mh.setId(rs.getInt("idmh"));
				mh.setTen(rs.getString("tenmh"));
				mh.setSoTC(rs.getInt("sotc"));
				mhkh.setMonhoc(mh);
				// kihoc
				Kihoc kh = new Kihoc();
				kh.setId(rs.getInt("idkihoc"));
				mhkh.setKihoc(kh);
				lhp.setMonhocKihoc(mhkh);
				kq.add(lhp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			kq = null;
		}
		return kq;
	}
	public Lophocphan getLophocphanById(int id) {
        Lophocphan lophocphan = null;
        String sql = "SELECT * FROM lophocphan WHERE id = ?";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                lophocphan = new Lophocphan();
                lophocphan.setId(resultSet.getInt("id"));
                lophocphan.setTen(resultSet.getString("ten"));
                lophocphan.setSisotoida(resultSet.getInt("sisotoida"));
                lophocphan.setSisothucte(resultSet.getInt("sisothucte"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lophocphan;
    }
}