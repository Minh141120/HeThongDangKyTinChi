package test;

import dao.ThanhvienDAO;
import model.Thanhvien;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class ThanhvienDAOTest {

    @Test
    public void testFindById() {
        ThanhvienDAO dao = new ThanhvienDAO();
        Thanhvien thanhvien = dao.findById(1);

        assertNotNull(thanhvien, "Should find a Thanhvien by ID");
        assertEquals(1, thanhvien.getId());
        assertEquals("John Doe", thanhvien.getHoten()); // Update this as per your class attributes
    }

    // Add tests for other methods like addThanhvien, updateThanhvien, etc.
}
