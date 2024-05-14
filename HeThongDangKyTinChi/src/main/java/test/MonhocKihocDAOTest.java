package test;

import dao.MonhocKihocDAO;
import model.MonhocKihoc;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class MonhocKihocDAOTest {

    @Test
    public void testGetMonhocKihoc() {
        MonhocKihocDAO dao = new MonhocKihocDAO();
        MonhocKihoc monhocKihoc = dao.getMonhocKihocById(1);

        assertNotNull(monhocKihoc, "Should retrieve MonhocKihoc by ID");
        assertEquals(1, monhocKihoc.getId());
        assertEquals("Calculus", monhocKihoc.getMonhoc().getTen()); // Assumed getters
    }
    
    @Test
    public void testGetMonhocKihocByValidId() {
        MonhocKihocDAO dao = new MonhocKihocDAO();
        MonhocKihoc monhocKihoc = dao.getMonhocKihocById(1); // Assuming 1 is a valid ID
        assertNotNull(monhocKihoc);
        assertEquals(1, monhocKihoc.getId());
    }

    @Test
    public void testGetMonhocKihocByInvalidId() {
        MonhocKihocDAO dao = new MonhocKihocDAO();
        MonhocKihoc monhocKihoc = dao.getMonhocKihocById(10000); // Assuming 10000 is not a valid ID
        assertNull(monhocKihoc);
    }

    // Add more tests to cover all operations
}
