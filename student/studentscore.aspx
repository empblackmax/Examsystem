<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentscore.aspx.cs" Inherits="student_studentscore" %>

<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>考试系统</title>
    <link rel="icon" href="exam.ico" />
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 133px;
        }
        .style3
        {
            width: 132px;
        }
        .style4
        {
            width: 110px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
 <div style="text-align: center">
 <br /><br />
      <fieldset style="width:844px; height:530px;text-align:center; border:1px; border-color:#220000">   
        <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0"
            width="278px">
            <tr>
                <td colspan="6" style="height: 47px">
                    <uc2:Header1 ID="Header1_1" runat="server" />
                </td>
            </tr>
             <tr style="height:30px">
            <td></td>
                <td class="style4" bgcolor="#c0c0c0">
                   
                         <b>学号：</b>
              
                <asp:Label ID="lblNum" runat="server" ></asp:Label></td>
                <td class="style3" bgcolor="#c0c0c0">
                    
                        <b>姓名：</b>
               
        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                <td bgcolor="#c0c0c0">
                    
                        <b>性别：</b>
          
        <asp:Label ID="lblsex" runat="server"></asp:Label>
        
        </td>
            </tr>
            </table>
            <div style=" width: 837px;">
             
            <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" 
                    style="width: 744px">
            <tr>
            <td class="style2"></td>
            <td  style="text-align: center">
            <br />
            <br />
            <br />
            <br />
            <fieldset style="width: 681px; height: 178px; text-align: center; border-color:Gray">
            <legend class="mailTitle" >考试成绩</legend>
            <br />
           
            &nbsp;<asp:GridView 
                ID="gvExaminationresult" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            Width="556px" AllowPaging="True" 
                OnPageIndexChanging="gvExaminationresult_PageIndexChanging" PageSize="8" 
               >
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
                <asp:BoundField DataField="Examtype" HeaderText="考试题型">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="90px" />
                </asp:BoundField>
                <asp:BoundField DataField="score" HeaderText="分数">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:BoundField>
               
            </Columns>
            <RowStyle ForeColor="#000066" Height="15px" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="15px" />
        </asp:GridView>
      
        </fieldset>   
            </td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="注销" PostBackUrl="~/Login.aspx" Width="50px" />&nbsp;
           
                <asp:Button ID="Button2" runat="server" Text="返回" PostBackUrl="~/student/studentexam.aspx" Width="50px" />
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
     </fieldset>
 </div>
    </form>
</body>
</html>
