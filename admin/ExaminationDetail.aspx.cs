using System;
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
public partial class admin_ExaminationDetail : System.Web.UI.Page
{
    private static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
           
        }
        string str="判断题";
        id = Convert.ToInt32(Request.QueryString["Eid"]);
        SqlConnection conn0 = BaseClass.DBCon();
        conn0.Open();
        SqlCommand com0 = new SqlCommand("select * from tb_test where ID=" + id, conn0);
        SqlDataReader sdr0 = com0.ExecuteReader();
        sdr0.Read();
        lbltx.Text = sdr0["Examtype"].ToString();
        sdr0.Close();
        conn0.Close();
        if(lbltx.Text==str)
        {
            Response.Redirect("~/admin/ExaminationDetail2.aspx?Id=" + Convert.ToInt32(Request.QueryString["Eid"]));
        }
         if (!IsPostBack)
        {
            id = Convert.ToInt32(Request.QueryString["Eid"]);
            SqlConnection conn = BaseClass.DBCon();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_test where ID=" + id, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            txtsubject.Text = sdr["testContent"].ToString();
            txtAnsA.Text = sdr["testAns1"].ToString();
            txtAnsB.Text = sdr["testAns2"].ToString();
            txtAnsC.Text = sdr["testAns3"].ToString();
            txtAnsD.Text = sdr["testAns4"].ToString();
           string rans=sdr["rightAns"].ToString();
          // Session["rightAns"] = rans.ToString();
            for (int i = 0; i < 4; i++)
            {
                if (rans.Substring(i, 1) == "1")
                {
                    rblRightAns.Items[i].Selected = true;
                    //rans=rans.Remove(0, 1);
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
        if (txtsubject.Text == "" || txtAnsA.Text == "" || txtAnsB.Text == "" || txtAnsC.Text == "" || txtAnsD.Text == "")
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
            for (int i = 0; i < 4; i++)
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
            Session["rightAns"] = ans;
            string str = "update tb_test set testContent='" + txtsubject.Text.Trim() + "',testAns1='" + txtAnsA.Text.Trim() + "',testAns2='" + txtAnsB.Text.Trim() + "',testAns3='" + txtAnsC.Text.Trim() + "',testAns4='" + txtAnsD.Text + "',rightAns='" + Session["rightAns"] + "',pub='" + isfb + "' where ID=" + id;
            BaseClass.OperateData(str);
         //   MessageBox.Show("发布成功");
           Response.Redirect("ExaminationInfo.aspx");
        }
        
    }
    protected void btnconcel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ExaminationInfo.aspx");
    }
}
