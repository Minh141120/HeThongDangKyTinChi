package test;

import java.util.ArrayList;
import dao.LophocphanDAO;
import model.Lophocphan;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class LophocphanDAOTest {

    @Test
    void testGetLHPchoSVdangkiSuccess() {
        LophocphanDAO dao = new LophocphanDAO();
        ArrayList<Lophocphan> lophocphans = dao.getLHPchoSVdangki(1, 1);
        assertNotNull(lophocphans, "The list should not be null on successful retrieval");
        assertTrue(lophocphans.size() > 0, "Expected non-empty list on successful retrieval");
    }

    @Test
    void testGetLHPchoSVdangkiNoResults() {
        LophocphanDAO dao = new LophocphanDAO();
        ArrayList<Lophocphan> lophocphans = dao.getLHPchoSVdangki(999, 999); // Assuming this does not exist
        assertNotNull(lophocphans, "The list should not be null even if no results found");
        assertEquals(0, lophocphans.size(), "Expected empty list when no results are found");
    }

    // Add more tests to cover each possible path in your method
}
