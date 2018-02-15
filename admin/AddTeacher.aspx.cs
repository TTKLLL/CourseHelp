using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_TeacherManage_AddTeacher : System.Web.UI.Page
{



    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {

            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            
        }
    }

    protected void bt_Save_Click(object sender, EventArgs e)
    {
        int TypeId= 1;
        if (tb_Pwd.Text.ToString().Trim().Length < 4)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('密码太短，为确保账户安全请重新设置！');</script>");
            return;
        }
        if (db.proc_AddTeacher(tb_TeaNO.Text.Trim(),tb_Pwd.Text.Trim(),tb_name.Text.Trim(),TypeId, tb_Phone.Text.Trim(), tb_Email.Text.Trim()) ==-4)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('添加老师失败！')</script>");
        }
        else
        {
            db.SubmitChanges();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('添加老师成功！');window.location='ReadTeacherInfo.aspx'</script>");
        }
    }

    //protected void bt_confirm_Click(object sender, EventArgs e)
    //{
    //    string pwd = tb_CheckPwd.Text.ToString().Trim();
    //    int uername = Convert.ToInt32(Session["userName"].ToString());
    //    var result = (from p in db.adminInformation
    //                  where p.userName == uername
    //                  select p).ToList();
    //    if (db.proc_LoginCheck(result.First().tphone, pwd) == 1)
    //    {
    //        pl_CheckPwd.Visible = false;
    //        pl_AdmInfo.Visible = true;
    //    }
    //    else
    //    {
    //        ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('密码输入错误！');</script>");
    //    }
    //}




}