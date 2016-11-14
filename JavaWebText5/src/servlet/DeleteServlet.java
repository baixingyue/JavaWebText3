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


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con=null;  
	private static Conn  conn = new Conn();
	public DeleteServlet() {
		super();
	}
	public void service(HttpServletRequest request,HttpServletResponse response) 
			throws IOException
	{ 
		response.setCharacterEncoding("UTF-8");
		response .setContentType("text/html;charset=UTF-8");

		String id = request.getParameter("id");

		PrintWriter out=response.getWriter();

		Statement sql = null;
		ResultSet rs = null; 
		Integer.parseInt(id);
		if (id == null || id == "") {
			out.println("请从输入完整的信息");
		} else {
			try {

				sql = con.createStatement();

			} catch (SQLException e) {
				e.printStackTrace();
			}

			String delete = "delete from t_product where product_id=" + id;
			try {
				sql.executeUpdate(delete);
				out.print("删除成功");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		} }

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
