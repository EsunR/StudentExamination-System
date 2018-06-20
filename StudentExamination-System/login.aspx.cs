using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class login : System.Web.UI.Page
{
    private SqlConnection con;
    private SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// 打开数据库
    /// </summary>
    private void OpenDB()
    {
        string strCon = WebConfigurationManager.ConnectionStrings["SES_ConnectionString"].ConnectionString;
        con = new SqlConnection(strCon);
        cmd = new SqlCommand();
        cmd.Connection = con;
        con.Open();
    }

    //登录按钮
    protected void stu_login_Click(object sender, EventArgs e)
    {
        OpenDB();
        cmd.CommandText = "select * from students where stu_id = '" + stu_id.Text + "'";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if(stu_psw.Text.ToString() == dr[1].ToString())
            {
                Response.Cookies["stu_id"].Value = dr[0].ToString();
                Response.Cookies["stu_id"].Expires = DateTime.Now.AddDays(7);
                Response.Redirect("student.aspx");
            }
            else
            {
                Response.Write("<script>alert('密码错误请重试')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('ops！没有找到该用户！')</script>");
        }
        con.Close();
    }

    protected void teacher_login_Click(object sender, EventArgs e)
    {
        OpenDB();
        cmd.CommandText = "select * from teacher where stu_id = '" + teacher_id.Text + "'";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (stu_psw.Text.ToString() == dr[1].ToString())
            {
                Response.Cookies["teacher_id"].Value = dr[0].ToString();
                Response.Cookies["teacher_id"].Expires = DateTime.Now.AddDays(7);
                Response.Redirect("teacher.aspx");
            }
            else
            {
                Response.Write("<script>alert('密码错误请重试')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('ops！没有找到该用户！')</script>");
        }
        con.Close();
    }

    protected void admin_login_Click(object sender, EventArgs e)
    {
        OpenDB();
        cmd.CommandText = "select * from admin where admin_id = '" + admin_id.Text + "'";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (stu_psw.Text.ToString() == dr[1].ToString())
            {
                Response.Cookies["admin_id"].Value = dr[0].ToString();
                Response.Cookies["admin_id"].Expires = DateTime.Now.AddDays(7);
                Response.Redirect("admin.aspx");
            }
            else
            {
                Response.Write("<script>alert('密码错误请重试')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('ops！没有找到该用户！')</script>");
        }
        con.Close();
    }

    //注册按钮
    protected void re_stu_btn_Click(object sender, EventArgs e)
    {
        OpenDB();
        try
        {
            cmd.CommandText = "exec register_stu '"+ re_stu_id.Text.ToString()+"', '"+ re_stu_psw.Text.ToString() + "', '"+ re_stu_name.Text.ToString() + "', '"+ re_stu_sex.Text.ToString() + "', '"+ re_stu_phone.Text.ToString() + "', '"+ re_stu_time.Text.ToString() +"', '"+ re_stu_class.Text.ToString() + "'";
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('注册成功！')</script>");
        }
        catch
        {
            Response.Write("<script>alert('该用户名已被占用或输入日期格式有误，请重新审核！')</script>");
        }
        finally
        {
            con.Close();
        }
    }

    protected void re_teacher_btn_Click(object sender, EventArgs e)
    {
        OpenDB();
        try
        {
            cmd.CommandText = "exec register_teacher '" + re_teacher_id.Text.ToString() + "', '" + re_teacher_psw.Text.ToString() + "', '" + re_teacher_name.Text.ToString() + "', '" + re_teacher_sex.Text.ToString() + "', '" + re_teacher_phone.Text.ToString() + "', '" + re_teacher_time.Text.ToString() + "'";
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('注册成功！')</script>");
        }
        catch
        {
            Response.Write("<script>alert('该用户名已被占用或输入日期格式有误，请重新审核！')</script>");
        }
        finally
        {
            con.Close();
        }
    }

    protected void re_admin_btn_Click(object sender, EventArgs e)
    {
        OpenDB();
        try
        {
            cmd.CommandText = "exec register_admin '" + re_admin_id.Text.ToString() + "', '" + re_admin_psw.Text.ToString() + "', '" + re_admin_name.Text.ToString() + "', '" + re_admin_sex.Text.ToString() + "', '" + re_admin_phone.Text.ToString() + "'";
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('注册成功！')</script>");
        }
        catch
        {
            Response.Write("<script>alert('该用户名已被占，请重新填写！')</script>");
        }
        finally
        {
            con.Close();
        }
    }
}