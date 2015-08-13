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

public partial class student_studentscore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (!IsPostBack)
        {
         
                lblNum.Text = Session["ID"].ToString();
                SqlConnection conn = BaseClass.DBCon();
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from tb_Student where StudentNum='" + Session["ID"].ToString() + "'", conn);
                SqlDataReader sdr = cmd.ExecuteReader();
                sdr.Read();
                lblName.Text = sdr["StudentName"].ToString();
                lblsex.Text = sdr["StudentSex"].ToString();
                conn.Close();
                Session["name"] = lblName.Text;
                Session["sex"] = lblsex.Text;

            
            string strsql = "select * from tb_score where StudentID="+Session["ID"].ToString();
            BaseClass.BindDG(gvExaminationresult, "ID", strsql, "result");
        }
    }
    protected void gvExaminationresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvExaminationresult.PageIndex = e.NewPageIndex;
        string strsql = "select * from tb_score order by ID asc";
        BaseClass.BindDG(gvExaminationresult, "ID", strsql, "result");
    }
}