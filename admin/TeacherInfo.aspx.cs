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
public partial class admin_TeacherInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (!IsPostBack)
        {
            string strsql = "select * from tb_Teacher order by ID asc";
            BaseClass.BindDG(gvTeacher, "ID", strsql, "teacher");
        }
    }
    public string GetKmName(int num)
    {
        SqlConnection conn = BaseClass.DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tb_Teacher where ID=" + num, conn);
        SqlDataReader sdr = cmd.ExecuteReader();
        sdr.Read();
        string kname = sdr["TeacherCourse"].ToString();
        //string kname = cmd.ExecuteScalar().ToString();
        return kname;
        conn.Close();
    }
    protected void gvTeacher_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)gvTeacher.DataKeys[e.RowIndex].Value;
        string str = "delete from tb_Teacher where ID=" + id;
        BaseClass.OperateData(str);
        string strsql = "select * from tb_Teacher order by ID asc";
        BaseClass.BindDG(gvTeacher, "ID", strsql, "teacher");
    }
    protected void gvTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTeacher.PageIndex = e.NewPageIndex;
        string strsql = "select * from tb_Teacher order by ID asc";
        BaseClass.BindDG(gvTeacher, "ID", strsql, "teacher");
    }
    protected void gvTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < gvTeacher.Rows.Count; i++)
        {
            gvTeacher.Rows[i].Cells[4].Attributes.Add("onclick","return confirm('确定要删除吗？')");
        }
    }
}
