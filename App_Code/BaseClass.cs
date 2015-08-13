using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public class BaseClass
{
	public BaseClass()
	{
		
	}
    public static SqlConnection DBCon()
    {
        return new SqlConnection(ConfigurationManager.AppSettings["str"]);
    }

    public static void BindDG(GridView dg, string id, string strSql, string Tname)
    {
        SqlConnection conn = DBCon();
        SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);
        DataSet ds = new DataSet();
        sda.Fill(ds, Tname);
        dg.DataSource = ds.Tables[Tname];
        dg.DataKeyNames = new string[] { id };
        dg.DataBind();
    }
    public static void OperateData(string strsql)
    {
        SqlConnection conn = DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    //学生登录
    public static bool CheckStudent(string studentNum, string studentPwd)
    {
        SqlConnection conn = DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Student where StudentNum='" + studentNum + "' and StudentPwd='" + studentPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
    //教师登录
    public static bool CheckTeacher(string teacherNum, string teacherPwd)
    {
        SqlConnection conn = DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Teacher where TeacherNum='" + teacherNum + "' and TeacherPwd='" + teacherPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
    //管理员登录
    public static bool CheckAdmin(string adminNum, string adminPwd)
    {
        SqlConnection conn = DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Admin where AdminNum='" + adminNum + "' and adminPwd='" + adminPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
        conn.Close();
    }
}
