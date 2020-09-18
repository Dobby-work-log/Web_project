<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-28
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String sub = request.getParameter("subject");
String cont = request.getParameter("content");
String sql = null;

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat df = new SimpleDateFormat("yy-MM-d h:mm a");
String ymd = df.format(yymmdd);

Connection con = null;
Statement st = null;
int cnt = 0;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
        st = con.createStatement();

        sql = "insert into guestboard values( '"+username+"','"+email+"', '"+ymd+"', '"+sub+"', '"+cont+"')";

        cnt = st.executeUpdate(sql);

        if (cnt >0){
            response.sendRedirect("/blog");
        }else {
            out.println("데이터가 입력되지 않았습니다.");
        }
        st.close();
        con.close();
    }catch (SQLException e){ out.println(e);}
%>