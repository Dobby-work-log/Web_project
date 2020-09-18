<%--
  Created by IntelliJ IDEA.
  User: Namoo
  Date: 2020-07-28
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%request.setCharacterEncoding("euc-kr");%>
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
        function ch() {
            form = document.file_w
            with (form) {
                if (form.subject.value.lenght === 0){
                    alert("제목을 입력해 주세요.");
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
<h2> 블로그 </h2>
<form name="file_w" method="post" action="/blog/save">
    <table align="center" cellspacing="0" cellpadding="2">
        <tr><td colspan="4" bgcolor="#1e90ff"></td></tr>
        <tr>
            <td colspan="4" align="center" bgcolor="#faebd7"> 글 쓰 기</td>
        </tr>
        <tr><td colspan="4" bgcolor="#5f9ea0"></td></tr>
        <tr>
            <td bgcolor="#faebd7">이 름</td>
            <td><input type="text" name="username" value="<%=username%>" readonly></td>
            <td bgcolor="#faebd7"> E-mail </td>
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
            <td colspan="2"></td>
            <td align="right"><a href="/blog"> 블로그으로 돌아가기 </a></td>
            <td align="right"><a href="#" onclick="ch(this.form);"> 글 올리기 </a></td>
        </tr>
    </table>
</form>
</body>
</html>