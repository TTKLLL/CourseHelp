using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_OpenDateManager : System.Web.UI.Page
{


    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
                BindData();
        }

    }
    private void BindData()
    {
        var resultOpenDate = from p in db.proc_GetOpenDate()
                             select p;
        rp_OpenDate.DataSource = resultOpenDate;
        rp_OpenDate.DataBind();
    }
    protected void bt_Submit_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (RepeaterItem item in rp_OpenDate.Items)
            {
                int openId = Convert.ToInt32(((HiddenField)item.FindControl("openId")).Value);
                DateTime? startDate = null;
                DateTime? endDate = null;
                if (((HiddenField)item.FindControl("hd_StartDate")).Value != "")
                    startDate = Convert.ToDateTime(((HiddenField)item.FindControl("hd_StartDate")).Value);
                if (((HiddenField)item.FindControl("hd_EndDate")).Value != "")
                    endDate = Convert.ToDateTime(((HiddenField)item.FindControl("hd_EndDate")).Value);

                db.proc_UpdateOpenDate(openId, startDate, endDate);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('修改出错！')</script>");
            return;
        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('修改成功！')</script>");
        BindData();
    }
}