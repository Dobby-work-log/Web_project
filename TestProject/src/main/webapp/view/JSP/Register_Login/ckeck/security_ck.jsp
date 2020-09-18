<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-07-01
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*, java.net.*" %>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

String secu_num= request.getParameter("securitynum");
String sql ;

int ck_cmt = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false", "root", "1234");
        st = con.createStatement();

        sql = "select count(*) as count from member where security_num= '"+secu_num+"'";

        rs = st.executeQuery(sql);
        rs.next();
        ck_cmt = rs.getInt("count");
        rs.close();
        st.close();
    }catch (SQLException e){} finally {
        con.close();
    }
%>


<html>
<head>
    <title> **주민증록번호 중복검사** </title>
</head>
<body>
<table border="1">
    <tr>
        <td>
            <%if (ck_cmt > 0) {%>
            [<%=secu_num%>] 은 등록되어있는 주민등록번호 입니다.
            <%} else {%>
            [<%=secu_num%>]은 등록 가능한 번호입니다.
            <%}%>
        </td>
    </tr>
    <tr><td></td></tr>
    <tr><td align="center">
        <input type="button" value="확인" onclick="self.close()">
    </td></tr>
</table>

</body>
</html>
