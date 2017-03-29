package com.sxs.common.util;

import java.util.UUID;

public class UUIDUtil {

	public static String getId(){
		String id =UUID.randomUUID().toString();
		
		return id.replace("-", "");
	}
	public static void main(String[] args) {
		System.out.println(UUIDUtil.getId());
	}
}
