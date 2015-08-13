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

public partial class student_StartExam : System.Web.UI.Page
{

    public string Ans = "";
    public int tNUM=1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            lblEndtime.Text = "考试时间为15分钟，每小题1分，考试已用时：";
            lblStuNum.Text = Session["ID"].ToString();
            lblStuName.Text = Session["name"].ToString();
            lblStuSex.Text = Session["sex"].ToString();
            lblStuKM.Text = "[" + Session["KM"].ToString() + "&nbsp;"+Session["TX"].ToString()+"]" + "考试试题";
            int i = 1;
            SqlConnection conn = BaseClass.DBCon();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select  * from tb_test where testCourse='" + Session["KM"].ToString() + "' and Examtype='"+Session["TX"].ToString()+"' ", conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {

               
                string str = "判断题";
                string str0 = "单选题";
                if (Session["TX"].ToString() == str)
                {
                  
                    Literal littxt = new Literal();
                    Literal litti = new Literal();
                    RadioButtonList cbk = new RadioButtonList();
                    cbk.ID = "cbk" + i.ToString();
                    littxt.Text = i.ToString() + "、" + Server.HtmlEncode(sdr["testContent"].ToString()) + "<br><Blockquote>";
                    litti.Text = "</Blockquote>";
                    cbk.Items.Add("A. " + Server.HtmlEncode(sdr["testAns1"].ToString()));
                    cbk.Items.Add("B. " + Server.HtmlEncode(sdr["testAns2"].ToString()));
                    cbk.Font.Size = 72;
                    Ans += sdr["rightAns"].ToString();
              
                        Session["Ans"] = Ans;
               
                    Panel1.Controls.Add(littxt);
                    Panel1.Controls.Add(cbk);
                    Panel1.Controls.Add(litti);
                    i++;
                    tNUM++;
                }
                else if (Session["TX"].ToString() == str0)
                {
                    Literal littxt = new Literal();
                    Literal litti = new Literal();
                    RadioButtonList cbk = new RadioButtonList();
                    cbk.ID = "cbk" + i.ToString();
                    littxt.Text = i.ToString() + "、" + Server.HtmlEncode(sdr["testContent"].ToString()) + "<br><Blockquote>";
                    litti.Text = "</Blockquote>";
                    cbk.Items.Add("A. " + Server.HtmlEncode(sdr["testAns1"].ToString()));
                    cbk.Items.Add("B. " + Server.HtmlEncode(sdr["testAns2"].ToString()));
                    cbk.Items.Add("C. " + Server.HtmlEncode(sdr["testAns3"].ToString()));
                    cbk.Items.Add("D. " + Server.HtmlEncode(sdr["testAns4"].ToString()));
                    cbk.Font.Size = 72;
                    Ans += sdr["rightAns"].ToString();

                    Session["Ans"] = Ans;

                    Panel1.Controls.Add(littxt);
                    Panel1.Controls.Add(cbk);
                    Panel1.Controls.Add(litti);
                    i++;
                    tNUM++;
                }
                else
                {
                   
                    Literal littxt = new Literal();
                    Literal litti = new Literal();
                    CheckBoxList cbk = new CheckBoxList();
                    cbk.ID = "cbk" + i.ToString();
                    littxt.Text = i.ToString() + "、" + Server.HtmlEncode(sdr["testContent"].ToString()) + "<br><Blockquote>";
                    litti.Text = "</Blockquote>";
                    cbk.Items.Add("A. " + Server.HtmlEncode(sdr["testAns1"].ToString()));
                    cbk.Items.Add("B. " + Server.HtmlEncode(sdr["testAns2"].ToString()));
                    cbk.Items.Add("C. " + Server.HtmlEncode(sdr["testAns3"].ToString()));
                    cbk.Items.Add("D. " + Server.HtmlEncode(sdr["testAns4"].ToString()));
                    cbk.Font.Size = 72;
                    Ans += sdr["rightAns"].ToString();
                
                        Session["Ans"] = Ans;
                
                    Panel1.Controls.Add(littxt);
                    Panel1.Controls.Add(cbk);
                    Panel1.Controls.Add(litti);
                    i++;
                    tNUM++;
                }
                
               
            }
            sdr.Close();
            conn.Close();
          
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string Stu = "";
        for (int i = 1; i <= tNUM; i++)
        {
            string str = "判断题";
            string str0 = "单选题";
            if (Session["TX"].ToString() == str)
            {
                RadioButtonList list = (RadioButtonList)Panel1.FindControl("cbk" + i.ToString());
                if (list != null)
                {
                    for (int k = 1; k <= 2; k++)
                    {
                        if (list.Items[k - 1].Selected == true)
                        {
                            Stu += "1";
                        }
                        else
                        {
                            Stu += "0";
                        }
                    }
                }
              }
            else if (Session["TX"].ToString() == str0)
            {
                RadioButtonList list = (RadioButtonList)Panel1.FindControl("cbk" + i.ToString());
                if (list != null)
                {
                    for (int j = 1; j <= 4; j++)
                    {
                        if (list.Items[j - 1].Selected == true)
                        {

                            Stu += "1";
                        }
                        else
                        {
                            Stu += "0";
                        }
                    }
                }
            }
            else
            {
                CheckBoxList list = (CheckBoxList)Panel1.FindControl("cbk" + i.ToString());
                if (list != null)
                {
                    for (int j = 1; j <= 4; j++)
                    {
                        if (list.Items[j - 1].Selected == true)
                        {

                            Stu += "1";
                        }
                        else
                        {
                            Stu += "0";
                        } 
                    }
                }
            }
          
            
        }
        Session["Sans"] = Stu;//考生答案
        string sql = "update tb_score set RightAns='" + Session["Ans"].ToString() + "' where StudentID='" + lblStuNum.Text + "' and LessonName='"+Session["KM"].ToString()+"' and Examtype='"+Session["TX"].ToString()+"'";
        BaseClass.OperateData(sql);
        string strsql = "update tb_score set StudentAns='" + Session["Sans"].ToString() + "' where StudentID='" + lblStuNum.Text + "' and LessonName='" + Session["KM"].ToString() + "' and Examtype='" + Session["TX"].ToString() + "'";
        BaseClass.OperateData(strsql);
        Response.Redirect("result.aspx?BInt=" + tNUM.ToString());
    }
}
