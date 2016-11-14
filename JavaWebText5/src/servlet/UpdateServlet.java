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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Conn;



public class UpdateServlet extends HttpServlet {
	private static Connection con=null;  
	private static final long serialVersionUID = 1L;
    private static 		Conn  conn = new Conn();
  
  
    public UpdateServlet() {
        super();
    }

    public void service(HttpServletRequest request,HttpServletResponse response) 
			throws IOException
	{ 
    	response.setCharacterEncoding("UTF-8");
		response .setContentType("text/html;charset=UTF-8");
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String info = request.getParameter("info");
		String price = request.getParameter("price");
		
		
		PrintWriter out=response.getWriter();
		
		Statement sql = null;
		ResultSet rs = null; 
		
		try {
			sql = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String update = "update t_product set product_type='" + name +  "',product_info='" + info + "',product_price='" +price + "' where product_id='"
				+ id + "';";
		try {
			sql.executeUpdate(update);
			out.print("ÐÞ¸Ä³É¹¦");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
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
