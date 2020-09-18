<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-07-13
  Time: 오후 5:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
Object mem_id = session.getAttribute("member_id");
session.setAttribute(session.getId(),mem_id);
String userid = (String) session.getAttribute(session.getId());

    Connection con = null;
    Statement st = null;
    String sql = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
        st = con.createStatement();
        sql = "delete from member where userid = '"+userid+"'";
        st.executeUpdate(sql);
        con.close();
        st.close();
    }catch (SQLException e){ out.println(e);}
%>
<script>
    alert("<%=mem_id%> 회원님의 탈퇴가 안정적으로 진행되었습니다.");
</script>
<%
    response.sendRedirect("main_frame");
%>
