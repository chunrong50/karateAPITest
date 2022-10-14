package utils;

import java.util.Random;

public class RandomHelper {
    private static final String allChar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    private static final String letterChar = "abcedfghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final String numberChar = "0123456789";

    public static String generateRandomChars(int length) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++)
            sb.append(allChar.charAt(random.nextInt(allChar.length())));
        return sb.toString();
    }

    public static String generateRandomLetters(int length) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++)
            sb.append(letterChar.charAt(random.nextInt(letterChar.length())));
        return sb.toString();
    }

    public static Integer generateRandomNumbers(int length) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++)
            sb.append(numberChar.charAt(random.nextInt(numberChar.length())));
        return Integer.parseInt(sb.toString());
    }
}
