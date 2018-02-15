using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

public partial class register : System.Web.UI.Page
{
    protected DataClassesDataContext db =new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindquestion();
            Bindtclass();
           

        }
    }
    protected void Bindquestion()
    {
        var secquestion = db.proc_Getsecurity();
        ListItem listItem;
        foreach (var item in secquestion.ToArray())
        {
            listItem = new ListItem();
            listItem.Text = item.question;
            listItem.Value = item.question;
            pwdreq1.Items.Add(listItem);
            pwdreq2.Items.Add(listItem);
            listItem = null;
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

    protected void Regiser_Click(object sender, EventArgs e)
    {
        var resultsid = (from p in db.proc_GetSid(sno.Text)
                      select p).ToList();
        var resultstuphone = (from p in db.proc_GetstuPhone(tb_phone.Text)
                              select p).ToList();
        if (resultsid.Count() > 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('该学号号已被注册，请使用找回密码功能！');</script>");
            return;
        }
        if (resultstuphone.Count() > 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('该手机号已被注册，请使用找回密码功能！');</script>");
            return;
        }
        if (tb_password.Text.ToString().Length < 4)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('密码太短，为确保账户安全请重新设置！');</script>");
            return;
        }
        if (Tclass.SelectedIndex == 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('教学班不能为空！');</script>");
            return;
        }
        if (pwdreq1.SelectedIndex == 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('密保问题一不能为空！');</script>");
            return;
        }
        if (pwdreq2.SelectedIndex == 0)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('密保问题二不能为空！');</script>");
            return;
        }
        if (tb_password.Text != tb_Cpassword.Text)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('两次密码输入不一致！');</script>");
            return;
        }
        DateTime Time = DateTime.Now.ToLocalTime();
       try
        {
            if (db.proc_Register(sno.Text.Trim(), int.Parse(Tclass.SelectedValue), generateMd5(tb_password.Text.Trim()), tb_name.Text.Trim(), classname.Text.Trim(), tb_phone.Text.Trim(), tb_email.Text.Trim(), Time, pwdreq1.SelectedItem.Text.Trim(), tb_answerOne.Text.Trim(), pwdreq2.SelectedItem.Text.Trim(), tb_answerTwo.Text.Trim(), 0) == -1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('注册失败！');</script>");
                return;
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "succeed", "<script>window.alert('注册成功！');window.location='../Login.aspx';</script>");
                db.SubmitChanges();
            }
        }
        catch
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>window.alert('注册失败,请重试！');</script>");
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
    protected void restudy_Click(object sender, EventArgs e)
    {
         Response.Redirect("../LogIn.aspx");
    }
}