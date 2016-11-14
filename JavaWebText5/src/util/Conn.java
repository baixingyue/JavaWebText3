package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Conn {
	private	Connection con=null;
	public Conn() {
		try {
			//1.使用MySql的JDBC驱动程序 
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public Connection getCon(){
		try {
			//2.连接数据库
			con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/baixingyue?user=root&password=501109zhy");
		}catch (SQLException e1) {
			e1.printStackTrace();
		}
		return con;
	}

	public void destroy(Connection con){
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

