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
public partial class admin_ExaminationInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
           
            
        }
        if (!IsPostBack)
        {
         //   if (Label1.Visible==true)
         //   {
         //       ddlEkm.SelectedItem.Text = Session["serchKM"].ToString();
         //       ddlEtx.SelectedItem.Text = Session["serchTX"].ToString();
         //       btnSerch_Click(sender, e);
         //   }
         //else 
         //   {
                string strsql = "select * from tb_test order by ID asc";
                BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
                SqlConnection conn = BaseClass.DBCon();
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from tb_Lesson", conn);
                SqlDataReader sdr = cmd.ExecuteReader();
                this.ddlEkm.DataSource = sdr;
                this.ddlEkm.DataTextField = "LessonName";
                this.ddlEkm.DataValueField = "ID";
                this.ddlEkm.DataBind();
                this.ddlEkm.SelectedIndex = 0;
                sdr.Close();
                SqlCommand cmd0 = new SqlCommand("select * from tb_Examtype", conn);
                SqlDataReader sdr0 = cmd0.ExecuteReader();
                this.ddlEtx.DataSource = sdr0;
                this.ddlEtx.DataTextField = "Examtype";
                this.ddlEtx.DataValueField = "ID";
                this.ddlEtx.DataBind();
                this.ddlEtx.SelectedIndex = 0;
                sdr0.Close();
                conn.Close();
          // }
        }
    }
    public string Getstatus(string zt)
    {
        if (zt == "0")
        {
            return "否";
        }
        else
        {
            return "是";
        }
    }
    protected void btnSerch_Click(object sender, EventArgs e)
    {
        string strsql = "select * from tb_test where testCourse='" + ddlEkm.SelectedItem.Text + "'and Examtype='"+ddlEtx.SelectedItem.Text+"'";
        BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "Result");
        lbltype.Text = ddlEkm.SelectedItem.Text;
        lbltx.Text = ddlEtx.SelectedItem.Text;
        Label1.Visible = true;
        Session["serch"] = "1";
        Session["serchKM"] = ddlEkm.SelectedItem.Text;
        Session["serchTX"] = ddlEtx.SelectedItem.Text;
    }
    protected void gvExaminationInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Session["serch"] == null)
        {
            int id = (int)gvExaminationInfo.DataKeys[e.RowIndex].Value;
            string sql = "delete from tb_test where ID=" + id;
            BaseClass.OperateData(sql);
            string strsql = "select * from tb_test order by ID asc";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
        else
        {
            int id = (int)gvExaminationInfo.DataKeys[e.RowIndex].Value;
            string sql = "delete from tb_test where ID=" + id;
            BaseClass.OperateData(sql);
            string strsql = "select * from tb_test  where testCourse='" + Session["serchKM"].ToString() +"'and Examtype='"+ Session["serchTX"]+"' order by ID asc";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
    }
    protected void gvExaminationInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (Session["serch"] == null)
        {
            gvExaminationInfo.PageIndex = e.NewPageIndex;
            string strsql = "select * from tb_test order by ID asc";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
        else
        {
            gvExaminationInfo.PageIndex = e.NewPageIndex;
            string strsql = "select * from tb_test   where testCourse='" + Session["serchKM"].ToString() +"'and Examtype='"+ Session["serchTX"]+"' order by ID asc";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
    }
    protected void gvExaminationInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
            for (int i = 0; i < gvExaminationInfo.Rows.Count; i++)
            {
                gvExaminationInfo.Rows[i].Cells[3].Attributes.Add("onclick", "return confirm('确定要删除吗？')");
            }
          
        
    }
}
