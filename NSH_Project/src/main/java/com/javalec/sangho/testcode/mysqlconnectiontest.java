package com.javalec.sangho.testcode;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class mysqlconnectiontest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/sangho?useSSL=false";
	private static final String USER = "root";
	private static final String PW = "tkdgh12";

	@Test
	public void testConnection() throws Exception {

		Class.forName(DRIVER);

		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println("성공" + con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
