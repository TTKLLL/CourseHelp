using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_singleDetail : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
                bindData();
        }
    }

    protected void bindData()
    {
        int sId = int.Parse(Request.QueryString["sId"]);
        Repeater1.DataSource = from p in db.proc_selectSingle()
                               where p.SID == sId
                               select p;
        Repeater1.DataBind();

        for (int i = 0; i < this.Repeater1.Items.Count; i++)
        {
            //绑定选择题知识点
            int singleId = int.Parse(((Label)Repeater1.Items[i].FindControl("Label8")).Text);
            var points = (db.proc_GetPointByTitleId(singleId)).First();
            Label labelPoint = (Label)Repeater1.Items[i].FindControl("Label7");
            labelPoint.Text = points.LevelOnePoint + " " + points.LevelTwoPoint;

            //绑定题目审核状态
            Label titleStateLabel = (Label)Repeater1.Items[i].FindControl("Label13");
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

    public string sub(string str)
    {
        return str.Substring(3, str.Length - 7);
    }
}