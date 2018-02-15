using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_fillBlankDetail : System.Web.UI.Page
{
   // private PagedDataSource pageData = null;//具有分页信息的数据源
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else    
            //绑定我上传的单选题
                bindFillBlank();
  
        }
    }

    //绑定我上传的填空题
    protected void bindFillBlank()
    {
        int fId = int.Parse(Request.QueryString["fId"]);
        var items = from p in db.proc_GetFillBlank()
                    where p.FID == fId
                    select p;
        Repeater1.DataSource = items;
        Repeater1.DataBind();


        for (int i = 0; i < this.Repeater1.Items.Count; i++)
        {
            //绑定填空题知识点
            int singleId = int.Parse(((Label)Repeater1.Items[i].FindControl("Label8")).Text);
            var points = (db.proc_GetPointByPointId(singleId)).First();
            Label labelPoint = (Label)Repeater1.Items[i].FindControl("Label7");
            labelPoint.Text = points.LevelOnePoint + " " + points.LevelTwoPoint;

            //绑定上传者
            Label uploadStudentId = (Label)Repeater1.Items[i].FindControl("Label11");
            var student = (db.proc_GetStuInfo(uploadStudentId.Text)).ToArray();
            Label uploadStudentName = (Label)Repeater1.Items[i].FindControl("Label10");
            if (student.Length > 0)
                uploadStudentName.Text = "上传者：" + student.First().studentName;

            //绑定题目审核状态
            Label titleStateLabel = (Label)Repeater1.Items[i].FindControl("Label13");
            if (Request.Cookies["uType"].Value != "2")
                titleStateLabel.Visible = false;
            int titleState = int.Parse(((Label)Repeater1.Items[i].FindControl("Label12")).Text);
            switch (titleState)
            {
                case 0: titleStateLabel.Text = "等待老师审核"; break;
                case 1: titleStateLabel.Text = "未通过老师审核"; break;
                case 2: titleStateLabel.Text = "已通过老师审核"; break;
                case 3: titleStateLabel.Text = "未通过管理员审核"; break;
                case 4: titleStateLabel.Text = "已通过管理员审核"; break;
                default: break;
            }
        }
    }



    //截取题目标题外部的<p></p>标签
    public string sub(string str)
    {
        return str.Substring(3, str.Length - 7);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/public/addFillBLank.aspx");
    }
}