<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Options.aspx.cs" Inherits="Options" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" method="get">
   <div style="text-align: center">
        <br />
        <br />
        <br />
        &nbsp;<fieldset style="width: 454px; height: 335px">
            <legend class="mailTitle">添加试题</legend>&nbsp; &nbsp; &nbsp;&nbsp;<br />
            <table align="center" border="0" cellpadding="0" cellspacing="0" style="height: 321px"
                width="344">
                <tr>
                    <td style="height: 24px; text-align: right" width="87">  &nbsp;所属科目：</td>
                    <td colspan="2" style="height: 24px; text-align: left"><asp:DropDownList ID="ddlkm" runat="server">
                            </asp:DropDownList></td>&nbsp;&nbsp;&nbsp;
                        <td style="height: 24px; text-align: right" width="87">
                        &nbsp;题目类型：</td>
                            <td> <asp:DropDownList ID="ddltx" runat="server">
                    </asp:DropDownList></td>
                </tr>
                
                <tr align="center"><td></td><td>
                <asp:Button ID="Confirm" runat="server" Text="确定" Width="80px" 
                        onclick="Confirm_Click" />
                </td><td></td>
                <td style="text-align:center">
                <asp:Button ID="Button1" runat="server" Text="取消" Width="80px" PostBackUrl="~/admin/ExaminationInfo.aspx" />
                </td>
                </tr>
            </table>
        </fieldset>
    </div>
    </form>
</body>
</html>
