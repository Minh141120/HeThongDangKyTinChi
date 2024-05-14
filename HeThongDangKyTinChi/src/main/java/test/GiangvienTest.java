package test;

import model.Giangvien;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import model.Hoten;
public class GiangvienTest {

    @Test
    public void testGiangvienProperties() {
        Giangvien giangvien = new Giangvien();
        giangvien.setId(1);
        Hoten ht = new Hoten();
        ht.setHodem("Dr.");
        ht.setTen("Smith");
        giangvien.setHoten(ht);

        assertAll("Testing Giangvien properties",
            () -> assertEquals(1, giangvien.getId()),
            () -> assertEquals("Dr. Smith", giangvien.getHoten())
        );
    }

    // Add more tests if there are other properties or business methods
}
