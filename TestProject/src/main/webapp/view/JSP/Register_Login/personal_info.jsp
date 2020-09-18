<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-26
  Time: 오후 6:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
Object mem_id = session.getAttribute("member_id");
session.setAttribute(session.getId(), mem_id);
String userid = (String)session.getAttribute(session.getId());

if (userid ==null) session.setAttribute(session.getId(),mem_id);

String sql = "select * from member where userid = ?";

Connection con =null;
PreparedStatement prst = null;
ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
    }catch (SQLException e){ out.println(e);}

    try {
        prst = con.prepareStatement(sql);
        prst.setString(1, userid);
        rs = prst.executeQuery();

        if (!(rs.next())){
            out.println("해당되는 회원이 없습니다.");
        }else {
            String username = rs.getString("username");
            String phone = rs.getString("phone_num");
%>
<html>
<head>
    <title><%=mem_id%> 님의 개인 페이지</title>
    <style>
        tr,td {text-align: center;}
    </style>
</head>
<body>
<form name="change" action="/modify">
    <input type="hidden" name="userid" value="<%=userid%>">
    <input type="hidden" name="username" value="<%=username%>">

    <table border="1" width="60%" align="center">
        <tr><td colspan="2"> <%=mem_id%>의 마이페이지</td></tr>
        <tr>
            <td width="30%">아이디</td>
            <td width="70%"><%=userid%></td>
        </tr>
        <tr>
            <td width="30%">이름</td>
            <td width="70%"><%=username%></td>
        </tr>
        <tr>
            <td width="30%">비밀번호</td>
            <td width="70%">보안상 기재하지 않음</td>
        </tr>
        <tr>
            <td width="30%">주민등록번호</td>
            <td width="70%"><%=rs.getString("security_num")%></td>
        </tr>
        <tr>
            <td width="30%">E-Mail</td>
            <td width="70%"><%=rs.getString("email")%></td>
        </tr>
        <tr>
            <td width="30%">우편번호</td>
            <td width="70%"><%=rs.getString("zipcode")%></td>
        </tr>
        <tr>
            <td width="30%">주소 1</td>
            <td width="70%"><%=rs.getString("address1")%></td>
        </tr>
        <tr>
            <td width="30%">주소 2</td>
            <td width="70%"><%=rs.getString("address2")%></td>
        </tr>
        <tr>
            <td width="30%">전화번호</td>
            <td width="70%"><%
            if (phone.equals("--")){
                out.println(" ");
            }else { out.println(phone);}%></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="확 인" onclick="location='main_frame'">
                <input type="button" value="수 정" onclick="location='/modify?mode=modify'">
                <input type="button" value="회원 탈퇴" onclick="location='delete'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<%}
        rs.close();
        con.close();
        prst.close();
} catch (SQLException e){
        out.println(e);
}%>