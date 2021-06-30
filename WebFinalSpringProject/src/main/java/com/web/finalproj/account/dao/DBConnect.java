package com.web.finalproj.account.dao;

import java.sql.Connection;
import java.sql.DriverManager;

// DB 연결을 위해 만든 임시 클래스
public class DBConnect {
	private Connection con = null;
	public DBConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			this.con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:orcl",
					"finalproj", "finalproj");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		return con;
	}
}