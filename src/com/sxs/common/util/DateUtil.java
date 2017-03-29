package com.sxs.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @ClassName: DateUtil
 * @Description: 日期、时间操作工具类
 * @author: tank
 * @date: 2017年2月17日 上午9:27:34
 */
public class DateUtil {
	public static String getDateString(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format( new Date());
	}
}
