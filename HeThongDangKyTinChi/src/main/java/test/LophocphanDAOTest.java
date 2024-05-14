package test;

import dao.LophocphanDAO;
import model.Lophocphan;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class LophocphanDAOTest {
    LophocphanDAO lophocphanDAO;

    @BeforeEach
    void setUp() {
        lophocphanDAO = new LophocphanDAO();
    }

    @Test
    void testGetLophocphanValid() {
        Lophocphan lop = lophocphanDAO.getLophocphanById(1); // Assuming 1 is a valid ID
        assertNotNull(lop, "Should retrieve a valid Lophocphan");
    }

    @Test
    void testGetLophocphanInvalid() {
        Lophocphan lop = lophocphanDAO.getLophocphanById(9999); // Assuming 9999 is an invalid ID
        assertNull(lop, "Should return null for invalid ID");
    }

    @Test
    void testExceptionHandling() {
        assertThrows(RuntimeException.class, () -> lophocphanDAO.getLophocphanById(-1));
    }
}
