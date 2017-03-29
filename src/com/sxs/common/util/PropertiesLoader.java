package com.sxs.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.DefaultPropertiesPersister;
import org.springframework.util.PropertiesPersister;

/**
 * 
 * @ClassName: PropertiesLoader
 * @Description: Properties工具类
 * @author: tank
 * @date: 2017年2月17日 上午9:30:36
 */
public class PropertiesLoader {

	private static final String DEFAULT_ENCODING = "UTF-8";

	private static PropertiesPersister propertiesPersister = new DefaultPropertiesPersister();
	private static ResourceLoader resourceLoader = new DefaultResourceLoader();

	private PropertiesLoader() {
	}

	/**
	 * 载入多个properties文件, 相同的属性在最后载入的文件中的值将会覆盖之前的载入.
	 * 文件路径使用Spring Resource格式, 文件编码使用UTF-8.
	 * @see org.springframework.beans.factory.config.PropertyPlaceholderConfigurer
	 */
	public static Properties loadProperties(String... resourcesPaths) throws IOException {
		Properties props = new Properties();

		for (String location : resourcesPaths) {
			InputStream is = null;
			try {
				Resource resource = resourceLoader.getResource(location);
				is = resource.getInputStream();
				propertiesPersister.load(props, new InputStreamReader(is, DEFAULT_ENCODING));
			} catch (IOException ex) {
				
			} finally {
				if (is != null) {
					is.close();
				}
			}
		}
		return props;
	}
}
