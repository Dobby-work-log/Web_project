<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-09-04
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" language="java" %>
<%

    String userid = (String) session.getAttribute("member_id");
    String username = (String) session.getAttribute("member_name");
    String email = (String) session.getAttribute("member_email");

    if (userid ==null)
        out.println("<script> alert('로그인 후 이용해주세요'); history.go(-1); </script>");

%>
<html>
<head>
    <title>Title</title>
    <script>
        function ck() {
            with (document.FB_w) {
                if (subject.value.length===0){
                    alert("제목을 입력해주세요.");
                    subject.focus();
                    return false;
                }

                if (pw.value.length===0){
                    alert("암호를 입력해주세요.");
                    pw.focus();
                    return false;
                }
                if (content.value.length===0){
                    alert("내용을 입력해주세요.");
                    content.focus();
                    return false;
                }
                document.FB_w.submit();
            }
        }
    </script>
</head>
<body>
<form name="FB_w" method="post" action="/Free_b_s">
    <table align="center"  cellspacing="0" cellpadding="2">
        <tr><td colspan="4" bgcolor="#1e90ff"></td></tr>
        <tr>
            <td colspan="4" align="center" bgcolor="#faebd7"><b> 게 시 판</b> </td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td></tr>
        <tr>
            <td bgcolor="#faebd7">이 름</td>
            <td><input type="text" name="username" value="<%=username%>" readonly></td>
            <td bgcolor="#faebd7">E-mail</td>
            <td><input type="text" name="email" value="<%=email%>" readonly></td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td></tr>
        <tr>
            <td bgcolor="#faebd7"> 제 목 </td>
            <td colspan="3">
                <input type="text" name="subject" size="70" maxlength="70">
            </td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td> </tr>
        <tr>
            <td bgcolor="#faebd7"> 내 용 </td>
            <td colspan="3" valign="top">
                <textarea cols="65" rows="10" name="content" maxlength="2000"></textarea>
            </td>
        </tr>
        <tr><td colspan="4" bgcolor="#1e90ff"></td></tr>
        <tr>
            <td bgcolor="#faebd7"> 암 호 </td>
            <td><input type="password" name="pw"></td>
            <td colspan="2"></td>
        </tr>
    </table>
    <br>
    <table align="center">
        <tr>
            <td align="center"><a href="#" onclick="history.go(-1)">취 소</a> </td>
            <td align="center"><a href="#" onclick="ck();">확 인</a></td>
        </tr>
    </table>
</form>
</body>
</html>
