using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_classExercise : System.Web.UI.Page
{
    private DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["uId"] == null)
            ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
        else
            bindData();
    }

    protected void bindData()
    {
        string myStuId = Request.Cookies["uId"].Value.ToString();
        int classId = int.Parse((db.proc_getclassIdByStuId(myStuId)).First().TeachingClassId.ToString());
        myClassMates.DataSource = db.proc_numberOfClass(classId);
        myClassMates.DataBind();
    }


    protected void myClassMates_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string myStuId = Request.Cookies["uId"].Value.ToString();
        int classId = int.Parse((db.proc_getclassIdByStuId(myStuId)).First().TeachingClassId.ToString());
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Label order = (Label)e.Row.Cells[0].FindControl("order");
            order.Text = (myClassMates.PageIndex * myClassMates.PageSize + e.Row.RowIndex + 1).ToString();

            string stuId = ((Label)e.Row.Cells[5].FindControl("Label1")).Text.ToString();
            HyperLink sRight = (HyperLink)e.Row.Cells[4].FindControl("HyperLink1");

            HyperLink fRight = (HyperLink)e.Row.Cells[5].FindControl("HyperLink3");


            sRight.Text = ((from p in db.proc_singleDoByStu(stuId)
                            where p.IsRight == true
                            select p)).ToArray().Length.ToString();

            fRight.Text = ((from p in db.proc_FillBlankDoByStu(stuId)
                            where p.IsRight == true
                            select p)).ToArray().Length.ToString();


            Label uploadSingle = (Label)e.Row.Cells[6].FindControl("Label2");
            Label uploadFill = (Label)e.Row.Cells[7].FindControl("Label3");
            int? sNum = 0;
            int? fNum = 0;
            var result = db.proc_selectNumOfUpload(stuId, ref sNum, ref fNum);
            uploadSingle.Text = sNum.ToString();
            uploadFill.Text = fNum.ToString();


        }
    }

    protected void myClassMates_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        myClassMates.PageIndex = e.NewPageIndex;
        bindData();

    }
}