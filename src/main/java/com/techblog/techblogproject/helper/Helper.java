package com.techblog.techblogproject.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    public static boolean deleteFile(String path) {
        try {
            System.out.println("Trying to delete " + path);
            File file = new File(path);
            return file.delete();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean saveFile(InputStream inputStream, String path) {
        try {
            byte[] bytes = new byte[inputStream.available()];
            inputStream.read(bytes);
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
