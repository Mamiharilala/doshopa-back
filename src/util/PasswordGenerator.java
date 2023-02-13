package util;

import java.util.Random;

public class PasswordGenerator {
	public static final String upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String lowerChars = "abcdefghijklmnopqrstuvwxyz";
    public static final String numbers = "1234567890";
    public static final String specialChars = "!@#$%^&*()_+{}";

    public static String generatePassword(
            int passwordSize,
            boolean useUpper,
            boolean useLower,
            boolean useNumbers,
            boolean useSpecial
    ) {
        char[] password = new char[passwordSize];
        String charSet = null;
        Random random = new Random();

        if (useUpper) charSet += upperChars;
        if (useLower) charSet += lowerChars;
        if (useNumbers) charSet += numbers;
        if (useSpecial) charSet += specialChars;

        for (int i = 0; i < passwordSize; i++) {
            password[i] = charSet.toCharArray()[random.nextInt(charSet.length() - 1)];
        }
        return String.valueOf(password);
    }
    public static void main(String []args) {
    	System.out.println(PasswordGenerator.generatePassword(4, true, true, true, false));
    }
}
