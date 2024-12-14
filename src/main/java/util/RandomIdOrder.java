package util;

import java.util.Random;

public class    RandomIdOrder {
    public static int generateRandomNumber() {
        Random random = new Random();
        return random.nextInt(100000) + 1;
    }
}
