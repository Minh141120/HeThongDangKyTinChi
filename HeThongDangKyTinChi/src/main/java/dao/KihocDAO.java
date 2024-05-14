package dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	public Kihoc getKihocById(int id) {
        Kihoc kihoc = null;
        String sql = "SELECT id, ten FROM kihoc WHERE id = ?";

        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                kihoc = new Kihoc();
                kihoc.setId(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching Kihoc by ID: " + e.getMessage());
            // Handle exception or log it
        }

        return kihoc;
    }
}