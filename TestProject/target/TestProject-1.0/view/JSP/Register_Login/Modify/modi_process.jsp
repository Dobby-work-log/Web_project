<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-24
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%@ page import="java.io.*, java.sql.*" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
    String mode = request.getParameter("mode");
    String userid = (String)session.getAttribute("member_id");

    Connection con =null;
    PreparedStatement psmt = null;
    String sql = null;

    String username = request.getParameter("username");
    String password = request.getParameter("password1");
    String security_num1 = request.getParameter("securitynum1");
    String security_num2 = request.getParameter("securitynum2");
    String email = request.getParameter("email");
    String zipcode1 = request.getParameter("zipcode1");
    String zipcode2 = request.getParameter("zipcode2");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }
    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");

        if (mode.equals("update")){
            sql = "update member set username=?, password=?, email=?, zipcode=?, address1=?, address2=?, phone_num=? where userid='"+userid+"'";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, username);
            psmt.setString(2, password);
            psmt.setString(3, email);
            psmt.setString(4, zipcode1+"-"+zipcode2);
            psmt.setString(5, address1);
            psmt.setString(6, address2);
            psmt.setString(7, phone1+"-"+phone2+"-"+phone3);
            psmt.executeUpdate();
            response.sendRedirect("personal_info");

            psmt.close();
        }
    }catch (SQLException e) { out.println(e);} finally {
        con.close();
    }

%>
<html>
<head>

</head>
<body>
<h2> 수정이 완료되었습니다.</h2>
</body>
</html>
