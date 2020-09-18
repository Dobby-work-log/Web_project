<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-19
  Time: 오후 6:39
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
        <td><a href="/Free_b_l" target="mainFrame"> 게시판 </a></td>
        <td><a href="/blog" target="mainFrame"> 블로그 </a></td>
    </tr>
</table>
</div>
<%
    if (mem_id == null) {
%>
<script>
    function login_ck() {
        if (!document.login.userid.value){
            alert("ID를 입력하세요.");
            document.login.userid.focus();
            return;
        }
        if (!document.login.password.value){
            alert("비밀번호를 입력하세요.");
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
            <td align="center"> 회원 ID: </td>
            <td align="center"><input type="text" maxlength="16" name="userid" size="10" class="input_s1"></td>
            <td align="center"> Password: </td>
            <td align="center"><input type="password" size="10" name="password" class="input_s1" maxlength="12"></td>
            <td><a href="javascript:login_ck()">로그인</a>
            </td>
            <td>
                <a href="/register_form" target="mainFrame">회원가입</a>
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
        <td colspan="2" align="center"><p style="display: inline; color: white"><%=mem_name%></p>님 환영합니다.</td>
        <td>&nbsp;</td>
        <td colspan="2" align="center"><a href="/logout">로그아웃</a>  <a href="personal_info" target="mainFrame" >마이 페이지</a> </td>
        <% if (mem_id == "manager") {%>
        <td colspan="2" align="center"><a href="/admin" target="mainFrame"> 관리자 페이지</a></td>
        <%}%>
    </tr>
</table>
    </div>
</form>
<%} %>