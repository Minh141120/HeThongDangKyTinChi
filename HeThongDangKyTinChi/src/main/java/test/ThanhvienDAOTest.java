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
    @Test
    public void testFindByValidId() {
        ThanhvienDAO dao = new ThanhvienDAO();
        Thanhvien result = dao.findById(1); // Assuming 1 is a valid ID
        assertNotNull(result);
        assertEquals(1, result.getId());
    }

    @Test
    public void testFindByInvalidId() {
        ThanhvienDAO dao = new ThanhvienDAO();
        Thanhvien result = dao.findById(9999); // Assuming 9999 is not a valid ID
        assertNull(result);
    }
    @Test
    public void testAuthenticationSuccess() {
        ThanhvienDAO dao = new ThanhvienDAO();
        Thanhvien tv = new Thanhvien();
        tv.setUsername("user1");
        tv.setPassword("pass1");
        assertTrue(dao.kiemtraDangnhap(tv));
    }

    @Test
    public void testAuthenticationFailure() {
        ThanhvienDAO dao = new ThanhvienDAO();
        Thanhvien tv = new Thanhvien();
        tv.setUsername("wronguser");
        tv.setPassword("wrongpass");
        assertFalse(dao.kiemtraDangnhap(tv));
    }

    // Add tests for other methods like addThanhvien, updateThanhvien, etc.
}
