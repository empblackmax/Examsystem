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

public partial class teacher_TAddExamination2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        km.Text = Request["ddlkm"];
        tx.Text = Request["ddltx"];
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

            string str = "insert into tb_test(testContent,testAns1,testAns2,rightAns,pub,testCourse,Examtype) values('" + txtsubject.Text + "','" + txtAnsA.Text + "','" + txtAnsB.Text + "','" + rblRightAns.SelectedValue.ToString() + "','" + isfb + "','" + Request["ddlkm"] + "','" + Request["ddltx"] + "')";
            BaseClass.OperateData(str);
            btnconcel_Click(sender, e);
            MessageBox.Show("添加成功");

        }
    }
    protected void btnconcel_Click(object sender, EventArgs e)
    {
        txtsubject.Text = "";
        txtAnsB.Text = "";
        txtAnsA.Text = "";

    }
}