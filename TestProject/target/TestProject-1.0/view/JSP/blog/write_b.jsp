<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-28
  Time: ���� 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%request.setCharacterEncoding("euc-kr");%>
<%

    String userid = (String) session.getAttribute("member_id");
    String username = (String) session.getAttribute("member_name");
    String email = (String) session.getAttribute("member_email");

    if (userid ==null)
        out.println("<script> alert('�α��� �� �̿����ּ���'); history.go(-1); </script>");
%>
<html>
<head>
    <title>Title</title>
    <script>
        function ch() {
            form = document.file_w
            with (form) {
                if (form.subject.value.lenght === 0){
                    alert("������ �Է��� �ּ���.");
                    subject.focus();
                    return false;
                }
                form.submit();
            }
        }
    </script>
    <style>
        td {width: 25%; text-align: center;}
    </style>
</head>
<body>
<h2> ��α� </h2>
<form name="file_w" method="post" action="/blog/save">
    <table align="center" cellspacing="0" cellpadding="2">
        <tr><td colspan="4" bgcolor="#1e90ff"></td></tr>
        <tr>
            <td colspan="4" align="center" bgcolor="#faebd7"> �� �� ��</td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td></tr>
        <tr>
            <td bgcolor="#faebd7">�� ��</td>
            <td><input type="text" name="username" value="<%=username%>" readonly></td>
            <td bgcolor="#faebd7"> E-mail </td>
            <td><input type="text" name="email" value="<%=email%>" readonly></td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td></tr>
        <tr>
            <td bgcolor="#faebd7"> �� �� </td>
            <td colspan="3">
                <input type="text" name="subject" size="70" maxlength="70">
            </td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td> </tr>
        <tr>
            <td bgcolor="#faebd7"> �� �� </td>
            <td colspan="3" valign="top">
                <textarea cols="65" rows="10" name="content" maxlength="2000"></textarea>
            </td>
        </tr>
        <tr><td colspan="4" bgcolor="#1e90ff"></td></tr>
        <tr>
            <td colspan="2"></td>
            <td align="right"><a href="/blog"> ��α����� ���ư��� </a></td>
            <td align="right"><a href="#" onclick="ch(this.form);"> �� �ø��� </a></td>
        </tr>
    </table>
</form>
</body>
</html>