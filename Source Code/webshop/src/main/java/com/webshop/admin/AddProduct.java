package com.webshop.admin;

import java.io.IOException;
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
 * Servlet implementation class AddProduct
 */
@WebServlet("/addproduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_name = request.getParameter("pname");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String category = request.getParameter("cat_id");
		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop?useSSL=false","root","");
			PreparedStatement pst = con.prepareStatement("insert into items(item_name,price,quantity,cat_id) values(?,?,?,?)");
			pst.setString(1, item_name);
			pst.setString(2, price);
			pst.setString(3, quantity);
			pst.setString(4, category);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("addproduct.jsp");
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
