<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-07-03
  Time: 오후 5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%@ page import="java.io.*, java.sql.*, java.net.*" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

String sr_addr = request.getParameter("addr");
String sql;
String zipcode, sido, gugun, dong, bunji, addr1, addr2;


    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false", "root", "1234");
        st = con.createStatement();
    } catch (SQLException e){out.println();}
%>

<html>
<head>
    <title> **우편번호 검색** </title>
    <script>
        function ch_zipcode(zip_no, address) {
            opener.join.zipcode1.value = zip_no.substring(0,3);
            opener.join.zipcode2.value = zip_no.substring(4,7);
            opener.join.address1.value = address;
            opener.join.address2.focus();
            self.close();
        }
    </script>
</head>
<body>
<form name="zipcode" method="post" action="/zipcode_sr">
    <table width="95%" border="1">
        <tr>
            <td align="center">
                찾고자하는 주소의 동/읍/면 이름을 입력하세요.<br>
                검색한 후 주소를 클릭하세요.
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="text" name="addr" maxlength="15" size="15">
                <input type="submit" value="검색">
            </td>
        </tr>
    </table>
</form>
<br>
<%
if (sr_addr!=null){
%>
<table border="1" align="center">
    <tr>
        <td width="25%">우편번호</td>
        <td width="75%">주소</td>
    </tr>
    <tr><td colspan="2"></td></tr>
    <%
        try {
            sql = "select * from zipcode where dong like '%"+sr_addr+"%'";
            rs = st.executeQuery(sql);
            while (rs.next()){
                zipcode = rs.getString("zipcode");
                sido = rs.getString("sido");
                gugun = rs.getString("gugun");
                dong = rs.getString("dong");
                bunji = rs.getString("bunji");
                addr1 = sido+ " " +gugun+ " " +dong+ " " +bunji;
                addr2 = sido+ " " +gugun+ " " +dong;

    %>
    <tr>
        <td width="25%" align="center" bgcolor="white"><a href="javascript:ch_zipcode('<%=zipcode%>','<%=addr2%>')"><%=zipcode%></a></td>
        <td width="75" align="center" bgcolor="white"><a href="javascript:ch_zipcode('<%=zipcode%>','<%=addr2%>')"><%=addr1%></a> </td>
    </tr>
    <%}%>
</table>
<%
        rs.close();
    }catch (SQLException e){} finally {
        con.close();
    }
    }
%>
</body>
</html>
