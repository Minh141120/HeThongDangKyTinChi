package test;

import dao.KihocDAO;
import model.Kihoc;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class KihocDAOTest {

    private KihocDAO kihocDAO;

    @BeforeEach
    public void setUp() {
        kihocDAO = new KihocDAO();
    }

    @Test
    public void testGetKihocByIdValid() {
        // Test the normal retrieval functionality
        Kihoc kihoc = kihocDAO.getKihocById(1); // Assuming 1 is a valid ID
        assertNotNull(kihoc, "Retrieving a valid Kihoc should not be null");
        assertEquals(1, kihoc.getId(), "The ID should match the request");
    }

    @Test
    public void testGetKihocByIdInvalid() {
        // Test retrieval with an invalid ID
        Kihoc kihoc = kihocDAO.getKihocById(9999); // Assuming 9999 is not a valid ID
        assertNull(kihoc, "Retrieving an invalid Kihoc should be null");
    }

    @Test
    public void testGetKihocByIdException() {
        // Simulate a scenario where the database connection might throw an exception
        assertThrows(RuntimeException.class, () -> kihocDAO.getKihocById(-1),
            "Should throw exception for invalid input or database errors");
    }
}
