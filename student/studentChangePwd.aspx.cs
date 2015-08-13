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

public partial class student_studentChangePsw : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
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
               
            }
        }
    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        if (txtNewPwd.Text == "" || txtNewPwdA.Text == "" || txtOldPwd.Text == "")
        {
            MessageBox.Show("请将信息填写完整");
            return;
        }
        else
        {
            if (BaseClass.CheckStudent(Session["ID"].ToString(), txtOldPwd.Text.Trim()))
            {
                if (txtNewPwd.Text.Trim() != txtNewPwdA.Text.Trim())
                {
                    MessageBox.Show("两次密码不一致");
                    return;
                }
                else
                {
                    string strsql = "update tb_Student set StudentPwd='" + txtNewPwdA.Text.Trim() + "' where StudentNum='" + Session["ID"].ToString() + "'";
                    BaseClass.OperateData(strsql);
                    MessageBox.Show("密码修改成功");
                    txtNewPwd.Text = "";
                    txtNewPwdA.Text = "";
                    txtOldPwd.Text = "";
                    
                }
            }
            else
            {
                MessageBox.Show("旧密码输入错误");
                return;
            }
        }
    }
    
}