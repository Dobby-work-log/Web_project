<%--
  Created by IntelliJ IDEA.
  User: ���³���
  Date: 2020-07-06
  Time: ���� 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<%@ page import="java.sql.*, java.text.*, java.util.*" %>
<%request.setCharacterEncoding("euc-kr");%>
<%
String userid = request.getParameter("userid");
String username = request.getParameter("username");
String password = request.getParameter("password1");
String security_num1 = request.getParameter("securitynum1");
String security_num2 = request.getParameter("securitynum2");
String security_num = security_num1+"-"+security_num2;
String email = request.getParameter("email");
String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone_num = phone1+"-"+phone2+"-"+phone3;

String sql;
Connection con = null;
Statement st = null;
PreparedStatement pstm = null;

java.util.Date yymmdd = new java.util.Date();
SimpleDateFormat df = new SimpleDateFormat("yy-MM-d h:mm a");
String regdate = df.format(yymmdd);

    try {
        Class.forName("com.mysql.jdbc.Driver");
    }catch (ClassNotFoundException e){
        out.println(e);
    }

    try {
        con = DriverManager.getConnection("jdbc:mysql://localhost/project?useSSL=false", "root", "1234");
        st = con.createStatement();
        sql = "insert into member values (?,?,?,?,?,?,?,?,?,?)";
        pstm = con.prepareStatement(sql);
        pstm.setString(1, userid);
        pstm.setString(2, username);
        pstm.setString(3,password);
        pstm.setString(4, security_num);
        pstm.setString(5,email);
        pstm.setString(6,zipcode1+"-"+zipcode2);
        pstm.setString(7,address1);
        pstm.setString(8,address2);
        pstm.setString(9,phone_num);
        pstm.setString(10,regdate);
        pstm.executeUpdate();
    } catch (SQLException e){out.println("<script>alert('����ó���� ���� �ʾҽ��ϴ�. �ٽ� �õ����ּ���.'); history.back(); </script>");
    }finally {
        con.close();
    }
%>
<html>
<head>
    <style>
        td,tr { text-align: center;}
    </style>
</head>
<body>
<h3 align="center">��ȸ�������� ���������� �Ϸ�Ǿ����ϴ�.��</h3><br>
<form name="join" method="post">
    <input type="hidden" name="userid" value="<%=userid%>">
    <input type="hidden" name="mode" value="modify">
    <table width="500" border="1" align="center">
        </tr>
        <tr>
            <td width="25%">���̵�</td>
            <td width="75%"><%=userid%></td>
       </tr>
        <tr>
            <td width="25%">�̸�</td>
            <td width="75%"><%=username%></td>
        </tr>
        <tr>
            <td width="25%">��й�ȣ</td>
            <td width="75%">���Ȼ� �������� ����.</td>
        </tr>
        <tr>
            <td width="25%">�ֹε�Ϲ�ȣ</td>
            <td width="75%"><%=security_num%></td>
        </tr>
        <tr>
            <td width="25%">email</td>
            <td width="75%"><%=email%></td>
        </tr>
        <tr>
            <td width="25%">�����ȣ</td>
            <td width="75%"><%=zipcode1+"-"+zipcode2%></td>
        </tr>
        <tr>
            <td width="25%">�ּ�1</td>
            <td width="75%"><%=address1%></td>
        </tr>
        <tr>
            <td width="25%">�ּ�2</td>
            <td width="75%"><%=address2%></td>
        </tr>
        <tr>
            <td width="25%">�ڵ���</td>
            <td width="75%">
                <% if (phone_num.equals("--")){
                    out.println("�Է����� �ʾҽ��ϴ�.");
                }else { out.println(phone_num);}%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" value="Ȯ ��" onclick="location='main_frame'">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
