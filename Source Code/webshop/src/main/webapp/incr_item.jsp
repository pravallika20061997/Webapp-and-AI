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
String srno = request.getParameter("id");
try{
	RequestDispatcher dispatcher = null;
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("select qty from cart where srno = ?");
	pst.setString(1, srno);
	
	ResultSet rs  = pst.executeQuery();
	
	if(rs.next()) {
		int qty = rs.getInt(1);
		qty++;
		PreparedStatement pst2 = con.prepareStatement("update cart set qty = ? where srno = ?");
		pst2.setString(1, qty+"");
		pst2.setString(2, srno);
		pst2.executeUpdate();
		dispatcher = request.getRequestDispatcher("cart.jsp");
		request.setAttribute("status", "success");
		dispatcher.forward(request, response);
		
	}
	
}catch(Exception e){
	System.out.println(e);
}

%>