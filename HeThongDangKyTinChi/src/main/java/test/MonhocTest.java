package test;

import model.Monhoc;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class MonhocTest {

    @Test
    void testSubjectDetails() {
        Monhoc subject = new Monhoc();
        subject.setId(1);
        subject.setTen("Physics");
        subject.setSoTC(3);

        assertAll("Ensure correct subject details",
            () -> assertEquals(1, subject.getId()),
            () -> assertEquals("Physics", subject.getTen()),
            () -> assertEquals(3, subject.getSoTC())
        );
    }
}
