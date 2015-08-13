<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentChangePwd.aspx.cs" Inherits="student_studentChangePsw" %>

<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>考试系统</title>
     <link rel="icon" href="exam.ico" />
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    #div2
    {
    	top:50px;
    	
    	}
        .style2
        {
            width: 149px;
        }
        </style>
 <script type="text/javascript" language="javascript">
              function Sure() {
                  return confirm('确定要保存修改吗？');
              }
</script>
</head>
<body >
    <form id="form1" runat="server">
 <div style="text-align: center">
        
        <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0"
            width="278px">
            <tr>
                <td colspan="6" style="height: 47px">
                    <uc2:Header1 ID="Header1_1" runat="server" />
                </td>
            </tr>
             <tr style="height:40px">
            <td></td>
                <td class="style2" >
                   
                         <b>学号：</b>
              
                <asp:Label ID="lblNum" runat="server" ></asp:Label></td>
                <td >
                    
                        <b>姓名：</b>
               
        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                <td >
                    
                        <b>性别：</b>
          
        <asp:Label ID="lblsex" runat="server"></asp:Label>
        
        </td>
            </tr>
            </table>
            <div style=" width: 837px;">
             
            <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="278px">
            <tr>
            <td  style="text-align: center">

            

            <br />
            <br />
            <br />
            <br />
            <fieldset style="width: 344px; height: 178px; text-align: center">
            <legend class="mailTitle">学生修改密码</legend>
            <br />
            &nbsp;<br />
        <table align="center" border="0" cellpadding="0" cellspacing="0"  height="145px"
            width="316px">
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;输入旧密码：</td>
                <td width="281">
        <asp:TextBox ID="txtOldPwd" TextMode="Password" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;输入新密码：</td>
                <td>
        <asp:TextBox ID="txtNewPwd" TextMode="Password" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 220px; text-align: right">
                    &nbsp;重新输入新密码：</td>
                <td>
        <asp:TextBox ID="txtNewPwdA" TextMode="Password" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnchange" runat="server" OnClientClick="return Sure()" OnClick="btnchange_Click" Text="修改" />&nbsp;
                    <asp:Button ID="btncancel" runat="server" Text="返回" PostBackUrl="~/student/studentexam.aspx" />
                    </td>
            </tr>
        </table>
        </fieldset>
            
            </td>
            </tr>

             

            </table>
            
             </div>
             <br /><br /><br /><br />
            <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0"
            width="278px">
             <tr>
                <td colspan="6" height="36px">
                    <uc1:Footer ID="Footer1" runat="server"  />
                </td>
            </tr>
        </table>
    
 </div>
    </form>
</body>
</html>
