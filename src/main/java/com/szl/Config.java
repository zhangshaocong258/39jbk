package com.szl;

import java.io.IOException;
import java.util.Properties;

/**
 * Created by zsc on 2016/12/17.
 */
public class Config {
    /**
     * 文件路径
     */
    public static String path;

    /**
     * 分隔符
     */
    public static String DELIMITER;


    static {
        Properties properties = new Properties();
        try {
            properties.load(Config.class.getResourceAsStream("/properties/config.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }

        path = properties.getProperty("path");
        DELIMITER = properties.getProperty("DELIMITER");

    }
}
