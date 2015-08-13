<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentexam.aspx.cs" Inherits="student_studentexam" %>

<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
            width: 112px;
        }
        .style3
        {
            width: 110px;
        }
        </style>
</head>
<body >
    <form id="form1" runat="server">
 <div style="text-align: center">
       <fieldset style="width:840px; height:210px;text-align:center; border:1px; border-color:#220000">
        <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="278px"> 
            <tr>
                <td colspan="6" style="height: 47px">
                    <uc2:Header1 ID="Header1_1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="6" height="53px">
                    <asp:Image ID="Image1" runat="server" Height="53px" ImageUrl="~/Image/rule.gif"
                        Width="838px" /></td>
            </tr>
            <tr style="height:40px">
            <td></td>
                <td class="style2" >
                   
                         <b>学号：</b>
              
                <asp:Label ID="lblNum" runat="server" ></asp:Label></td>
                <td class="style3" >
                    
                        <b>姓名：</b>
               
        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                <td >
                        <b>性别：</b>
                
        <asp:Label ID="lblsex" runat="server"></asp:Label>
        </td>
        <td>
        <asp:Button ID="BtnChange"  PostBackUrl="~/student/studentChangePwd.aspx" runat="server" Text="修改密码" />&nbsp;
        <asp:Button ID="Btnscore" PostBackUrl="~/student/studentscore.aspx" runat="server" Text="查看成绩" />
        </td>
            </tr></table></fieldset><br /><br />
            <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="278px"> 
            <tr>
                <td></td>
                <td colspan="5" style="text-align: center" valign="top">
        <asp:Panel ID="Panel1" runat="server" Height="400px" Width="840px" BorderColor="#220000" BorderWidth="1" HorizontalAlign="Left">
            <br />
            <br />
            <b>1.</b>不得携带笔记、便携式计算机、书包或其他物品进入考场。请将这些物品交给考试管理员妥善保管。
            <br />
            <br />
            <b>2.</b>考场内请保持安静，不得交谈和走动。
            <br />
            <br />
            <b>3.</b>不得参阅其他人屏幕上的答题，不得参阅笔记及任何资料。
            <br />
            <br />
            <b>4.</b>如有任何疑问，请暂停考试、举手示意管理员解决。
            <br />
            <br />
            <b>5.</b>若出现意外情况（如停电、机器故障等），请立即示意管理员解决。
            <br />
            <br />
            <b>6.</b>不得以任何方式将考题内容带出考场。
            <br />
            <br />
            <b>7.</b>凡有违反上述规定中的任何一条者，考场管理员有权提出警告直至终止其考试、取消其考试成绩和考试资格。
            <br />
            <br />
            <b>8.</b>任何人都有权利和义务维护认证考试的公平性和公正性，举报一切违反考场规则的行为。<br />
            <br />
            <br />
            
            <div style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 180px; height: 74px">
                    <tr>
                        <td style="width: 100px; text-align: center">
            <asp:CheckBox
                ID="ckbCheck" runat="server" Text="本人已阅读并接受考试规则" Width="180px" AutoPostBack="true"
                                oncheckedchanged="ckbCheck_CheckedChanged"   /></td>
                    </tr>
                    <tr>
                        <td style="width: 150px; text-align: center" align="center">&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定"  Width="50px" Enabled="false"/>&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="退出" PostBackUrl="~/Login.aspx"  Width="50px"/>
        <br />
        <br />
        </td>
        </tr>
          </table>
            </div>
            </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="300px" Visible="False" Width="837px" BorderColor="#220000" BorderWidth="1">
            <br />
            <br />
            <br />
            <br />
            <table align="center" border="0" cellpadding="0" cellspacing="0" width="486px">
                <tr>
                    <td style="text-align: center">
            <asp:Label ID="Label3" runat="server" Text="选择考试科目："></asp:Label>&nbsp;
            <asp:DropDownList ID="ddlKm" runat="server">
            </asp:DropDownList>&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="选择考试题型"></asp:Label>&nbsp;
            <asp:DropDownList ID="ddlTX" runat="server">
            </asp:DropDownList><br /><br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="开始" Width="50px" />&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/Login.aspx" Text="退出" Width="50px" />
            </td>
            </tr>
            </table>
            <br />
            <div style="text-align: center">
                &nbsp;
            </div>
        </asp:Panel>
                </td>
            </tr>
            <tr><td></td></tr>
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
