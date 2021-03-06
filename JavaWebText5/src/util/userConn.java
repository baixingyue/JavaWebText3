package util;

import java.sql.*;

public class userConn {
	// 定义驱动程序和数据库连接串，假定使用Mysql数据库
	private String driverStr = "com.mysql.jdbc.Driver";
	private String connStr = "jdbc:mysql://localhost:3306/baixingyue?user=root&password=501109zhy";
	private Connection connection = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// 加载驱动程序
	public userConn() {
		try {
			Class.forName(driverStr);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.print("error1");
		}
	}

	// 建立与数据库的连接
	private Connection getConnection() {
		try {
			connection = DriverManager.getConnection(connStr);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("error2");

		}
		return connection;
	}

	// 创建语句对象
	private Statement createStatement() {
		try {
			stmt = getConnection().createStatement();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("error3");

		}
		return stmt;
	}

	// 执行查询操作，返回结果集对象
	public ResultSet executeQuery(String sql) {
		try {
			rs = createStatement().executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	// 执行更新操作
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			result = createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 执行关闭操作
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
