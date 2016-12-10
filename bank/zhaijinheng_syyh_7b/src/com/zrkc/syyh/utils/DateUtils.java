package com.zrkc.syyh.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 日期工具类
 * @author dongzheng
 *
 */
public class DateUtils {
	
	public static final String YYMMDD_hhmmss="yyyy-MM-dd hh:mm:ss";
	public static final String YYMMDD_HHmmss_24="yyyy-MM-dd HH:mm:ss";
	public static final String YYMMDD="yyyy-MM-dd";
	
	/**
	 * 将日期转化为字符串
	 * @param format 日期格式
	 * @param date 日期
	 * @return
	 */
	public static String dateToStr( String format , Date date ){
		try{
			DateFormat fmt = new SimpleDateFormat(format);
			return fmt.format(date);
		} catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}
	/**
	 * 将日期转化为字符串
	 * @param date 日期
	 * @return
	 */
	public static String dateToStr(Date date){
		try{
			DateFormat fmt = new SimpleDateFormat(YYMMDD);
			return fmt.format(date);
		} catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}
	/**
	 * 字符串转化为日期
	 * @param format 字符的日期格式
	 * @param timeStr 日期字符串
	 * @return  日期
	 */
	public static Date strToDate( String format, String timeStr){
		try{
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			Date date = sdf.parse(timeStr);
			return date;
		} catch( ParseException e){
			//e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获得当前日期的月份
	 * @return 月份
	 */
	public static int getMONTH(){
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		return month ;
	}
	/**
	 * 获得日期的月份
	 * @param date 日期
	 * @return 月份
	 */
	public static int getMONTH( Date date ){
		if( date == null ) return 0 ;
		Calendar cal = Calendar.getInstance();
		cal.setTime( date );
		int month = cal.get(Calendar.MONTH) + 1;
		return month ;
	}
	/**
	 * 获得当前日期的年
	 * @return
	 */
	public static int getYEAR(){
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR) ;
		return year ;
	}
	/**
	 * 获得日期的年
	 * @param date 日期
	 * @return 年
	 */
	public static int getYEAR( Date date ){
		if( date == null ) return 0 ;
		Calendar cal = Calendar.getInstance();
		cal.setTime( date );
		int year = cal.get(Calendar.YEAR) ;
		return year ;
	}


}
