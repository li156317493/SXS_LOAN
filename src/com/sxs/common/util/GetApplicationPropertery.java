package com.sxs.common.util;

import java.io.IOException;
import java.util.Properties;

/**
 * 
 * @ClassName: GetApplicationPropertery
 * @Description: 获得application.properties
 * @author: tank
 * @date: 2017年2月17日 上午9:32:06
 */
public class GetApplicationPropertery {
    private static Properties props = null;

    static{
        try {
           	props = PropertiesLoader.loadProperties("application.properties");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 从application.properties中获取值
     * @param key
     * @return
     */
   public static String getValueByKey(String key) {
        String value = props.getProperty(key);
        return value;
    }
}
