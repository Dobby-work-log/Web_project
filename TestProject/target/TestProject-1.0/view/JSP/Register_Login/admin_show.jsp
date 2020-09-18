<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-27
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.ibatis.jdbc.SQL" %>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String sql = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
    } catch (SQLException e) { out.println(e); }

    try {
        st = con.createStatement();
        rs = st.executeQuery("select * from member order by userid");
%>

<html>
<head>
    <title>회원 정보 관리</title>
</head>
<body>
<h2 align="center">관리자 모드 - 회원 정보 관리</h2>
<table border="1" align="center">
    <th>사용자 ID</th>
    <th>이 름</th>
    <th>주 소</th>
    <%if (!(rs.next())) {%>
    <tr><td colspan="3">등록된 회원이 없습니다.</td></tr>
    <%} else {
       do {
        out.println("<tr>");
        out.println("<td align='center'>" + rs.getString("userid") + "</td>");
        out.println("<td align='center'>"+ rs.getString("username") + "</td>");
        out.println("<td align='center'>" + rs.getString("address1"));
        out.println(rs.getString("address2") + "</td>");
        out.println("</tr>");
        }while (rs.next());
    }
        rs.close();
        st.close();
        con.close();
    } catch (SQLException e) {System.out.println(e);}
    %>
</table>
</body>
</html>
