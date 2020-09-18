<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-07-06
  Time: 오후 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%@ page import="java.sql.*, java.io.*, java.net.*, java.util.*, java.text.*" %>
<%request.setCharacterEncoding("euc-kr");%>
<% String mode = request.getParameter("mode");
String userid = (String)session.getAttribute("member_id");


    Connection con =null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement psmt = null;

    String username = request.getParameter("username");
    String password = request.getParameter("password1");
    String security_num1 = request.getParameter("securitynum1");
    String security_num2 = request.getParameter("securitynum2");
    String email = request.getParameter("email");
    String zipcode1 = request.getParameter("zipcode1");
    String zipcode2 = request.getParameter("zipcode2");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");

    String sql = null;
    StringTokenizer st_securitynum = null;
    StringTokenizer st_zipcode = null;
    StringTokenizer st_phone = null;


    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
        st = con.createStatement();

        if (mode.equals("null") || mode.equals("modify")){
            sql = "select * from member where userid= '"+userid+"'";
            rs = st.executeQuery(sql);

            if (rs.next()){
                username = rs.getString("username");
                password = rs.getString("password");

                st_securitynum = new StringTokenizer(rs.getString("security_num"),"-");
                email = rs.getString("email");
                st_zipcode = new StringTokenizer(rs.getString("zipcode"),"-");
                address1= rs.getString("address1");
                address2 = rs.getString("address2");
                st_phone = new StringTokenizer(rs.getString("phone_num"),"-");

                if (st_securitynum.hasMoreTokens()){
                    security_num1 = st_securitynum.nextToken();
                }
                if (st_securitynum.hasMoreTokens()){
                    security_num2 = st_securitynum.nextToken();
                }

                if (st_zipcode.hasMoreTokens()){
                    zipcode1 = st_zipcode.nextToken();
                }
                if (st_zipcode.hasMoreTokens()){
                    zipcode2 = st_zipcode.nextToken();
                }

                if (st_phone.hasMoreTokens()){
                    phone1 = st_phone.nextToken();
                }
                if (st_phone.hasMoreTokens()){
                    phone2 = st_phone.nextToken();
                }
                if (st_phone.hasMoreTokens()){
                    phone3 = st_phone.nextToken();
                }
            }
            rs.close();
            mode = "update";
        }
    }catch (SQLException e){} finally {
        con.close();
    }

%>
<html>
<head>
    <h3 align="center">** 회원 정보 수정 **</h3>
    <script>
        function open_brwindow(Url,winName,features) {
            window.open(Url,winName,features);
        }

        function doSubmit() {
            form = document.modi;

            form.submit();
        }
    </script>
</head>
<body>
<form name="modi" method="post" action="/modify_process">
    <table border="1" align="center">
        <tr>
            <td width="15%" >아이디</td>
            <td width="75%"><input type="text" name="userid" size="15" maxlength="15" value="<%=userid%>" readonly>
        </tr>
    <tr>
        <td width="15%">*비밀번호</td>
        <td width="75%">
            <input type="text" name="password1" size="12" maxlength="12" value="<%=password%>">
            비밀번호 확인 <input type="text" name="password2" size="12" maxlength="12" value="<%=password%>">
            <p>(영문+숫자 4~12자리)</p></td>
    </tr>
    <tr>
        <td width="15%"> *이름 </td>
        <td width="75%"><input type="text" name="username" size="10" maxlength="10" value="<%=username%>"></td>
    </tr>
    <tr>
        <td width="15%"> 주민등록번호 </td>
        <td width="75%">
            <input type="text" name="securitynum1" size="6" maxlength="6" value="<%=security_num1%>" readonly> - <input type="text" name="securitynum2" size="7" maxlength="7" value="<%=security_num2%>" readonly>
        </td>
    </tr>
    <tr>
        <td width="15%">*E-Mail</td>
        <td width="75%">
            <input type="text" name="email" size="20" maxlength="50" value="<%=email%>">
        </td>
    </tr>
    <tr>
        <td width="15%">우편번호</td>
        <td width="75%">
            <input type="text" name="zipcode1" size="3" maxlength="3" value="<%=zipcode1%>" readonly> - <input type="text" name="zipcode2" size="3" maxlength="3" value="<%=zipcode2%>" readonly>
            <input type="button" value="우편번호 검색" onclick="open_brwindow('/zipcode_sr','zipcode_sr','width=500,height=500')">
        </td>
    </tr>
    <tr>
        <td width="15%">주소</td>
        <td width="75%">
            <input type="text" name="address1" size="50" maxlength="100" value="<%=address1%>" readonly>
        </td>
    </tr>
    <tr>
        <td width="15%">*나머지 주소</td>
        <td width="75%">
            <input type="text" name="address2" size="50" maxlength="100" value="<%=address2%>">
            <p style="color: brown">나머지 주소도 기입해주세요.</p>
        </td>
    </tr>
    <tr>
        <td width="15%">*핸드폰</td>
        <td width="75%">
            <input type="text" name="phone1" size="4" maxlength="4" value="<%=phone1%>"> -
            <input type="text" name="phone2" size="4" maxlength="4" value="<%=phone2%>"> -
            <input type="text" name="phone3" size="4" maxlength="4" value="<%=phone3%>">
        </td>
    </tr>
        <tr>
            <td bgcolor="#ff7f50">&nbsp;</td>
            <td bgcolor="#deb887">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="mode" value="update">
                <input type="button" value="확 인" onclick="doSubmit()">&nbsp;
                <input type="button" value="취 소" onclick="history.go(-1);">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
