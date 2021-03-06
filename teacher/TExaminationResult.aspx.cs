﻿using System;
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

public partial class teacher_TExaminationResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        if (!IsPostBack)
        {
            string strsql = "select * from tb_score order by ID asc";
            BaseClass.BindDG(gvExaminationresult, "ID", strsql, "result");
        }
    }
    protected void btnserch_Click(object sender, EventArgs e)
    {
        
       
        string type = ddltype.SelectedItem.Text;
        if (type == "学号")
        {
            string resultstr = "select * from tb_score where StudentID like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
            Session["num"] = "学号";
        }
        if (type == "姓名")
        {
            string resultstr = "select * from tb_score where StudentName like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
            Session["num"] = "姓名";
        }
    }
    protected void gvExaminationInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string type = ddltype.SelectedItem.Text;
        int id = (int)gvExaminationresult.DataKeys[e.RowIndex].Value;
        string strsql = "delete from tb_score where ID=" + id;
        BaseClass.OperateData(strsql);
        if (type == "学号")
        {
            string resultstr = "select * from tb_score where StudentID like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
        else if (type == "姓名")
        {
            string resultstr = "select * from tb_score where StudentName like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
        else
        {
            string resultstr = "select * from tb_score";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
    }
    protected void gvExaminationresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string type = ddltype.SelectedItem.Text;
        if (type == "学号")
        {
            gvExaminationresult.PageIndex = e.NewPageIndex;
            string resultstr = "select * from tb_score where StudentID like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
        else if (type == "姓名")
        {
            gvExaminationresult.PageIndex = e.NewPageIndex;
            string resultstr = "select * from tb_score where StudentName like '%" + txtkey.Text.Trim() + "%' and LessonName='" + Session["KCname"].ToString() + "'";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
        else
        {
            string resultstr = "select * from tb_score";
            BaseClass.BindDG(gvExaminationresult, "ID", resultstr, "result");
        }
    }
    protected void gvExaminationresult_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < gvExaminationresult.Rows.Count; i++)
        {
            gvExaminationresult.Rows[i].Cells[5].Attributes.Add("onclick","return confirm('确定要删除吗？')");
        }
    }
}
