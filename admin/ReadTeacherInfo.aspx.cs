using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
public partial class admin_TeacherManage_ReadTeacherInfo : System.Web.UI.Page
{

     public string generateMd5(string oldPwd) //密码加密
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

 
    DataClassesDataContext db = new DataClassesDataContext();
    string Query = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
            {
                tb_Query.Text = Query;
                BindData();
            }
        }
    }

    private void BindData()
    {
        
        string uId = Request.Cookies["uId"].Value; //获取用户ID
        int typeId = int.Parse(Request.Cookies["uType"].Value.ToString()); //获取用户的类型
       
       //if (typeId == 0 || typeId == 1)
       // {
       //     //UserType = 1; //判断出来是老师
       // }
       // else if ( typeId == 1)
       // {       
        // }

        //var AdminInfo = (from p in db.adminInformation
        //                 where p.userName != 1 && p.userName != uerName && p.tname.Contains(Query)
        //                 select p).ToList();


        var TeacherInfo = (from c in db.teacher
                   where c.teacherType != typeId && c.teacherName.Contains(Query)
                   select c).ToList();

      

        //var TeacherInfo = (from p in db.proc_SelectAdminInfo(NewType)
        //                   where p.teacherName.Contains(Query)
        //                   select p).ToList();
        //   数据源
        PagedDataSource Pgds = new PagedDataSource();
        //        
        Pgds.DataSource = TeacherInfo;
        //        设置允许分页
        Pgds.AllowPaging = true;
        //        每页显示为15行
        Pgds.PageSize = 15;
        //        显示总共页数
        //
        lblTotalPage.Text = Pgds.PageCount.ToString();
        //        当前页
        int CurrentPage;
        //        请求页码为不为null设置当前页，否则为第一页
        if (Request.QueryString["Page"] != null)
        {
            CurrentPage = Convert.ToInt32(Request.QueryString["Page"]);
        }

        else
        {
            CurrentPage = 1;
        }
        //   当前页所引为页码-1
        Pgds.CurrentPageIndex = CurrentPage - 1;
        //   显示当前页码
        lblCurrentPage.Text = CurrentPage.ToString();
        //   如果不是第一页，通过参数Page设置上一页为当前页-1，否则不显示连接
        if (!Pgds.IsFirstPage)
        {
            //            Request.CurrentExecutionFilePath为当前请求虚拟路径
            lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage - 1) + "&Query=" + Query;
        }
        //        End If
        //   如果不是最后一页，通过参数Page设置下一页为当前页+1，否则不显示连接
        if (!Pgds.IsLastPage)
        {
            //    Request.CurrentExecutionFilePath为当前请求虚拟路径
            lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurrentPage + 1) + "&Query=" + Query;
        }
        //   模板绑定数据源  
        rp_AdminInfo.DataSource = Pgds;
        rp_AdminInfo.DataBind();
    }

    protected void bt_Delete_Click(object sender, EventArgs e)
    {
        int TypeId = 1;
        string uId = Request.Cookies["uId"].Value; //获取用户ID
       //int typeId = int.Parse(Request["uType"].ToString()); //获取用户的类型
        //string  typeId = Request.Cookies["uType"].Value;

        bool flag = false;
        try
        {
            foreach (RepeaterItem item in rp_AdminInfo.Items)
            {
                if (((CheckBox)item.FindControl("cb_sel")).Checked == true)
                {
                    flag = true;
                    //int userName = Convert.ToInt32((item.FindControl("hi_userName") as HiddenField).Value);
                    string teacherId = ((HiddenField)item.FindControl("hi_userName")).Value.ToString();
                    var results = from r in db.teacher where r.teacherId == teacherId && r.teacherType == TypeId select r;
                   //var results = from r in db.adminInformation where r.userName == userName select r;
                   //var AutorityRes = from r in db.AdminAutority where r.userName == userName select r;
                   //db.adminInformation.DeleteAllOnSubmit(results);
                    db.teacher.DeleteAllOnSubmit(results);
                    //db.adminInformation.DeleteAllOnSubmit(results);
                    //db.AdminAutority.DeleteAllOnSubmit(AutorityRes);
                    db.SubmitChanges();
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('删除失败，请重试！');</script>");
            return;
        }        
        if (flag == false)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('请先勾选老师！');</script>");
            return;
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "<script>alert('删除成功！');</script>");
        BindData();
    }

    protected void bt_Reset_Click(object sender, EventArgs e)
    {
        //string uId = Request.Cookies["uId"].Value; //获取用户ID
        //int typeId = int.Parse(Request["uType"].ToString()); //获取用户的类型
        //string  typeId = Request.Cookies["uType"].Value;

        bool flag = false;
        try
        {
            foreach (RepeaterItem item in rp_AdminInfo.Items)
            {
                if (((CheckBox)item.FindControl("cb_sel")).Checked == true)
                {
                    flag = true;
                    //int userName = Convert.ToInt32((item.FindControl("hi_userName") as HiddenField).Value);
                    string teacherId = ((HiddenField)item.FindControl("hi_userName")).Value.ToString();
                    string newTeacherPWD = generateMd5(teacherId);
                    //NewStuPWD = generateMd5(result.First().studentId);
                    if (db.proc_RestTeacherPWD(teacherId, newTeacherPWD) < 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('重置失败，请重试！');</script>");
                        return;
                    }
                    else if(db.proc_RestTeacherPWD(teacherId, newTeacherPWD) == 0)
                    {

                        db.SubmitChanges();
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "<script>alert('密码已重置为教师工号！');</script>");
                     }
                    
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('重置失败，请重试！');</script>");
            return;
        }
        if (flag == false)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('请先勾选老师！');</script>");
            return;
        }
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "<script>alert('密码已重置为教师工号！');</script>");
        BindData();
    }
    
          protected void bt_Query_Click(object sender, EventArgs e)
        {
            Query = tb_Query.Text;
            Response.Redirect("ReadTeacherInfo.aspx?Query=" + Query);
        }
     
}