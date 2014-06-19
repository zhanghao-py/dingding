package cn.edu.bjut.weichat.core.util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

public class DateFormat {

	public static Date getCurrentTime() {
//		Calendar c = Calendar.getInstance();
//
//		c.setTime(new Date());
//		Timestamp timestamp = new Timestamp(c.getTimeInMillis());
//
//		return timestamp;
		return new Date();
	}
}
