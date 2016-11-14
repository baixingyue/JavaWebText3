package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Conn;


public class SeeServlet extends HttpServlet {
	private static Connection con=null;  
	private static final long serialVersionUID = 1L;
    private static 		Conn  conn = new Conn();
   
    public SeeServlet() {
        super();
    }

    public void service(HttpServletRequest request,HttpServletResponse response) 
			throws IOException
	{ 
    	
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response .setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		Statement sql = null;
		ResultSet rs = null; 
		
		try {
			sql = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			rs = sql.executeQuery("select * from t_product");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("<font size=36 color=\"#7E3D76\">购物车</font>");
		out.print("<table  border align=\"center\" >");
		out.print("<tr>");
		out.print("<th width=100>" + "商品编号");
		out.print("<th width=100>" + "商品名称");
		out.print("</tr>");
		try {
			while (rs.next()) {
				out.print("<tr>");
				out.print("<td>" + rs.getString(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("</tr>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("</table>");
	} 
	
	public void init(ServletConfig config) throws ServletException {		
		
		Conn  conn = new Conn();
		con=conn.getCon();
	
	}

	public void destroy() {
		conn.destroy(con);

	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
