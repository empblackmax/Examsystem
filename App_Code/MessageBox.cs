﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class MessageBox
{
	public MessageBox()
	{
		
	}
    public static void Show(string strtext)
    {
        HttpContext.Current.Response.Write("<script language='javascript'>alert('" + strtext + "');</script>");
    }
}
