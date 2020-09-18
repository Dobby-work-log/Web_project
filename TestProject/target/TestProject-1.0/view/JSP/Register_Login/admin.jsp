<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-26
  Time: 오후 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
String adpw = "manager";
String password = request.getParameter("password");

if (adpw.equals(password))
    response.sendRedirect(response.encodeRedirectURL("/admin/show"));
else {
%>
<script>
    alert("관리자만 접근할 수 있습니다. 확인버튼을 누르세요.");
</script>
<html>
<head>
    <title>회원 정보관리</title>
</head>
<body>
<table width="500" border="1" align="center" cellspacing="0" cellpadding="0">
    <th> 관리자 승인</th>
    <tr>
        <td align="center">
            <form name="form1" method="post" action="/admin">
                관리자 비밀번호: <input type="password" name="password"><br>
                <input type="submit" name="change" value="확 인"> &nbsp; <input type="button" value="취 소" onclick="history.go(-1);">
            </form>
        </td>
    </tr>
</table>
</body>
</html>
<%}%>