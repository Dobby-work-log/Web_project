<%--
  Created by IntelliJ IDEA.
  User: 나뮤나뮤
  Date: 2020-06-26
  Time: 오후 6:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
 <table border="1" align="center">
     <tr>
         <td> 에러 페이지 </td>
     </tr>
     <tr><td> 시스템에 문제가 발생하였습니다. </td></tr>
     <tr><td> 에러 내용: <%=exception.getMessage()%></td></tr>
 </table>
</body>
</html>
