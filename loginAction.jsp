<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String password=request.getParameter("password");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Password:1729");
	Statement st=con.createStatement();
	
	st.executeUpdate("insert into logindetails (name, password) values('"+name+"', '"+password+"')");
	response.sendRedirect("homepage.html");


}
catch(Exception e)
{
	out.println(e);
}
%>
