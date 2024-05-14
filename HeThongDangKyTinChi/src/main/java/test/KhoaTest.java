package test;

import model.Khoa;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class KhoaTest {

    @Test
    public void testKhoaProperties() {
        Khoa khoa = new Khoa();
        khoa.setId(1);
        khoa.setTen("Engineering");

        assertAll("Test Khoa properties",
            () -> assertEquals(1, khoa.getId()),
            () -> assertEquals("Engineering", khoa.getTen())
        );
    }
}
