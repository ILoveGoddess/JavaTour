package com.zrkc.syyh.utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;


public class ConnUtil {
	private static Properties p = new Properties();
	static{
		try {
			//p.load(new FileInputStream(new File("./conf/jdbc.properties")));
			p.load(ConnUtil.class.getClassLoader().getResourceAsStream("jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获得连接
	 * @return
	 */
	public static Connection getConnection() {
		try {
			Class.forName(p.getProperty("driver"));
			Connection con = DriverManager.getConnection(p.getProperty("url"),p.getProperty("name"),p.getProperty("pwd"));
			return  con;
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return  null;
	}
	/**
	 * 关闭连接
	 * @param rs
	 * @param stmt
	 * @param conn
	 */
	public static void closeConnection(ResultSet rs, Statement stmt, Connection conn) {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	/**
	 * 关闭连接
	 * @param stmt
	 * @param conn
	 */
	public static void closeConnection(Statement stmt, Connection conn) {
		closeConnection(null,stmt,conn);
	}
	public static void main(String[] args) {
		Connection c=ConnUtil.getConnection();
		System.out.println(c);
		ConnUtil.closeConnection(null, c);
	}

}
