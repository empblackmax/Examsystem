<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TExaminationResult.aspx.cs" Inherits="teacher_TExaminationResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
<div style="text-align: center">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <fieldset style="width: 556px; height: 61px; text-align: left">
            <legend class="mailTitle">考试结果</legend>
            <br />
            请输入学生信息：<asp:DropDownList ID="ddltype" runat="server">
                <asp:ListItem>学号</asp:ListItem>
                <asp:ListItem>姓名</asp:ListItem>
                <asp:ListItem Selected="True">--关键字--</asp:ListItem>
            </asp:DropDownList>&nbsp;&nbsp;
            <asp:TextBox ID="txtkey" runat="server"></asp:TextBox>
            <asp:Button ID="btnserch" runat="server" Text="查询" OnClick="btnserch_Click" /><br />
            &nbsp;<asp:GridView ID="gvExaminationresult" runat="server" 
                AllowPaging="True" AutoGenerateColumns="False"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" 
                OnPageIndexChanging="gvExaminationresult_PageIndexChanging" OnRowDeleting="gvExaminationInfo_RowDeleting"
                PageSize="8" Width="556px" 
                onrowdatabound="gvExaminationresult_RowDataBound">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="学号">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="姓名">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LessonName" HeaderText="考试科目">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Examtype" HeaderText="考试题型" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="90px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="score" HeaderText="分数">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:BoundField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                    </asp:CommandField>
                </Columns>
                <RowStyle ForeColor="#000066" Height="15px" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="15px" HorizontalAlign="Center" />
            </asp:GridView>
            <br />
        </fieldset>
    
    </div>
    </form>
</body>
</html>
