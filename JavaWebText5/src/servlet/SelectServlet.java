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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Conn;

public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con=null;  
    private static 		Conn  conn = new Conn();


    public SelectServlet() {
        super();
    }
    public void service(HttpServletRequest request,HttpServletResponse response) 
			throws IOException
	{ 
    	response.setCharacterEncoding("UTF-8");
		response .setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		PrintWriter out=response.getWriter();
		
		Statement sql = null;
		ResultSet rs = null; 
		
		try {
			sql = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			String sqlId=null, sqlName=null;
			sqlId="id="+id ;
			sqlName="name+'"+name+"'";
			
			rs = sql.executeQuery("select * from t_product where id="+id);
		} catch (SQLException e) {
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
			e.printStackTrace();
		}
		out.print("</table>");
	} 
	
	public void init(ServletConfig config) throws ServletException {		
		
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

