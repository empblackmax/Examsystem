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
public partial class teacher_TExaminationInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            string strsql = "select * from tb_test where testCourse='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
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
    protected void btnserch_Click(object sender, EventArgs e)
    {
        string strsql = "select * from tb_test where Examtype='" + rbTX.SelectedItem.Text + "' and testCourse='"+Session["KCname"].ToString()+"'";
        BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "Result");
        rbTX.Text = rbTX.SelectedItem.Text;
        Session["serch"] = "1";
        Session["serchtx"] = rbTX.SelectedItem.Text;
    }
    protected void gvExaminationInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Session["serch"] == null)
        {
            int id = (int)gvExaminationInfo.DataKeys[e.RowIndex].Value;
            string sql = "delete from tb_test where ID=" + id;
            BaseClass.OperateData(sql);
            string strsql = "select * from tb_test where testCourse='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
        else
        {
            int id = (int)gvExaminationInfo.DataKeys[e.RowIndex].Value;
            string sql = "delete from tb_test where ID=" + id;
            BaseClass.OperateData(sql);
            string strsql = "select * from tb_test where testCourse='" + Session["KCname"].ToString() + "' and Examtype='" + Session["serchtx"].ToString() + "' order by ID asc";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
    }
    protected void gvExaminationInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (Session["serchtx"] == null)
        {
            gvExaminationInfo.PageIndex = e.NewPageIndex;
            string strsql = "select * from tb_test where testCourse='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationInfo, "ID", strsql, "ExaminationInfo");
        }
        else 
        {
            gvExaminationInfo.PageIndex = e.NewPageIndex;
            string strsql = "select * from tb_test where testCourse='" + Session["KCname"].ToString() + "' and Examtype='"+Session["serchtx"].ToString()+"' order by ID asc";
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
