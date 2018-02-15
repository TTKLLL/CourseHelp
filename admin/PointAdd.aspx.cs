using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PointManage_PointAdd : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
                GetFirstPoint();
        }
       
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string tbFirstPoint1 = tbFirstPoint.Text.Trim();
        string tbSecondPoint1 = tbSecondPoint.Text.Trim();
        int isSucceed = db.proc_InsertNewPoint(tbFirstPoint1, tbSecondPoint1);
        if (isSucceed > 0)
        {
            Response.Write("<script>alert('成功保存');</script>");
            tbFirstPoint.Text = "";
            tbSecondPoint.Text = "";
            GetFirstPoint();
        }
        else
        {
            Response.Write("<script>alert('该知识点已经存在！请重新添加！')</script>");
        }
      
        var result = (from c in db.proc_SelectAllClassID()
                      select c).ToArray();
        int? pid = 0;
        db.proc_SelectLastPoint(tbFirstPoint1, tbSecondPoint1, ref pid);
  
        foreach (var item in result)
        {
            int id = Convert.ToInt32(item.TeachingClassId);

            db.proc_InsertPointByClassID(pid, id);
        }
       
    }

    public void GetFirstPoint()
    {
        var result = from c in db.proc_FindFirstPoint()
                     select c;
        dropFirstPoint.DataTextField = "LevelOnePoint";
        dropFirstPoint.DataValueField = "LevelOnePoint";
        dropFirstPoint.DataSource = result;
        dropFirstPoint.DataBind();
   
    }

    protected void dropFirstPoint_SelectedIndexChanged(object sender, EventArgs e)
    {
        tbFirstPoint.Text = dropFirstPoint.SelectedValue.ToString().Trim();
    }
}
