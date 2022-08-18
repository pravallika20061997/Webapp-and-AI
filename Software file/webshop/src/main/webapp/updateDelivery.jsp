<%@page import="project.*"%>
<%@page import="java.sql.*"%>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
if (session.getAttribute("admin") == null)
	response.sendRedirect("login.jsp");
%>

<%
String invoice_no = request.getParameter("id");
try {
	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	RequestDispatcher dispatcher = null;
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con
	.prepareStatement("update sales set delivery_status = ?, delivery_date = ? where invoice_no = ?");
	pst.setString(1, "Delivered");
	pst.setTimestamp(2, date);
	pst.setString(3, invoice_no);
	pst.executeUpdate();
	dispatcher = request.getRequestDispatcher("salesdetails.jsp");
	dispatcher.forward(request, response);

} catch (Exception e) {
	System.out.println(e);
}
%>