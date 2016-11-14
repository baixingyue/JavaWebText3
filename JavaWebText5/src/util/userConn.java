package util;

import java.sql.*;

public class userConn {
	// ����������������ݿ����Ӵ����ٶ�ʹ��Mysql���ݿ�
	private String driverStr = "com.mysql.jdbc.Driver";
	private String connStr = "jdbc:mysql://localhost:3306/baixingyue?user=root&password=501109zhy";
	private Connection connection = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// ������������
	public userConn() {
		try {
			Class.forName(driverStr);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.print("error1");
		}
	}

	// ���������ݿ������
	private Connection getConnection() {
		try {
			connection = DriverManager.getConnection(connStr);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("error2");

		}
		return connection;
	}

	// ����������
	private Statement createStatement() {
		try {
			stmt = getConnection().createStatement();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("error3");

		}
		return stmt;
	}

	// ִ�в�ѯ���������ؽ��������
	public ResultSet executeQuery(String sql) {
		try {
			rs = createStatement().executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// ִ�и��²���
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			result = createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// ִ�йرղ���
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (connection != null)
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 
}
