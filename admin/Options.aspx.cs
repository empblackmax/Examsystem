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

public partial class Options : System.Web.UI.Page
{
    string s1 = "单选题";
    string s2 = "多选题";
    string s3 = "判断题";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (!IsPostBack)
        {
            SqlConnection conn = BaseClass.DBCon();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_Lesson", conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            this.ddlkm.DataSource = sdr;
            this.ddlkm.DataTextField = "LessonName";
            this.ddlkm.DataValueField = "LessonName";
            this.ddlkm.DataBind();
            this.ddlkm.SelectedIndex = 0;
            sdr.Close();
            SqlCommand cmd0 = new SqlCommand("select * from tb_Examtype", conn);
            SqlDataReader sdr0 = cmd0.ExecuteReader();
            this.ddltx.DataSource = sdr0;
            this.ddltx.DataTextField = "Examtype";
            this.ddltx.DataValueField = "Examtype";
            this.ddltx.DataBind();
            this.ddltx.SelectedIndex = 0;
            sdr0.Close();
            conn.Close();
        }
    }
    protected void Confirm_Click(object sender, EventArgs e)
    {
        if (ddltx.SelectedValue == s1)
        {
            Response.Redirect("~/admin/AddExamination.aspx?ddlkm=" + ddlkm.SelectedValue + "&ddltx=" + ddltx.SelectedValue);
        }
        else if (ddltx.SelectedValue == s2)
        {
            Response.Redirect("~/admin/AddExamination1.aspx?ddlkm=" + ddlkm.SelectedValue + "&ddltx=" + ddltx.SelectedValue);
        }
        else if (ddltx.SelectedValue == s3)
        {
            Response.Redirect("~/admin/AddExamination2.aspx?ddlkm=" + ddlkm.SelectedValue + "&ddltx=" + ddltx.SelectedValue);
        }
        
    }
}