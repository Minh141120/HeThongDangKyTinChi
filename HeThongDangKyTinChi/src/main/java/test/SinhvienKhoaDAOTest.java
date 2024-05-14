package test;

import java.util.ArrayList;
import dao.SinhvienKhoaDAO;
import model.SinhvienKhoa;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class SinhvienKhoaDAOTest {

    @Test
    void testGetNganhcuaSVSuccess() {
        SinhvienKhoaDAO dao = new SinhvienKhoaDAO();
        ArrayList<SinhvienKhoa> sinhvienKhoas = dao.getNganhcuaSV(1);
        assertNotNull(sinhvienKhoas, "The list should not be null on successful retrieval");
        assertTrue(sinhvienKhoas.size() > 0, "Expected non-empty list on successful retrieval");
    }

    @Test
    void testGetNganhcuaSVNoResults() {
        SinhvienKhoaDAO dao = new SinhvienKhoaDAO();
        ArrayList<SinhvienKhoa> sinhvienKhoas = dao.getNganhcuaSV(999); // Assuming this ID does not exist
        assertNotNull(sinhvienKhoas, "The list should not be null even if no results found");
        assertEquals(0, sinhvienKhoas.size(), "Expected empty list when no results are found");
    }

    // Add more tests to cover each possible path in your method
}
