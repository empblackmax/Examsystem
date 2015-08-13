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

public partial class student_result : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "判断题";
        if (Session["ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            string Rans = Session["Ans"].ToString();//正确答案
            int j = Convert.ToInt32(Request.QueryString["BInt"]);
            string Sans = Session["Sans"].ToString();
            int StuScore = 0;
            if (Session["TX"].ToString() == str)
            {
                for (int i = 0; (i/2) < j-1; i+=2)
                {
                    if (Rans.Substring(i, 2).Equals(Sans.Substring(i, 2)))
                    {
                        StuScore += 1;
                    }
                }
            }
            else
            {
                for (int i = 0;( i/4) < j-1; i+=4)
                {
                    if (Rans.Substring(i, 4).Equals(Sans.Substring(i, 4)))
                    {
                        StuScore += 1;
                    }
                }
            }
            this.lblResult.Text = StuScore.ToString();
            this.lblkm.Text = Session["KM"].ToString();
            this.lbltx.Text = Session["TX"].ToString();
            this.lblnum.Text = Session["ID"].ToString();
            this.lblname.Text = Session["name"].ToString();
            string strsql = "update tb_score set score='" + StuScore.ToString() + "' where StudentID='"+Session["ID"].ToString()+"' and LessonName='"+Session["KM"].ToString()+"' and ExamType='"+Session["TX"].ToString()+"'";
            BaseClass.OperateData(strsql);
        }
    }
    protected void Choose_Click(object sender, EventArgs e)
    {
       
            Response.Redirect("~/student/studentexam.aspx");
        
    }
}
