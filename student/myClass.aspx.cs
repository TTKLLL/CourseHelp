using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_myClass : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
                dataBind();
        }
    }

    protected void dataBind()
    {
        string stuId = Request.Cookies["uId"].Value.ToString();
        var items = (db.proc_getClassInfoByStuId(stuId)).First();
        Label1.Text = items.TeachingClassName;
        Label2.Text = items.PublishTime.ToString();

        var teachers = db.proc_selectTeacherByStuId(stuId);
        Repeater1.DataSource = teachers;
        Repeater1.DataBind();

        Label3.Text = (db.proc_classNumByStuId(stuId)).ToString();
    }


}