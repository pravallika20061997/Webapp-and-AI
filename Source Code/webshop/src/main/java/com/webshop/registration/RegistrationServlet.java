package com.webshop.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String upass = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		String uemail = request.getParameter("email");
		String address = request.getParameter("address");
		String zipcode = request.getParameter("zipcode");
		String credit = request.getParameter("credit");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop?useSSL=false","root","");
			PreparedStatement pst = con.prepareStatement("insert into users(uname,upwd,uemail,umobile,address,zipcode,creditcard_no) values(?,?,?,?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, upass);
			pst.setString(3, uemail);
			pst.setString(4, umobile);
			pst.setString(5, address);
			pst.setString(6, zipcode);
			pst.setString(7, credit);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			}else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
