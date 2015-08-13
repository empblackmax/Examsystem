<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="student_result" %>

<%@ Register Src="../UserControls/Header1.ascx" TagName="Header1" TagPrefix="uc1" %>
<%@ Register Src="../UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>考试系统</title>
     <link rel="icon" href="exam.ico" />
    <style type="text/css">


.bian {
	border: 1px solid #158BB7;
}
.STYLE2 {color: #FFFFFF; font-weight: bold; }
.ce {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: solid;
	border-top-color: #158BB7;
	border-right-color: #158BB7;
	border-bottom-color: #158BB7;
	border-left-color: #158BB7;
}

</style>
    
<script language="javascript" type="text/javascript">

    //屏蔽鼠标右键、Ctrl+N、Shift+F10、F11、F5刷新、退格键    
    function document.oncontextmenu() { event.returnValue = false; } //屏蔽鼠标右键    
    function window.onhelp() { return false } //屏蔽F1帮助    
    function document.onkeydown()
     {
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
        var flag1 = (ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea")
                && (vReadOnly == true || vEnabled != true)) ? true : false;

        //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效      
        var flag2 = (ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")
                ? true : false;

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
      setTimeout("showtime()",1000);
      document.getElementById("lbldate").innerText=titletext;
    }
    </script>
    
  <!--  <script type="text/javascript" language="javascript">
    function click()
    {
      event.returnValue=false;
      alert("当前设置不允许使用右键！");
    }
    document.oncontextmenu=click;
    </script> 
   -->

    <link href="../Mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body onkeydown="keydown2()"  onload="showtime()">
    <form id="form1" runat="server">
  <div style="text-align: center">
        <br />
       
        <table align="center" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0"
            width="778px" style="height: 582px">
            <tr>
                <td height="47px" colspan="2">
                    <uc1:Header1 ID="Header1_1" runat="server" />
                </td>
            </tr>
            <tr>
                
                <td bgcolor="#ecf9ff" height="31px" style="text-align: right" colspan="2">
                    <asp:Label ID="lbldate" runat="server"></asp:Label>
                    &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>
                
                <td height="36px">
                    <img height="53px" src="../Image/emame_03.gif"
                        width="578px" /></td><td>
                 <asp:Button ID="Button2"  runat="server" Width="120px" OnClick="Choose_Click" Text="选择其他考试" /><br />
                 <asp:Button ID="Button3"  runat="server" Width="120px" PostBackUrl="~/Login.aspx" Text="返回登录界面" />
                 </td>
                        
            </tr>
           <!-- <tr>
            
                <td height="36px">                
                  <img height="53px" src="../Image/emame_04.gif"
                        width="778px" />           
                 <asp:Button ID="Button1"  runat="server" Width="120px" PostBackUrl="~/Login.aspx" Text="返回登录界面" /></td>
                        
            </tr> 
            -->
            <tr>
                <td style="height: 310px" colspan="2">
                <fieldset style="width: 600px;height:150px; text-align: center">
                    <table align="center" border="1" cellpadding="0" class="bian" width="500px"   >
                        <tr>
                            <td background="../Image/bg.gif" height="20px">
                                <div align="center" class="STYLE2">
                                    <span style="color: #ffffff">考试科目</span></div>
                            </td>
                            <td background="../Image/bg.gif" height="20px">
                                <div align="center" class="STYLE2">
                                    <span style="color: #ffffff">考试题型</span></div>
                            </td>
                            <td background="../Image/bg.gif">
                                <div align="center" class="STYLE2">
                                    <span style="color: #ffffff">考生学号</span></div>
                            </td>
                            <td background="../Image/bg.gif" style="width: 145px">
                                <div align="center" class="STYLE2">
                                    <span style="color: #ffffff">考生姓名</span></div>
                            </td>
                            <td background="../Image/bg.gif" style="width: 127px">
                                <div align="center" class="STYLE2">
                                    <span style="color: #ffffff">考试成绩</span></div>
                            </td>
                        </tr>
                        <tr>
                            <td height="36px">
                                <asp:Label ID="lblkm" runat="server" Text="Label"></asp:Label>&nbsp;</td>
                            <td height="36px">
                                <asp:Label ID="lbltx" runat="server" Text="Label"></asp:Label>&nbsp;</td>
                            <td>
                                &nbsp;<asp:Label ID="lblnum" runat="server" Text="Label"></asp:Label></td>
                            <td style="width: 145px">
                                &nbsp;<asp:Label ID="lblname" runat="server" Text="Label"></asp:Label></td>
                            <td style="width: 127px">
                                &nbsp;<asp:Label ID="lblResult" runat="server" Font-Bold="False"></asp:Label></td>
                        </tr>
                    </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td style="height: 30px" colspan="2">
                    <uc2:Footer ID="Footer1" runat="server" />
                </td>
            </tr>
        </table>
    

    </div>
    </form>
</body>
</html>
