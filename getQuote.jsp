<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String service=request.getParameter("service");
String note=request.getParameter("note");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spr440","root","vansh");
String qr="insert into getquote values(?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(qr);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, mobile);
ps.setString(4, service);
ps.setString(5, note);
int i=ps.executeUpdate();
RequestDispatcher rd=request.getRequestDispatcher("index.html");
rd.include(request, response);
out.println(i+" quote added");
out.clear();
%>