<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-30
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
String userid = request.getParameter("userid");
String sql;

int ck_cmt=0;

Connection con = null;
Statement st = null;
ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false","root" , "1234");
        st = con.createStatement();

        sql = "select count(*) as count from member where userid= '"+userid+"' ";
        rs = st.executeQuery(sql);
        rs.next();
        ck_cmt = rs.getInt("count");
        rs.close();
    }catch (SQLException e){ out.println(e);}finally {
        con.close();
    }
%>

<html>
<head>
    <title>아이디 중복검사</title>
    <script>
        function ck_end() {
            var form = document.id_ck;
            opener.join.userid.value = form.userid.value;
            opener.document.getElementsByName("userid_ck").value = form.ck_cmt.value; // 이건 뭔 값을 넘기라는 건지 모르겠다. 필요한걸까.
            self.close();
        }

        function doCk() {
        var form = document.id_ck;
        if (!checkValue(form.userid, '아이디',5,15)){
            return;
        }
        form.submit();
        }

        function checkValue(target,cmt,min, max) {
            var alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            var digit = '1234567890';
            var astr = alpha + digit;
            var i;

            var tvalue = target.value;
            if (tvalue.length < min || tvalue.length > max) {
                if (min == max) alert(cmt + '는' + min + 'byte이어야 합니다.');
                else alert(cmt + '는' + max + 'byte 이내로 입력해야 합니다.');
                target.focus();
                return false;
            }
            if (astr.length > 1){
                for (i=0;i<tvalue.length; i++){
                    if (astr.indexOf(tvalue.substring(i,i+1))<0){
                        alert(cmt+'에 허용할 수 없는 문자가 입력되었습니다.');
                        target.focus();
                        return false;
                    }
                }
            }
            return true;
        }
    </script>
</head>
<body>
<form name="id_ck" method="post" action="/userid_ck">
    <input type="hidden" name="ck_cmt" value="<%=ck_cmt%>">
    <table align="center" width="300">
        <tr>
            <td> 원하는 아이디를 입력하세요.</td>
        </tr>
        <tr></tr>
        <tr>
            <td>
                <input type="text" name="userid" value="<%=userid%>" onfocus="this.value =''" maxlength="15" size="15">
                <input type="button" value="중복확인" onclick="doCk()">
            </td>
        </tr>
        <tr>
            <td>
                <% if(ck_cmt >0) {%>
                [<%=userid%>은 등록되어있는 아이디입니다. <br> 다시 시도해주세요.]
                <%} else {%>
                [<%=userid%>은 사용이 가능합니다.]

                <%}%>
            </td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td> <input type="button" value="확인" onclick="ck_end()"></td>
        </tr>
    </table>
</form>
</body>
</html>