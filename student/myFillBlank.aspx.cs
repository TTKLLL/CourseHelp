using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_myFillBlank : System.Web.UI.Page
{
    protected DataClassesDataContext db = new DataClassesDataContext();
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
        string stuId = Request.Cookies["uId"].Value;
        myFillBlank.DataSource = (from p in db.proc_GetFillBlank()
                                  where p.studentId == stuId
                                  select p).ToArray();
        myFillBlank.DataBind();

    }

    protected void mySingle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //序号
            Label order = (Label)e.Row.Cells[0].FindControl("order");
            order.Text = (myFillBlank.PageIndex * myFillBlank.PageSize + e.Row.RowIndex + 1).ToString();

            //知识点
            int pId = int.Parse(((Label)e.Row.Cells[1].FindControl("Label2")).Text);
            Label leveOne = (Label)e.Row.Cells[1].FindControl("Label2");
            Label leveTwo = (Label)e.Row.Cells[1].FindControl("levelTwo");
            var item = (db.proc_selectPointByPId(pId)).First();
            leveOne.Text = item.LevelOnePoint;
            leveTwo.Text = item.LevelTwoPoint;

            //审核状态
            Label stateLabel = (Label)e.Row.Cells[5].FindControl("state");
            int state = int.Parse(stateLabel.Text.ToString());

            switch (state)
            {
                case 0: stateLabel.Text = "等待老师审核"; break;
                case 1: stateLabel.Text = "未通过老师审核"; break;
                case 2: stateLabel.Text = "已通过老师审核"; break;
                case 3: stateLabel.Text = "未通过管理员审核"; break;
                case 4: stateLabel.Text = "已通过管理员审核"; break;
                default: break;
            }

            HyperLink titleLink = (HyperLink)e.Row.Cells[3].FindControl("title");
            Label fIdLabel = (Label)e.Row.Cells[3].FindControl("Label3");
            titleLink.NavigateUrl = "fillBlankDetail.aspx?fId=" + fIdLabel.Text;

        }
    }

    public string StringTruncat(string oldStr, int maxLength, string endWith)
    {
        if (string.IsNullOrEmpty(oldStr))
            //   throw   new   NullReferenceException( "原字符串不能为空 "); 
            return oldStr + endWith;
        if (maxLength < 1)
            throw new Exception("返回的字符串长度必须大于[0] ");
        if (oldStr.Length > maxLength)
        {
            string strTmp = oldStr.Substring(0, maxLength);
            if (string.IsNullOrEmpty(endWith))
                return strTmp;
            else
                return strTmp + endWith;
        }
        return oldStr;
    }

    protected void myFillBlank_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        myFillBlank.PageIndex = e.NewPageIndex;
        bindData();
    }
}
