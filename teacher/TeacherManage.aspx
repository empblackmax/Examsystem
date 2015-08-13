<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherManage.aspx.cs" Inherits="teacher_TeacherManage" %>

<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc2" %>
<%@ Register Src="../UserControls/Header2.ascx" TagName="Header2" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>考试系统</title>
     <link rel="icon" href="exam.ico" />
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            width: 113px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
<div style="text-align: center">
        <br />
        <table bgcolor="#0066cc" border="0"  cellpadding="0" cellspacing="0"
           width="778px">
            <tr>
                <td colspan="2" height="100px" style="text-align:left">
                    <uc3:Header2 ID="Header2_1" runat="server" />
                </td>
            </tr>
            <tr>
                <td height="453px" rowspan="2" class="style1">
                    &nbsp;<iframe src="Tleft.htm" style="width: 165px; height: 453px;" frameborder="0" scrolling="no"></iframe>
                </td>
                <td bgcolor="#333300" style="text-align: left; height:26px;">
                    <span style="font-size: 9pt; color: #ffffff">&nbsp;用户ID：</span>
                    <asp:Label ID="lblwz" runat="server" Font-Size="9pt" ForeColor="White"></asp:Label>&nbsp;&nbsp;
                    <span style="color: #ffffff">用户姓名：<asp:Label ID="lblname" runat="server" Font-Size="9pt"></asp:Label></span>&nbsp;
                    <span style="color: #ffffff">用户身份：教师&nbsp; 负责课程：<asp:Label ID="lblkc" runat="server"></asp:Label></span>
                    
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="9pt" ForeColor="White"
                        OnClick="LinkButton1_Click" Font-Underline="False">【安全退出】</asp:LinkButton></td>
            </tr>
            <tr>
                <td height="155px" class="style3">
                    <iframe name="menu" frameborder="0" scrolling="auto" style="width: 596px; height: 422px" src="TExaminationInfo.aspx"></iframe>
                    &nbsp;</td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
