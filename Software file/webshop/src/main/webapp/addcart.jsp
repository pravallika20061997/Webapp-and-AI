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
String item_id = request.getParameter("id");
int quantity =  1;
float item_price = 0;
float cart_total = 0;

int z = 0;
try{
	RequestDispatcher dispatcher = null;
	Connection con = ConnectionProvider.getCon();
	PreparedStatement pst = con.prepareStatement("select qty from cart where uemail = ? and item_id = ?");
	pst.setString(1, email);
	pst.setString(2, item_id);
	ResultSet rs  = pst.executeQuery();
	if(rs.next()) {
		if (rs.getInt(1) >= 1 ){
			dispatcher = request.getRequestDispatcher("index.jsp");
			request.setAttribute("status", "failed");
			dispatcher.forward(request, response);
		}
	}else{
		PreparedStatement pst2 = con.prepareStatement("insert into cart(uemail,item_id,qty) values(?,?,?)");
		pst2.setString(1, email);
		pst2.setString(2, item_id);
		pst2.setString(3, "1");
		pst2.executeUpdate();
		dispatcher = request.getRequestDispatcher("index.jsp");
		request.setAttribute("status", "success");
		dispatcher.forward(request, response);
	}
	
}catch(Exception e){
	System.out.println(e);
}

%>