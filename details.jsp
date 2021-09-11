<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String college=request.getParameter("college");
String cgpa=request.getParameter("cgpa");
String education=request.getParameter("education");
String eyear=request.getParameter("eyear");
String interested_companies =request.getParameter("interested_companies");


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Password:1729");
	Statement st=con.createStatement();
	
	st.executeUpdate("insert into details (name, gender, college, cgpa, education, expected_year,interested_companies) values('"+name+"', '"+gender+"', '"+college+"', '"+cgpa+"', '"+education+"', '"+eyear+"', '"+interested_companies+"')");
	response.sendRedirect("success.html");


}
catch(Exception e)
{
	out.println(e.getMessage());
}
%>