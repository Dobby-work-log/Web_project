<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-30
  Time: 오후 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Vector" %>
<html>
<head>
    <title>Title</title>
    <style>
        td {width: 25%;}
    </style>
</head>
<body>
<h2 align="center"> 다이어리 </h2>

<%
    String username = (String) session.getAttribute("member_name");
    String userid = (String) session.getAttribute("member_id");

    if (userid ==null)
        out.println("<script> alert('로그인 후 이용해주세요'); history.go(-1); </script>");

    Vector name = new Vector();
    Vector email = new Vector();
    Vector inputdate = new Vector();
    Vector subject = new Vector();
    Vector content = new Vector();


    int where = 1;
    if (request.getParameter("go") != null){
        where = Integer.parseInt(request.getParameter("go"));
    }
    int next = where+1;
    int pre = where-1;
    int start = 0;
    int end = 0;
    int max = 3;
    int total_r = 0;
    int total_p = 0;

    String em = null;
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false", "root", "1234");
        st = con.createStatement();
        rs = st.executeQuery("select * from guestboard where name = '"+username+"' order by inputdate desc");

        if (!(rs.next())){
            out.println("블로그에 올린 글이 없습니다.");
        }else{
            do{
                name.addElement(rs.getString("name"));
                email.addElement(rs.getString("email"));
                inputdate.addElement(rs.getString("inputdate"));
                subject.addElement(rs.getString("subject"));
                content.addElement(rs.getString("content"));
            }while (rs.next());

            total_r= name.size();
            total_p = (total_r-1)/max +1;
            start = (where-1)*max;
            end = start+max-1;

            if (end >= total_r)
                end = total_r-1;

            for (int j = start; j<=end; j++){
%>
<table align="center" border="0" width="80%" cellpadding="0" cellspacing="0">
    <tr><td colspan="4" bgcolor="#ff8c00"></td></tr>
    <tr>
        <th bgcolor="#e9967a" align="center" colspan="4"><%= subject.elementAt(j)%></th>
    </tr>
    <tr><td colspan="4" bgcolor="#ff8c00"></td></tr>
    <tr bgcolor="#e6e6fa">
        <td>&nbsp;</td>
    <td>글쓴이: <%= name.elementAt(j)%>
    <% if (userid != null){%>
         (<%=userid%>)
        <%};%></td>
        <% String temp =(String)email.elementAt(j);
            em = (String) email.elementAt(j);
            if ((temp != null) && (!(temp.equals(""))))
                em = "<a href = mail to:" + temp + ">" + temp + "</a>";%>
    <td>E-mail: <%=em%></td>
        <td>작성일: <%=inputdate.elementAt(j)%></td>
    </tr>
    <tr><td colspan="4" bgcolor="#ff8c00"></td></tr>
    <tr><pre><td valign="top" bgcolor="#faebd7" align="left" height="120" colspan="4"> <%=content.elementAt(j)%></td></pre></tr>
</table>
<%}
        }
        rs.close();
        st.close();
        con.close();
    }catch (SQLException e){ out.println(e);}
    %>
<div align="center">
<%

    if (where >1){
        out.println("<a href=\"/blog?go=1\">[처음]</a>");
        out.println("<a href=\"/blog?go="+pre+"\">[이전]</a>");
    }else {
        out.println("[처음]");
        out.println("[이전]");
    }

    if (where < total_p){
        out.println("<a href=\"/blog?go="+next+"\">[다음]</a>");
        out.println("<a href=\"/blog?go="+total_p+"\">[마지막]</a>");
    }else {
        out.println("[다음]");
        out.println("[마지막]");
    }

    out.println(where+"/"+total_p);
%>
<br>
<a href="/blog/write">글쓰기</a></div>
</body>
</html>
