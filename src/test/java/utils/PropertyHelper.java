package utils;

import java.io.*;
import java.util.Properties;

public class PropertyHelper {
    private static final String basePath = System.getProperty("user.dir") + "/src/test/resources/properties/cab.properties";
    private static Properties props = new Properties();

    public static String readValue(String key) {
        try {
            InputStream in = new BufferedInputStream(new FileInputStream(
                    basePath));
            props.load(in);
            return props.getProperty(key);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void writeProperties(String keyName, String keyValue) {
        try{
            props.load(new FileInputStream(basePath));
            OutputStream fos = new FileOutputStream(basePath);
            props.setProperty(keyName, keyValue);
            props.store(fos, "Update " + keyName + " value");
            fos.close();
        }catch (IOException e) {
            System.err.println("update properties failed");
        }
    }


}
