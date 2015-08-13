<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ExaminationDetail2.aspx.cs" Inherits="admin_ExaminationDetail2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style3
        {
            height: 29px;
            width: 251px;
        }
        .style5
        {
            width: 94px;
        }
        .style6
        {
            height: 27px;
            width: 94px;
        }
        .style7
        {
            height: 29px;
            width: 94px;
        }
        .style11
        {
            height: 26px;
            width: 108px;
        }
        .style12
        {
            height: 26px;
            width: 157px;
        }
    </style>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
 <br />
        <br />
        <br />
    <fieldset style="WIDTH: 454px; HEIGHT: 335px">
    <legend class="mailTitle">试题详细信息</legend>&nbsp; &nbsp; &nbsp;&nbsp;<br />
        <table align="center" border="0" cellpadding="0" cellspacing="0" 
            style="height: 39px; width: 363px;">
            <tr>
                <td style=" text-align:right" class="style12">
                    &nbsp;&nbsp; 科目：<asp:Label ID="lblkm" runat="server" ></asp:Label>&nbsp;</td>
                <td style=" text-align: left" class="style11">
                    &nbsp;题型：<asp:Label ID="lbltx" runat="server"></asp:Label></td>
            </tr>
            </table>
            <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 321px"
            width="344px">
            <tr>
                <td style="text-align: right" class="style5">
                    &nbsp;试题题目：</td>
                <td colspan="2" style="text-align: left" class="style9">
        <asp:TextBox ID="txtsubject" runat="server" TextMode="MultiLine" Width="184px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right" class="style5">
                    &nbsp;选项A：</td>
                <td colspan="2" style="text-align: left" class="style9">
        <asp:TextBox ID="txtAnsA" runat="server" TextMode="MultiLine" Width="184px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right" class="style5">
                    &nbsp;选项B：</td>
                <td colspan="2" style="text-align: left" class="style9">
        <asp:TextBox ID="txtAnsB" runat="server" TextMode="MultiLine" Width="183px"></asp:TextBox>&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right" class="style6">
                    &nbsp;正确选项：</td>
                <td colspan="2" style="text-align: left" class="style10">
        <asp:CheckBoxList ID="rblRightAns" runat="server" RepeatDirection="Horizontal"
            RepeatLayout="Flow">
            <asp:ListItem Value="1">选项A</asp:ListItem>
            <asp:ListItem Value="2">选项B</asp:ListItem>
        </asp:CheckBoxList>&nbsp;</td>
            </tr>
            <tr>
             <td style="text-align: right" class="style7">
                        &nbsp;是否发布：</td>
                    <td style="text-align: left;" class="style3">
                        <asp:CheckBox ID="FB" runat="server" Text="是"  />
                        
                    </td>
               
            </tr>
            <tr>
                <td colspan="3" style="text-align: center">
        <asp:Button ID="btnconfirm" runat="server" Text="确定" OnClick="btnconfirm_Click" />
                    <asp:Button ID="btnconcel" runat="server" Text="取消" OnClick="btnconcel_Click" /></td>
            </tr>
        </table>
    </fieldset>
    <div>
        &nbsp;</div>
    </form>
</body>
</html>
