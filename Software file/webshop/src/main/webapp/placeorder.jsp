<%@page import="project.*"%>
<%@page import="java.sql.*"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
if (session.getAttribute("name") == null)
	response.sendRedirect("login.jsp");
%>

<%
String email =session.getAttribute("email").toString();
ResultSet rs = Product.getCart(email);
String user_id = Product.getUserId(email);
int invoice = 0;
try{
	Connection con = ConnectionProvider.getCon();
	RequestDispatcher dispatcher = null;
	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	PreparedStatement pst = con.prepareStatement("insert into sales(user_id, order_date, delivery_status) values(?,?,?)",Statement.RETURN_GENERATED_KEYS);
	pst.setString(1, user_id);
	pst.setTimestamp(2, date);
	pst.setString(3, "UnDelivered");
	pst.executeUpdate();
	ResultSet rst = pst.getGeneratedKeys();
	float subTotal = 0;
	if(rst.next()){
		invoice = rst.getInt(1);
		while(rs.next()){
			String item_id = rs.getString(3);
			int qty = Integer.parseInt(rs.getString(4));
			float price = Float.parseFloat(Product.getProductPrice(item_id));
			float total = qty * price;
			subTotal += total;
			PreparedStatement pst2 = con.prepareStatement("insert into order_details(invoice_no, item_id, qty, price,total) values(?,?,?,?,?)");
			pst2.setInt(1,invoice);
			pst2.setString(2, item_id);
			pst2.setInt(3, qty);
			pst2.setFloat(4, price);
			pst2.setFloat(5, total);
			pst2.executeUpdate();
			dispatcher = request.getRequestDispatcher("orders.jsp");
			request.setAttribute("status", "success");
			
		}
		pst = con.prepareStatement("update sales set amount = ?, pay_method = ? where invoice_no = ?");
		pst.setFloat(1, subTotal);
		pst.setString(2, "COD");
		pst.setInt(3, invoice);
		pst.executeUpdate();
		pst = con.prepareStatement("delete from cart where uemail=?");
		pst.setString(1, email);
		pst.executeUpdate();
		dispatcher.forward(request, response);
	}
	System.out.println("Invoice No="+invoice);
	
	
}catch(Exception e){
	System.out.println(e);
}



%>