using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Studetnt_Practice_PracticeManage : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
       // uId = Session["uId"].ToString();
        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
            {
                GetPractice();
                GetPracticeCount();
            }
            
        }
    }

    public void GetPracticeCount()
    {
        int? SigleCount = 0;
        int? FillBlankCount = 0;
        string uId = Request.Cookies["uId"].Value.ToString();
        for (int i = 0; i < gvPractice.Rows.Count; i++)
        {
            System.Web.UI.WebControls.Label lbNo = (System.Web.UI.WebControls.Label)gvPractice.Rows[i].Cells[0].FindControl("lbNo");
            int pointID = Convert.ToInt32(lbNo.Text.ToString().Trim());
            db.proc_SelectHaveDoCountByPointID(pointID,uId,ref SigleCount,ref FillBlankCount);
                          
            int[] aNum = new int[] { Convert.ToInt32(SigleCount), Convert.ToInt32(FillBlankCount) };
            for (int j = 0; j < 2; j++)
            {
                System.Web.UI.WebControls.Label lbChosedCount = (System.Web.UI.WebControls.Label)(gvPractice.Rows[i].Cells[6].FindControl("lb" + j));
                lbChosedCount.Text = Convert.ToString(aNum[j]);
            }

        }
    }
    public void GetPractice()
    {
 
        string uId = Request.Cookies["uId"].Value.ToString();
        var resultQuery = from c in db.proc_GetPractice(uId)
                     select c;
        gvPractice.DataSource = resultQuery;
        gvPractice.DataBind();
       

       
    }

 
 
    protected void gvPractice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)e.Row.Cells[1].FindControl("label");
            lbl.Text = (gvPractice.PageIndex * gvPractice.PageSize + e.Row.RowIndex + 1).ToString();
        }
       
    }
    
    protected void gvPratice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPractice.PageIndex = e.NewPageIndex;
        GetPractice();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //string levelPoint = TextBox1.Text.ToString().Trim();
        //var result = from c in db.proc_FindPoint(levelPoint)
        //             select c;

        //gvPractice.DataSource = result;
        //gvPractice.DataBind();
        //TextBox1.Text = "";
    }
}