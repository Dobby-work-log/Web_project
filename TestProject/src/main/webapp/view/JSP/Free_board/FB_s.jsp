<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-09-07
  Time: 오후 4:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.sql.*, java.util.*, java.text.*" %>
<%request.setCharacterEncoding("euc-kr");%>

<%
        String una = (String) session.getAttribute("member_name");
        String em = request.getParameter("email");
        String sub = request.getParameter("subject");
        String cont = request.getParameter("content");
        String pw = request.getParameter("pw");

        int id =0;

        if (cont.length()==1)
            cont = cont + " ";

        String sql = null;

        java.util.Date yymmdd = new java.util.Date();
        SimpleDateFormat df = new SimpleDateFormat("yy-MM-d h:mm a");
        String ymd = df.format(yymmdd);

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        int cnt =0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e){
            out.println(e);
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
            st = con.createStatement();
            sql = "select max(id) from freeboard";
            rs = st.executeQuery(sql);

            if (!(rs.next()))
                id =1;
            else { id = rs.getInt(1)+1; rs.close();}


            sql = "insert into freeboard values ('"+id+"','"+una+"', '"+em+"', '"+sub+"','"+cont+"', '"+pw+"', '"+ymd+"','"+id+"',0,0,0)";

            cnt = st.executeUpdate(sql);

            if (cnt >0)
                response.sendRedirect("/Free_b_l");
            else out.println("데이터가 입력되지 않았습니다.");

            st.close();
            con.close();
        }catch (SQLException e){ e.getMessage();}



%>
<br>
