<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-26
  Time: 오후 6:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.text.*" %>

<%
session =request.getSession(false);
session.invalidate();
%>
<script>
    parent.location.href="/"
</script>
