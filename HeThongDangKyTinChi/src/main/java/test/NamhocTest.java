package test;

import model.Namhoc;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class NamhocTest {

    @Test
    public void testNamhocProperties() {
        Namhoc namhoc = new Namhoc();
        namhoc.setId(1);
        namhoc.setTen("2023-2024");

        assertAll("Testing Namhoc Properties",
            () -> assertEquals(1, namhoc.getId(), "Namhoc ID should match"),
            () -> assertEquals("2023-2024", namhoc.getTen(), "Namhoc name should match")
        );
    }
}
