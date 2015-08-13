<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="AddExamination1.aspx.cs" Inherits="admin_AddExamination1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 26px;
        }
        .style2
        {
            height: 26px;
            width: 85px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div style="text-align: center">
        <br />
        <br />
        <br />
       
        &nbsp;<fieldset style="width: 454px; height: 335px">
            <legend class="mailTitle">添加试题</legend>&nbsp; &nbsp; &nbsp;&nbsp;<br />
            <table align="center" border="0" cellpadding="0" cellspacing="0" 
                style="width: 301px; margin-left: 46px;">
               <tr>
               
                <td style="text-align:left" class="style2">科目：<asp:Label ID="km" runat="server" ></asp:Label></td>
                <td class="style1" style="text-align:left">题型：<asp:Label ID="tx" runat="server" ></asp:Label></td>
               </tr></table>
               <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 321px">
                <tr>
                    <td style="text-align: right">
                        &nbsp;试题题目：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="txtsubject" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        &nbsp;选项A：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="txtAnsA" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        &nbsp;选项B：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="txtAnsB" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        &nbsp;选项C：</td>
                    <td colspan="2" style="text-align: left">
        <asp:TextBox ID="txtAnsC" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        &nbsp;选项D：</td>
                    <td colspan="2" style="text-align: left">
                        <asp:TextBox ID="txtAnsD" runat="server"  TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="height: 27px; text-align: right">
                        &nbsp;正确选项：</td>
                    <td colspan="2" style="height: 27px; text-align: left">
                        <asp:CheckBoxList ID="rblRightAns" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Flow">
                            <asp:ListItem >选项A</asp:ListItem>
                            <asp:ListItem >选项B</asp:ListItem>
                            <asp:ListItem >选项C</asp:ListItem>
                            <asp:ListItem >选项D</asp:ListItem>
                        </asp:CheckBoxList>
                        </td>
                </tr>
                <tr>
                    <td style="height: 29px; text-align: right">
                        &nbsp;是否发布：</td>
                    <td style="height: 29px; text-align: left;" width="141">

                        <asp:CheckBox ID="FB" runat="server" Text="是" Checked="true"  />
                       
                    </td>
                    <td style="height: 29px" width="116">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
        <asp:Button ID="btnconfirm" runat="server" OnClick="btnconfirm_Click" Text="确定" />
        <asp:Button ID="btnconcel" runat="server" OnClick="btnconcel_Click" Text="重置" />
        <asp:Button ID="back" runat="server" Text="返回上一级" Width="80px" PostBackUrl="~/admin/Options.aspx" />
            </td>
           </tr>
            </table>
        </fieldset>
    </div>
    </form>
</body>
</html>
