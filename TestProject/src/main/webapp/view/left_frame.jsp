<%--
  Created by IntelliJ IDEA.
  User: ���³���
  Date: 2020-06-19
  Time: ���� 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%@ page info="left_Frame" %>
<% request.setCharacterEncoding("euc-kr");%>
<%
    Object mem_name = session.getAttribute("member_name");
    Object mem_id = session.getAttribute("member_id");
%>
<div style="float: left;">
<table>
    <tr>
        <td><a href="main_frame" target="mainFrame"> Home </a></td>
        <td><a href="/Free_b_l" target="mainFrame"> �Խ��� </a></td>
        <td><a href="/blog" target="mainFrame"> ��α� </a></td>
    </tr>
</table>
</div>
<%
    if (mem_id == null) {
%>
<script>
    function login_ck() {
        if (!document.login.userid.value){
            alert("ID�� �Է��ϼ���.");
            document.login.userid.focus();
            return;
        }
        if (!document.login.password.value){
            alert("��й�ȣ�� �Է��ϼ���.");
            document.login.password.focus();
            return;
        }
        document.login.submit();


    }
</script>
<style>
    td,tr { text-align: center;}
</style>
<form name="login" method="post" action="/login_process">
    <div style="float: right;">
    <table>
        <tr>
            <td align="center"> ȸ�� ID: </td>
            <td align="center"><input type="text" maxlength="16" name="userid" size="10" class="input_s1"></td>
            <td align="center"> Password: </td>
            <td align="center"><input type="password" size="10" name="password" class="input_s1" maxlength="12"></td>
            <td><a href="javascript:login_ck()">�α���</a>
            </td>
            <td>
                <a href="/register_form" target="mainFrame">ȸ������</a>
            </td>
        </tr>
    </table>
    </div>
</form>
<% }
    else {
%>
<form method="post" action="main_frame">
    <div style="float: right">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td colspan="2" align="center"><p style="display: inline; color: white"><%=mem_name%></p>�� ȯ���մϴ�.</td>
        <td>&nbsp;</td>
        <td colspan="2" align="center"><a href="/logout">�α׾ƿ�</a>  <a href="personal_info" target="mainFrame" >���� ������</a> </td>
        <% if (mem_id == "manager") {%>
        <td colspan="2" align="center"><a href="/admin" target="mainFrame"> ������ ������</a></td>
        <%}%>
    </tr>
</table>
    </div>
</form>
<%} %>