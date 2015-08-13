<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>考试系统</title>
    <link rel="icon" href="exam.ico" />
    <link href="Mystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #div1
        {
        	 top:20px;
    	     left:300px;
    	     position:fixed;
        	}
    .style0
    {
    	background-image:url(Image/login.gif);
    	width:700px;
    	height:550px;
  
    	
    	}
        .style1
        {
            width: 80px;
        }
        .style2
        {
            width: 67px;
        }
        .style3
        {
            width:60px;
            height: 25px;
        }
        .style4
        {
            width: 69px;
            height: 25px;
        }
        .style5
        {
            height: 25px;
            
        }
        .style6
        {
            width: 67px;
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<br />
        <br />
        <div class="style0" id="div1">
        <table align="center">

            <tr>
                <td class="style1"></td>
                <td colspan="5" height="181px">&nbsp;</td>
            </tr>

            <tr>
                <td class="style3"></td>
                <td class="style4">
                    <div align="center"><b>账 号：</b></div>    
                </td>
                <td colspan="2" style="text-align: left" class="style5">
                    <asp:TextBox ID="txtNum" runat="server" Height="17px" Width="125px" BorderWidth="1" BorderColor="#666666"></asp:TextBox>&nbsp;
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNum"
                        Display="Dynamic" ErrorMessage="请输入账号" ForeColor="DarkGray" Font-Size="10pt"><b>*</b>
                        </asp:RequiredFieldValidator>&nbsp;
                        </td>
            </tr>

            <tr>
                <td height="20px" class="style1">&nbsp;
                    </td>
                <td height="22px" style="width: 69px">
                    <div align="center">
                   <b> 密 码：</b></div>
                </td>
                <td colspan="2" height="25px" style="text-align: left">
                    <asp:TextBox ID="txtPwd" runat="server" MaxLength="12" TextMode="Password" Width="125px" Height="17px"
                     BorderWidth="1" BorderColor="#666666"></asp:TextBox>&nbsp;
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd"
                        Display="Dynamic" ErrorMessage="密码不能为空" ForeColor="DimGray" Font-Size="10pt"><b>*</b></asp:RequiredFieldValidator>&nbsp;
                        </td>
            </tr>

            <tr>
                <td height="20px" class="style1">&nbsp;
                    </td>
                <td height="22px" style="width: 69px">
                    <div align="center">
                       <b> 身 份：</b></div>
                </td>
                <td colspan="2" height="25px" style="text-align: left">
                    <asp:DropDownList ID="ddlstatus" runat="server" >
                        <asp:ListItem Selected="True">学生</asp:ListItem>
                        <asp:ListItem>教师</asp:ListItem>
                        <asp:ListItem>管理员</asp:ListItem>
                    </asp:DropDownList>&nbsp;</td>
                <td height="25px" class="style2">&nbsp;
                    </td>
            </tr>
            <tr>
                <td height="20px" class="style1">&nbsp;
                    </td>
                <td height="22px" style="width: 69px">
                    <div align="center">
                    <b>验证码：</b></div>
                </td>
                <td height="20px">
                    <asp:TextBox ID="txtCode" runat="server" Height="19px" Width="60px" BorderWidth="1" BorderColor="#666666"></asp:TextBox>
                    <asp:Image ID="Image1" runat="server" Width="56px"   Height="17px" ImageUrl="~/Image.aspx" />&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCode"
                        Display="Dynamic" ErrorMessage="请输入验证码" ForeColor="DimGray" Font-Size="10pt">*</asp:RequiredFieldValidator>&nbsp;
                        </td>
            </tr>
            <tr>
                <td colspan="5" height="25px" style="text-align: center">
                   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<asp:Button ID="btnlogin" runat="server" Text="登录" OnClick="btnlogin_Click" />
                    &nbsp; &nbsp;<asp:Button ID="btnconcel" runat="server" Text="取消" OnClick="btnconcel_Click" CausesValidation="False" />
                    </td>
                    </tr>
                    <tr>
                    
                     <td colspan="5" height="22px" style="text-align: center">&nbsp;
                     <b>注：学生登录账号为学号，初始密码为学号后四位</b></td>
            </tr>
            <tr>
                <td colspan="5">&nbsp;
                    </td>
            </tr>
        </table>
        </div>
        <br />
        <br />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" />
    </form>
</body>
</html>
