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
public partial class student_studentexam : System.Web.UI.Page
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
                Button1.Enabled = false;
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
                BindDropDownList();
            }
        }
    }
    private void BindDropDownList()
    {
        SqlConnection conn = BaseClass.DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from tb_Lesson", conn);
        SqlDataReader sdr = cmd.ExecuteReader();
        ddlKm.DataSource = sdr;
        ddlKm.DataTextField = "LessonName";
        ddlKm.DataBind();
        sdr.Close();
        SqlCommand cmd0 = new SqlCommand("select * from tb_Examtype", conn);
        SqlDataReader sdr0 = cmd0.ExecuteReader();
        ddlTX.DataSource = sdr0;
        ddlTX.DataTextField = "Examtype";
        ddlTX.DataBind();
        sdr0.Close();
        conn.Close();
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        //if (ckbCheck.Checked == true)
       //{
            Panel1.Visible = false;
            Panel2.Visible = true;
            Image1.ImageUrl = "~/Image/kemu_03.gif";
         // }
         //  else
         //{
         //     MessageBox.Show("请接受考试规则");
         // }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string StuID = Session["ID"].ToString();//考生的编号
        string StuKC = ddlKm.SelectedItem.Text.ToString();//选择的考试科目
        string StuTX = ddlTX.SelectedItem.Text.ToString();//选择的考试题型
        SqlConnection conn = BaseClass.DBCon();
        conn.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Score where StudentID='" + StuID + "' and LessonName='" + StuKC + "' and Examtype ='"+StuTX+"'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());
        if (i > 0)
        {
            MessageBox.Show("你已经参加过该项考试了");
        }
        else
        {

            cmd = new SqlCommand("select count(*) from tb_test where testCourse='" + StuKC + "' and Examtype='"+StuTX+"'", conn);
            int N = Convert.ToInt32(cmd.ExecuteScalar());

            if (N > 0)
            {
                cmd = new SqlCommand("insert into tb_Score(StudentID,LessonName,Examtype,StudentName) values('" + StuID + "','" + StuKC + "','"+StuTX+"','" + lblName.Text + "')", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Session["KM"] = StuKC;
                Session["TX"] = StuTX;
                Session["falg"] = 1;
                Response.Redirect("~/student/StartExam.aspx");
               // Response.Write("<script>window.open('StartExam.aspx','newwindow','status=1,scrollbars=1,resizable=1')</script>");
                //Response.Write("<script>window.opener=null;window.close();</script>");
            }
            else
            {
                MessageBox.Show("该科目还没有该类题型的题目");
                return;
            }
        }
    }

    protected void ckbCheck_CheckedChanged(object sender, EventArgs e)
    {
        if (ckbCheck.Checked == true)
        {
            Button1.Enabled = true;
        }
        else
        {
            Button1.Enabled = false;
        }
    }
}
