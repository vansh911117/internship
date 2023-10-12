<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String subject=request.getParameter("subject");
String message=request.getParameter("message");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spr440","root","vansh");
String qr="insert into contact values(?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, subject);
ps.setString(4, message);

int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("contact.html");
rd.include(request, response);
out.println("Request Sent Sucessfully");
out.clear();



%>