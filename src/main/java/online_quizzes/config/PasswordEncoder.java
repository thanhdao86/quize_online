package online_quizzes.config;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class PasswordEncoder {
    private static final int SALT_LENGTH = 16;

    public String encode(String rawPassword) {
        try {
            // Generate a random salt
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[SALT_LENGTH];
            random.nextBytes(salt);

            // Hash the password with SHA-256
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] hashedPassword = md.digest(rawPassword.getBytes());

            // Convert salt and hashed password to hex
            String saltHex = bytesToHex(salt);
            String hashedPasswordHex = bytesToHex(hashedPassword);

            // Combine salt and hashed password
            return saltHex + ":" + hashedPasswordHex;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    public boolean matches(String rawPassword, String encodedPassword) {
        try {
            // Split the stored password into salt and hashed password
            String[] parts = encodedPassword.split(":");
            byte[] salt = hexToBytes(parts[0]);
            String storedHashedPassword = parts[1];

            // Hash the raw password with the stored salt
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(salt);
            byte[] hashedPassword = md.digest(rawPassword.getBytes());
            String computedHashedPassword = bytesToHex(hashedPassword);

            // Compare the computed hash with the stored hash
            return computedHashedPassword.equals(storedHashedPassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error matching password", e);
        }
    }

    // Utility method to convert byte array to hex string
    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }

    // Utility method to convert hex string to byte array
    private byte[] hexToBytes(String hex) {
        int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                    + Character.digit(hex.charAt(i+1), 16));
        }
        return data;
    }
}