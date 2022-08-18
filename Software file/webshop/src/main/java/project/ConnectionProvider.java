package project;
import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop?useSSL=false","root","");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
