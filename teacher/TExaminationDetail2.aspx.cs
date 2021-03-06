﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class teacher_Detail2 : System.Web.UI.Page
{
    private static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher"] == null)
        {
            Response.Redirect("../Login.aspx");

        }
        if (!IsPostBack)
        {
            id = Convert.ToInt32(Request.QueryString["Id"]);
            SqlConnection conn = BaseClass.DBCon();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_test where ID=" + id, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            txtsubject.Text = sdr["testContent"].ToString();
            txtAnsA.Text = sdr["testAns1"].ToString();
            txtAnsB.Text = sdr["testAns2"].ToString();
            string rans = sdr["rightAns"].ToString();
           // Session["TrightAns2"] = rans.ToString();
            for (int i = 0; i < 2; i++)
            {
                if (rans.Substring(i, 1) == "1")
                {
                    rblRightAns.Items[i].Selected = true;
                }
            }
            string fb = sdr["pub"].ToString();
            if (fb == "1")
            {
                FB.Checked = true;
            }
            else
            {
                FB.Checked = false;
            }
            lblkm.Text = sdr["testCourse"].ToString();
            lbltx.Text = sdr["Examtype"].ToString();
            sdr.Close();
            conn.Close();
        }
    }
    protected void btnconfirm_Click(object sender, EventArgs e)
    {
        if (txtsubject.Text == "" || txtAnsA.Text == "" || txtAnsB.Text == "")
        {
            MessageBox.Show("请将信息填写完整");
            return;
        }
        else
        {
            string isfb = "";
            if (FB.Checked == true)
            {

                isfb = "1";
            }
            else
            {
                isfb = "0";
            }
            string ans = "";
            for (int i = 0; i < 2; i++)
            {
                if (rblRightAns.Items[i].Selected == true)
                {
                    ans += "1";
                }
                else
                {
                    ans += "0";
                }
            }
            Session["rightAns"]=ans;
            string str = "update tb_test set testContent='" + txtsubject.Text.Trim() + "',testAns1='" + txtAnsA.Text.Trim() + "',testAns2='" + txtAnsB.Text.Trim() + "',rightAns='" + Session["rightAns"] + "',pub='" + isfb + "' where ID=" + id;
            BaseClass.OperateData(str);
            //MessageBox.Show("发布成功");
            Response.Redirect("TExaminationInfo.aspx");
        }

    }
    protected void btnconcel_Click(object sender, EventArgs e)
    {
        Response.Redirect("TExaminationInfo.aspx");
    }
}