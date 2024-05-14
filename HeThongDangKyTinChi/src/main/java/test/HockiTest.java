package test;

import model.Hocki;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class HockiTest {

    @Test
    public void testHocKiProperties() {
        Hocki hocki = new Hocki();
        hocki.setId(10);
        hocki.setTen("2023/2024 Fall");

        assertAll("Properties Test",
            () -> assertEquals(10, hocki.getId(), "HocKi ID should be set and retrieved correctly."),
            () -> assertEquals("2023/2024 Fall", hocki.getTen(), "HocKi name should be set and retrieved correctly.")
        );
    }
}
