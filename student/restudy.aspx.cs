using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class restudy : System.Web.UI.Page
{
    protected DataClassesDataContext db =new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindtclass();
        }
    }
    protected void Bindtclass()
    {
        var teaclass = db.proc_GetTeachingclass();
        ListItem listItem;
        foreach (var item in teaclass.ToArray())
        {
            listItem = new ListItem();
            listItem.Text = item.TeachingClassName;
            listItem.Value = item.TeachingClassId.ToString();
            Tclass.Items.Add(listItem);
            listItem = null;
        }
    }
    protected void isrestudy_Click(object sender, EventArgs e)
    {
        var resultsid = (from p in db.proc_GetSid(sno.Text)
                         select p).ToList();
        if (resultsid.Count() > 0)//判断学生是否注册
        {
            if (Tclass.SelectedIndex == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('教学班不能为空！');</script>");
                return;
            }
            if (resultsid.Count() > 0)//判断学生是否存在
            {
                string uId = sno.Text.Trim();
                string pwd = generateMd5(tb_password.Text.Trim());
                var ab = (from p in db.proc_Getstustste(uId)
                             select p).First();
                int state = int.Parse(ab.studentState.ToString()) ;
                int? type = 0;
                int result = db.proc_LogIn(uId, pwd, ref type);
                if (result == 1)//判断密码是否正确
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('密码错误！');</script>");
                    return;
                }
                if (Tclass.SelectedIndex == 0)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('教学班不能为空！');</script>");
                    return;
                }
                if (state == 0 || state == 2)
                {
                   ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('该学号未被注册，不能使用申请重修功能！');</script>");
                   return;
                }
                if (state == 3)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('您已申请重修，请耐心等待审核！');</script>");
                    return;
                }
                if (state == 1)
                {
                    db.proc_updatestustate(uId);
                    db.proc_updatetclass(uId, int.Parse(Tclass.SelectedValue));
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "succeed", "<script>window.alert('申请重修成功！');</script>");
                    db.SubmitChanges();
                }
            }
            else 
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('该学号未被注册，不能使用申请重修功能！');</script>");
                return;
            }
        }
    }
    protected string generateMd5(string oldPwd)
    {
        string newPwd = "";
        if (oldPwd != "")
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = System.Text.ASCIIEncoding.Unicode.GetBytes(oldPwd);
            byte[] targetData = md5.ComputeHash(fromData);
            for (int i = 0; i < targetData.Length; i++)
                newPwd += targetData[i].ToString();
        }
        return newPwd;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }
}