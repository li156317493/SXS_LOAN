package com.sxs.common.util;

import java.security.MessageDigest;

/**
 * 
 * @ClassName: Md5Utils
 * @Description: Md5Utils
 * @author: tank
 * @date: 2017年2月17日 上午9:31:18
 */
public class Md5Utils {

	private Md5Utils() {
	}

	public final static String MD5(String s) {
		try {
			byte[] btInput = s.getBytes();
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			mdInst.update(btInput);
			byte[] md = mdInst.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < md.length; i++) {
				int val = (md[i]) & 0xff;
				if (val < 16)
					sb.append("0");
				sb.append(Integer.toHexString(val));
			}
			return sb.toString();
		} catch (Exception e) {
			return null;
		}
	}
}
