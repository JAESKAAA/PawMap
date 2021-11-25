package com.pawmap.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CUtil {

	public static String getNowDateStr() {
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date nowDate = new Date();
		String nowDateStr = dateTimeFormat.format(nowDate);

		return nowDateStr;
	}

}