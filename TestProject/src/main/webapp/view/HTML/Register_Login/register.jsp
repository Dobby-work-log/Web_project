<%--
  Created by IntelliJ IDEA.
  User: ���³���
  Date: 2020-06-29
  Time: ���� 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=euc-kr" language="java" %>
<html>
<head>
    <title>** ȸ�� ���� ������ **</title>
    <script>
        function open_brwindow(Url,winName,features) {
        form  = document.join;
        if (winName === "userid_ck"){
            if (!checkValue(form.userid, '���̵�', 5, 15)){
                return;
            }
            if (form.userid == null){
                alert("���̵� �Է����ּ���.");
                return;
            }
            Url = Url+"?userid="+form.userid.value;
        }else if (winName == "security_ck"){

            if (form.securitynum1.value == null || form.securitynum2.value ==null){
                alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���.");
                return;
            }
            Url = Url+"?securitynum="+form.securitynum1.value+"-"+form.securitynum2.value;
        }
        window.open(Url,winName,features);
        }

        function checkValue(target,cmt,min, max) {
        var alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var digit = '1234567890';
        var astr = alpha + digit;
        var i;

        var tvalue = target.value;
        if (tvalue.length < min || tvalue.length > max) {
            if (min == max) alert(cmt + '��' + min + 'byte�̾�� �մϴ�.');
            else alert(cmt + '��' + max + 'byte �̳��� �Է��ؾ� �մϴ�.');
            target.focus();
            return false;
        }
        if (astr.length > 1){
            for (i=0;i<tvalue.length; i++){
                if (astr.indexOf(tvalue.substring(i,i+1))<0){
                    alert(cmt+'�� ����� �� ���� ���ڰ� �ԷµǾ����ϴ�.');
                    target.focus();
                    return false;
                }
            }
        }
        return true;
        }

        function security_ck(s1,s2) {
        var  re = new RegExp(/\d{6}(\-|)[1-4]\d{6}S/);
        var secunum = s1+"-"+s2;
        return re.test(secunum);
        }

        function security_cktype(s1,s2) {
            var n=2;
            var sum = 0;
            var c =0;

            for (var i=0;i<s1.length;i++){
                sum += parseInt(s1.substr(i,1)) * n++;
            }
            for (i=0;i<s2.length-1;i++){
                sum += parseInt(s2.substr(i,1)) * n++;

                if (n>9) n=2;
            }

            c = 11-sum%11;
            if (c=11) c=1;
            if (c=10) c=0;
            if (c!== parseInt(s2.substr(6,1))) return false;
            else  return true;

        }

        function doSubmit() {
            form = document.join;
            if(!form.userid.value){
                alert('���̵� �Է����� �ʾҽ��ϴ�.');
                form.userid.focus();
                return;
            }

            if (!form.username.value){
                alert('�̸��� �Է����� �ʾҽ��ϴ�.');
                form.username.focus();
                return;
            }

            if (!form.password1.value){
                alert('��й�ȣ�� �Է����� �ʾҽ��ϴ�.');
                form.password.focus();
                return;
            }

            if (form.password1.value !== form.password2.value){
                alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
                form.password1.value ="";
                form.password2.value ="";
                form.password1.focus();
                return;
            }

            if (form.userid.value == form.password1.value){
                alert('��й�ȣ�� ���̵�� �ٸ��� �Է��ϼ���.');
                form.password1.value ="";
                form.password2.value ="";
                form.password1.focus();
                return;
            }

            if (!checkValue(form.password1,'��й�ȣ',4,12)){
                return;
            }

            if (!form.securitynum1.value || ! form.securitynum2.value){
                alert('�ֹε�Ϲ�ȣ�� �Է����� �ʾҽ��ϴ�.');
                form.password.focus();
                return;
            }

            /*if (!security_cktype(form.securitynum1.value, form.securitynum2.value) || !security_ck(form.securitynum1.value, form.securitynum2.value)){
                alert('�߸��� �ֹε�Ϲ�ȣ�Դϴ�!');
                form.securitynum1.focus();
                return;
            }*/

            if (!form.email.value){
                alert('�̸����� �Է����� �ʾҽ��ϴ�.');
                form.email.focus();
                return;
            }

            if (!form.email.value.indexOf("@") < 0){
                alert('�̸��� �ּ� ������ Ʋ���ϴ�.');
                form.email.focus();
                return;
            }

            if (!form.email.value.indexOf(".") < 0){
                alert('�̸��� ������ �ּҰ� Ʋ���ϴ�.');
                form.email.focus();
                return;
            }

            if (!form.zipcode1.value || !form.zipcode2.value){
                alert('�����ȣ�� �Է����� �ʾҽ��ϴ�.');
                open_brwindow('/zipcode_sr','zipcode_sr','scrollbars=yes','width=500','height=250');
                return;
            }

            if (!form.address1.value){
                alert('�ּ�1�� �Է����� �ʾҽ��ϴ�.');
                open_brwindow('/zipcode_sr','zipcode_sr','scrollbars=yes','width=500','height=250');
                return;
            }

            if (!form.address2.value){
                alert('�ּ�2�� �Է����� �ʾҽ��ϴ�.');
                form.address2.focus();
                return;
            }
            form.submit();
        }
    </script>
    <style>
        td,tr { text-align: center;}
    </style>
</head>

<!------------------------------------------------------------------->


<body bgcolor="white" oncontextmenu="return false" onselect="return false" ondragstart="return false">
<form name="join" method="post" action="/register_ck">
<table border="1" align="center" cellspacing="0" cellpadding="5">
    <tr>
        <td width="15%" style="font-weight: bold">*���̵�</td>
        <td width="75%"><input type="text" name="userid" size="15" maxlength="15"> <input type="button" value="�ߺ�Ȯ��" onclick="open_brwindow('/userid_ck','userid_ck','width=300, height =200')"><p style="color: crimson">(����+���� 5~15�ڸ�)</p> <p style="color: brown">�ߺ�Ȯ�� ������ ���ľ� �մϴ�.</p>
        </td>
    </tr>
    <tr>
        <td width="15%" style="font-weight: bold">*��й�ȣ</td>
        <td width="75%">
            <input type="text" name="password1" size="12" maxlength="12">
            ��й�ȣ Ȯ�� <input type="text" name="password2" size="12" maxlength="12">
            <p>(����+���� 4~12�ڸ�)</p></td>
    </tr>
    <tr>
        <td width="15%"> *�̸� </td>
        <td width="75%"><input type="text" name="username" size="10" maxlength="10"></td>
    </tr>
    <tr>
        <td width="15%"> *�ֹε�Ϲ�ȣ </td>
        <td width="75%">
            <input type="text" name="securitynum1" size="6" maxlength="6"> - <input type="text" name="securitynum2" size="7" maxlength="7">
            <input type="button" value="�ߺ�Ȯ��" onclick="open_brwindow('/security_ck','security_ck','width=400, height=200')">
            <p style="color: brown;">�ߺ� Ȯ���� Ȯ�� �ʼ�.</p>
        </td>
    </tr>
    <tr>
        <td width="15%">*E-Mail</td>
        <td width="75%">
            <input type="text" name="email" size="20" maxlength="50">
        </td>
    </tr>
    <tr>
        <td width="15%">*�����ȣ</td>
        <td width="75%">
            <input type="text" name="zipcode1" size="3" maxlength="3"> - <input type="text" name="zipcode2" size="3" maxlength="3">
            <input type="button" value="�����ȣ �˻�" onclick="open_brwindow('/zipcode_sr','zipcode_sr','width=500,height=500')">
        </td>
    </tr>
    <tr>
        <td width="15%">*�ּ�</td>
        <td width="75%">
            <input type="text" name="address1" size="50" maxlength="100">
        </td>
    </tr>
    <tr>
        <td width="15%">������ �ּ�</td>
        <td width="75%">
            <input type="text" name="address2" size="50" maxlength="100">
            <p style="color: brown">������ �ּҵ� �������ּ���.</p>
        </td>
    </tr>
    <tr>
        <td width="15%">�ڵ���</td>
        <td width="75%">
            <select name="phone1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> -
            <input type="text" name="phone2" size="4" maxlength="4"> -
            <input type="text" name="phone3" size="4" maxlength="4">
        </td>
    </tr>
</table>
<br>
<table border="1" align="center" cellspacing="0" cellpadding="5">
    <tr>
        <td>
            <input type="hidden" name="userid_ck">
            <input type="button" value="�� ��" onclick="doSubmit()">
            <input type="reset" value="�ٽþ���">
            <input type="button" value="�� ��" onclick="javascript:history.go(-1)">
        </td>
    </tr>
</table>
</form>
</body>
</html>
