using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Admin_PointManage_PointManage : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    //int type ;
    //string uId ;
     
    protected void Page_Load(object sender, EventArgs e)
    {
       // type = Int32.Parse(Session["uType"].ToString());
       // uId = Session["uId"].ToString();
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
                GetPoint();
        }
    }
    private void GetPoint()
    {

        
        var resultQuery=from c in db.proc_GetPoint()
                        select c;
        gvPoint.DataSource = resultQuery;
        gvPoint.DataBind();
    }
    protected void gvPoint_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvPoint.EditIndex = e.NewEditIndex;
        GetPoint();
    }

    protected void gvPoint_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int? strId =Convert.ToInt32( gvPoint.DataKeys[e.RowIndex].Value.ToString());
        string secondPoint = ((System.Web.UI.WebControls.TextBox)(gvPoint.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
        db.proc_InsertPoint(strId, secondPoint);
        gvPoint.EditIndex = -1;
        GetPoint();
                     
    }


    protected void gvPoint_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvPoint.EditIndex = -1;
        GetPoint();
    }

    protected void gvPoint_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int? strId = Convert.ToInt32(gvPoint.DataKeys[e.RowIndex].Value.ToString());
        db.proc_DeletePoint(strId);
        GetPoint();

    }
    protected void gvPoint_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)e.Row.Cells[0].FindControl("label");
            lbl.Text = (gvPoint.PageIndex * gvPoint.PageSize + e.Row.RowIndex + 1).ToString();
        }
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[6].Attributes.Add("onclick", "return confirm('确定要删除该行吗？')");
        }
    }
    protected void cb2_CheckedChanged(object sender, EventArgs e)
    {
        bool IsSelect = cb2.Checked;
        for (int i = 0; i < gvPoint.Rows.Count; i++)
        {
            ((System.Web.UI.WebControls.CheckBox)(gvPoint.Rows[i].FindControl("cbSelect"))).Checked = IsSelect;
            //gvPoint.Rows[i].Cells[0].Controls[0].Visible = !IsSelect;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
          DialogResult result = MessageBox.Show("请确认是否要删除选中的记录行?", "信息提示!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2, MessageBoxOptions.ServiceNotification);
          if (result == DialogResult.OK)
          {
              
              bool flag = false;
              for (int i = 0; i <= gvPoint.Rows.Count - 1; i++)
              {
                  System.Web.UI.WebControls.CheckBox checkBox = (System.Web.UI.WebControls.CheckBox)gvPoint.Rows[i].FindControl("cbSelect");
                  if (checkBox.Checked == true)
                  {
                      int? id = Convert.ToInt32(((System.Web.UI.WebControls.Label)gvPoint.Rows[i].FindControl("lbNo")).Text.ToString().Trim());
                      db.proc_DeletePoint(id);
                      flag = true;
                  }
              }
              if (flag == true) { Response.Write("<script>alert('删除成功！')</script>"); }
              else { Response.Write("<script>alert('请先选择要删除的行！')</script>"); }
              cb2.Checked = false;
              GetPoint();
          }
          else { DialogResult.Cancel.Equals("true"); }

    }
    protected void gvPoint_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPoint.PageIndex = e.NewPageIndex;
        GetPoint();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //string levelPoint=TextBox1.Text.ToString().Trim();
        //var result=from c in db.proc_FindPoint(levelPoint)
        //           select c;
        
        //gvPoint.DataSource=result;
        //gvPoint.DataBind();
        //TextBox1.Text = "";
    }
}