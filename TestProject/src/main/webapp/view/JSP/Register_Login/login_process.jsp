<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-19
  Time: 오후 7:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,java.io.*, java.text.*, java.net.*, java.util.*" %>
<%
    String user_id = request.getParameter("userid");
    String pw = request.getParameter("password");

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    String name = new String();
    String e_mail = new String();

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
        st = con.createStatement();
    }catch (SQLException e){ out.println(e);}

    boolean blogin = false;

    try {
        String sql = "select * from member where userid = '"+user_id+"' and password = '"+pw+"'";
        rs = st.executeQuery(sql);

        if (rs.next()){
            name = rs.getString("username");
            e_mail = rs.getString("email");
            blogin = true;
        }else {
            blogin = false;
        }
        rs.close();
        st.close();

    }catch (SQLException e){ out.println(e);
    } finally {
        con.close();
    }


    if (blogin){
        session.setAttribute("member_id",user_id);
        session.setAttribute("member_name",name);
        session.setAttribute("member_email",e_mail);
        response.sendRedirect("left_frame");
    }else {
        out.println("<script>alert('아이디와 비밀번호를 확인하세요'); history.back(); </script>");
    }

%>