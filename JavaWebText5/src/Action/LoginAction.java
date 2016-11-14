package Action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import com.opensymphony.xwork2.Action;
import util.Conn;
public class LoginAction implements Action{
    String username;
    String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String username=this.getUsername();
		String password=this.getPassword();
		Conn bean=new Conn();
		Connection con;
		Statement sql;
		ResultSet rs;
		con = bean.getCon();
		sql = con.createStatement();
		rs = sql.executeQuery(	"select * from t_user where user_username='" + username + "'" + "and password='" + password + "'");	
	    if("admin".equals(this.getUsername())&&"123".equals(this.getPassword())){
		return 	"success";
		}
		else if(rs.next()){
			return "user_success";
		}
		else{
		return "error";	
		}
		
	}


}
