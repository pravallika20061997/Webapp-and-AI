package project;

import java.sql.*;

public class Product {
	public static int getTotalCategory() {
		try {
			Connection conn = ConnectionProvider.getCon();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select count(*) from category");
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception ex) {

		}
		return 0;

	}

	public static int getTotalSales() {
		try {
			Connection conn = ConnectionProvider.getCon();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select count(*) from sales");
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception ex) {

		}
		return 0;

	}

	public static int getTotalProducts() {
		try {
			Connection conn = ConnectionProvider.getCon();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select count(*) from items");
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception ex) {

		}
		return 0;
	}

	public static ResultSet getProducts(String cat_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select * from items where cat_id = ?");
			pst.setString(1, cat_id);
			ResultSet rs = pst.executeQuery();
			return rs;

		} catch (Exception ex) {

		}
		return null;
	}

	public static ResultSet getCart(String uemail) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select * from cart where uemail = ?");
			pst.setString(1, uemail);
			ResultSet rs = pst.executeQuery();
			return rs;

		} catch (Exception ex) {

		}
		return null;
	}

	public static String getProductName(String item_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select item_name from items where item_id = ?");
			pst.setString(1, item_id);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				return rs.getString(1);

		} catch (Exception ex) {

		}
		return null;
	}

	public static String getProductPrice(String item_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select price from items where item_id = ?");
			pst.setString(1, item_id);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				return rs.getString(1);

		} catch (Exception ex) {

		}
		return null;
	}

	public static ResultSet getOrders(String email) {
		try {
			Connection con = ConnectionProvider.getCon();
			if (email == "admin") {
				PreparedStatement pst = con.prepareStatement("select * from sales order by invoice_no desc");
				return pst.executeQuery();
			}
			String user_id = getUserId(email);

			PreparedStatement pst = con.prepareStatement("select * from sales where user_id = ?");
			pst.setString(1, user_id);
			System.out.println(user_id);
			ResultSet rs = pst.executeQuery();

			return rs;

		} catch (Exception ex) {

		}
		return null;
	}

	public static String getUserId(String email) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select user_id from users where uemail = ?");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				return rs.getString(1);

		} catch (Exception ex) {

		}
		return null;
	}
	
	public static String getCreditNo(String user_id) {
		try {
			Connection con = ConnectionProvider.getCon();
			PreparedStatement pst = con.prepareStatement("select creditcard_no from users where user_id = ?");
			pst.setString(1, user_id);
			ResultSet rs = pst.executeQuery();
			if (rs.next())
				return rs.getString(1);

		} catch (Exception ex) {

		}
		return null;
	}
}
