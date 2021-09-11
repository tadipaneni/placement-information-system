import java.io.*;
import javax.servlet.*;


import org.apache.tomcat.util.http.parser.Cookie;

import java.sql.*;

public class LoginServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			String uname=request.getParameter("username");
			String pwd=request.getParameter("password");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
			PreparedStatement pstmt=con.prepareStatement("select * from registeruser where username=? and password=?");
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				Cookie ck=new Cookie("username",uname);
				response.addCookie(ck);
				response.sendRedirect("AfterLogin.html");				
			}
			else
			{
				out.println("Details are invalid..login again");
				request.getRequestDispatcher("login.html").include(request, response);
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}