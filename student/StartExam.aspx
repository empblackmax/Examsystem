<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StartExam.aspx.cs" Inherits="student_StartExam" %>

<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <link rel="icon" href="exam.ico" />
 <script type="text/javascript">
     function Sure() {
         return confirm('确定要交卷吗？');
     }
    </script>
    <title>考试系统</title>
   <style type="text/css">
   #Panel1
   {
   	 left:300px;
   	}
   	.mid
   	{
   		margin:0 anto;
   		
   	}
   	.style
   	{
   		border:1px #220000;
   	}
   </style>
    <script language="javascript" type="text/javascript">
    self.moveTo(0,0);
    self.resizeTo(screen.availWidth,screen.availHeight);

    //屏蔽鼠标右键、Ctrl+N、Shift+F10、F11、F5刷新、退格键    
    function document.oncontextmenu() { event.returnValue = false; } //屏蔽鼠标右键    
    function window.onhelp() { return false } //屏蔽F1帮助    
    function document.onkeydown() {
        if ((window.event.altKey) &&
      ((window.event.keyCode == 37) || (window.event.keyCode == 39)))   //屏蔽 Alt+ 方向键 ←     //屏蔽 Alt+ 方向键 →    
        {
            event.returnValue = false;
        }
        /* 注：这还不是真正地屏蔽 Alt+ 方向键，  
        因为 Alt+ 方向键弹出警告框时，按住 Alt 键不放，  
        用鼠标点掉警告框，这种屏蔽方法就失效了。以后若  
        有哪位高手有真正屏蔽 Alt 键的方法，请告知。*/
        if ((event.keyCode == 116) || (event.ctrlKey && event.keyCode == 82)) //屏蔽 F5 刷新键  //Ctrl + R   
        {
            event.keyCode = 0;
            event.returnValue = false;
        }

        if (event.keyCode == 122) { event.keyCode = 0; event.returnValue = false; }  //屏蔽F11    
        if (event.ctrlKey && event.keyCode == 78) event.returnValue = false;   //屏蔽 Ctrl+n    
        if (event.shiftKey && event.keyCode == 121) event.returnValue = false;  //屏蔽 shift+F10    
        if (window.event.srcElement.tagName == "A" && window.event.shiftKey)
            window.event.returnValue = false;             //屏蔽 shift 加鼠标左键新开一网页    
        if ((window.event.altKey) && (window.event.keyCode == 115))             //屏蔽Alt+F4    
        {
            return false;
        }

        // Backspace按键的控制。   
        var ev = window.event;
        var obj = ev.target || ev.srcElement;
        var t = obj.type || obj.getAttribute('type');

        var vReadOnly = obj.getAttribute('readonly');
        var vEnabled = obj.getAttribute('enabled');

        vReadOnly = (vReadOnly == null) ? false : vReadOnly;
        vEnabled = (vEnabled == null) ? true : vEnabled;

        //当敲Backspace键时，事件源类型为密码或单行、多行文本的，      
        //并且readonly属性为true或enabled属性为false的，则退格键失效      
        var flag1 = (ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vEnabled != true)) ? true : false;

        //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效      
        var flag2 = (ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea") ? true : false;

        if (flag2) {
            return false;
        }
        if (flag1) {
            return false;
        }


    }
    
    function showtime()
    {
      var now=new Date();
      years=now.getFullYear();
      month=now.getMonth()+1;
      dates=now.getDate();
      hours=now.getHours();
      Minutes=now.getMinutes();
      Seconds=now.getSeconds();
      if(hours<10)
      hours="0"+hours;
      if(Minutes<10)
      Minutes="0"+Minutes;
      if(Seconds<10)
      Seconds="0"+Seconds;
      var titletext=years+"年"+month+"月"+dates+"日"+hours+":"+Minutes+":"+Seconds;
      setTimeout("showtime()", 1000);
      document.getElementById("lbldate").innerText=titletext;
    }

    </script>
    <script type="text/javascript" language="javascript">

        var sec = 0;
        var min = 0;
        var hou = 0;
        flag = 0;
        idt = window.setTimeout("ls();", 1000);
        function ls() {
            sec++;
            if (sec == 60) { sec = 0; min += 1; }
            if (min == 60) { min = 0; hou += 1; }
            document.getElementById("lbltime").innerText = min + "分" + sec + "秒";
            idt = window.setTimeout("ls();", 1000);
            if (min >= 15) {

                document.getElementById("btnsubmit").click();
            }
        }


</script>
    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body 　 onload="showtime()"   id="bntOk">
    <form id="form1" runat="server">

    <div style="text-align:center">
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />
       <fieldset style="width:844px; height:260px;text-align:center; border:1px; border-color:#220000">
        <table align="center"  bgcolor="#ffffff"  cellpadding="0" cellspacing="0" width="778px">
            <tr>
                <td colspan="7" height="46px">
                    <uc1:Header1 ID="Header1_0" runat="server" />
                </td>
            </tr>
                 <tr>
                 <td></td><td></td><td></td><td></td><td></td><td></td>
                <td bgcolor="#ffffff" height="31px" style="text-align: right">
                    <asp:Label ID="lbldate" runat="server"></asp:Label>
                    &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#c0c0c0" width="93px" style="height: 23px">
                    <div align="right">
                        学号：</div>
                </td>
                <td bgcolor="#c0c0c0" width="107px" style="height: 23px">
                    <asp:Label ID="lblStuNum"
            runat="server"></asp:Label></td>
                <td bgcolor="#c0c0c0" width="43px" style="height: 23px">
                    <div align="right">
                        姓名：</div>
                </td>
                <td bgcolor="#c0c0c0" width="85px" style="height: 23px">
                    <asp:Label
                ID="lblStuName" runat="server"></asp:Label></td>
                <td bgcolor="#c0c0c0" width="44px" style="height: 23px">
                    <div align="right">
                        性别：</div>
                </td>
                <td bgcolor="#c0c0c0" width="54px" style="height: 23px">
        <asp:Label ID="lblStuSex" runat="server"></asp:Label></td>
                <td bgcolor="#c0c0c0" width="352px" style="height: 23px">
                    &nbsp;
                    </td>
            </tr>
            
            <tr>
                <td colspan="7" height="45px" style="text-align: center">
        <asp:Label ID="lblStuKM" runat="server" Font-Bold="True" Font-Size="18pt"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="7" height="36px" style="text-align: center">
        <asp:Label ID="lblEndtime" runat="server"></asp:Label>
                    <asp:Label ID="lbltime" runat="server" Font-Bold="True" ForeColor="#C04000"></asp:Label></td>
            </tr>
            </table>
            </fieldset><br /><br />
            <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0"
                    width="778px">
                    <tr><td  align="center">
                    <asp:Panel  BorderColor="#220000" BorderWidth="1" BackColor="White" ID="Panel1" runat="server" HorizontalAlign="Left"  Width="844px" CssClass="mid" Font-Size="Large" >
                    </asp:Panel>
                      </td></tr>
                      </table>
            <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0"
                    width="778px">
                    <tr><td  align="center">
                    <asp:Button ID="btnsubmit" runat="server" Width="80px"  Font-Size="Medium" OnClientClick="return Sure()"  OnClick="btnsubmit_Click" Text="交 卷"  UseSubmitBehavior="true" />
                    
                    </td></tr>
            <tr>
                <td colspan="7" height="46px">
                    <uc2:Footer ID="Footer" runat="server" />
                </td>
            </tr>
            </table>
           
    
    </div>
    </form>
</body>
</html>
