<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-09-08
  Time: 오후 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<html>
<head>
    <title>Title</title>
    <style>
        td {text-align: center;}
    </style>
</head>
<body>
<table align="center" border="0" width="65%" cellpadding="0" cellspacing="0">
    <tr align="center">
        <td colspan="5" bgcolor="#ff8c00"></td>
    </tr>
    <tr bgcolor="#e9967a">
        <td><b>번 호</b></td>
        <td><b>제 목</b></td>
        <td><b>등록자</b></td>
        <td><b>날 짜</b></td>
        <td><b>조 회</b></td>
    </tr>
    <tr align="center">
        <td colspan="5" bgcolor="#ff8c00"></td>
    </tr>

    <%
        Vector name = new Vector();
        Vector inputdate = new Vector();
        Vector email = new Vector();
        Vector subject = new Vector();
        Vector rcount = new Vector();
        Vector id = new Vector();

        int where =1;

        int total_g=0;
        int max_p=2;
        int start_p=1;
        int end_p = max_p + start_p-1;
        int where_g = 1;

        if (request.getParameter("go") != null){
            where = Integer.parseInt(request.getParameter("go"));
            where_g = (where-1)/max_p +1;
            start_p= (where_g-1)*max_p +1;
            end_p = start_p+max_p-1;
        }else if (request.getParameter("gogroup") != null){
            where_g = Integer.parseInt(request.getParameter("gogroup"));
            start_p= (where_g-1) * max_p+1;
            where = start_p;
            end_p = start_p+max_p-1;
        }

        int next_g = where+1;
        int prior_g  = where_g-1;

        int start_r = 0;
        int end_r =0;
        int max_r = 5;
        int total_r= 0;
        int total_p=0;


        String em =null;
        Connection con =null;
        Statement st =null;
        ResultSet rs =null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (ClassNotFoundException e){
            out.println(e);
        }

        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false", "root", "1234");
            st = con.createStatement();
            String sql = "select * from freeboard order by id desc";
            rs = st.executeQuery(sql);

            if (!(rs.next())){
                out.println("");
            }else {
                do {
                    id.addElement(rs.getInt("id"));
                    name.addElement(rs.getString("q_name"));
                    email.addElement(rs.getString("q_email"));
                    String idate = rs.getString("q_inputdate");
                    idate = idate.substring(0,8);
                    inputdate.addElement(idate);
                    subject.addElement(rs.getString("q_subject"));
                    rcount.addElement(rs.getInt("readcount"));
                }while (rs.next());

                total_r = name.size();
                total_p = (total_r-1)/max_r +1;
                start_r = (where-1) * max_r;
                end_r = start_r+max_r-1;

                if (end_r >= total_r)
                    end_r = total_r-1;

                total_g = (total_p-1)/max_p +1;
                if (end_p > total_p)
                    end_p = total_p;

                for (int j=start_r;j<=end_r;j++){
                    String temp = (String)email.elementAt(j);
                    if (temp == null || temp.equals(""))
                        em = (String)name.elementAt(j);
                    else
                        em = "<a href =mailto:" + temp + ">" +name.elementAt(j) + "</a>";

                    if (j%2 == 0){
                        %>
                    <tr bgcolor="white" onmouseover="this.style.backgroundColor='#b0e0e6'" onmouseout="this.style.backgroundColor='white'">
    <%
                    } else {
                        %>
    <tr bgcolor="#f4f4f4" onmouseover="this.style.backgroundColor='#DFEDFE'" onmouseout="this.style.backgroundColor='#f4f4f4'">
    <% } %>
    <td><%=id.elementAt(j)%></td>
    <td><a href="/Free_b_r?id=<%=id.elementAt(j)%>&page=<%=where%>"><%=subject.elementAt(j)%></a></td>
    <td><%=em%></td>
    <td><%=inputdate.elementAt(j)%></td>
    <td><%=rcount.elementAt(j)%></td>
</tr>
    <%}
                rs.close();
            }
    %>
</table>
<div align="center">
    <%
            st.close();
            con.close();
        }catch (SQLException e){ out.println(e);}

        if (where_g > 1){
    %>
<a href="/Free_b_l?gogroup=1">[처음]</a>
<a href="/Free_b_l?gogroup=<%=prior_g%>">[이전]</a>

<%} else {
            out.println("[처음]");
            out.println("[이전]");
}
if (name.size() != 0){
    for (int a = start_p; a<= end_p; a++){
        if (a==where)
            out.println("["+a+"]");
        else
            out.println("<a href='/Free_b_l?go="+a+"'>"+a+"</a>");
    }
}

if (where_g < total_g){
    out.println("<a href = '/Free_b_l?gogroup='"+next_g+">[다음]</a>");
    out.println("<a href = '/Free_b_l?gogroup='"+total_g+">[마지막]</a>");
}else {
    out.println("[다음]");
    out.println("[마지막]");
}

out.println("<br> 전체 글 수 :"+total_r);
%>
</div>
<table align="center" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center"><a href="/Free_b_w">글 쓰기</a></td>
    </tr>
</table>

</body>
</html>
