using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_FindHaveDoFillBlank : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            currentPageCount.Text = "1";
            bindFillBlank();//绑定填空题

        }
    }

    protected void bindFillBlank()
    {
        PagedDataSource pds = new PagedDataSource();

        string stuId = Request.Cookies["uId"].Value.ToString();
        var result = (from c in db.proc_GetHaveDoFillBlank(stuId)
                      select c).ToList();
        pds.DataSource = result;
        pds.PageSize = 1;
        pds.AllowPaging = true;
        pageCount.Text = pds.PageCount.ToString();//设置总的页数
        pds.CurrentPageIndex = Convert.ToInt32(currentPageCount.Text) - 1;//获取当前的页码
        if (pds.IsFirstPage)
        {
            first.Enabled = false;
            prev.Enabled = false;
        }
        else
        {
            first.Enabled = true;
            prev.Enabled = true;
        }
        if (pds.IsLastPage)
        {
            next.Enabled = false;
            last.Enabled = false;
        }
        else
        {
            next.Enabled = true;
            last.Enabled = true;
        }
        DataList2.DataSource = pds;
        DataList2.DataBind();

        foreach (DataListItem dl in DataList2.Items)
        {

            System.Web.UI.WebControls.Label lbPoint = (System.Web.UI.WebControls.Label)dl.FindControl("Label8");
            System.Web.UI.WebControls.Label lbFillBlank = (System.Web.UI.WebControls.Label)dl.FindControl("Label2");
            System.Web.UI.WebControls.Label lbPoint1 = (System.Web.UI.WebControls.Label)dl.FindControl("Label7");
            int? lbFillBlankID = Convert.ToInt32(lbFillBlank.Text.ToString().Trim());
            var result1 = (from c in db.proc_GetPointFillBlankByTitleId(lbFillBlankID)
                           select c).First();
            lbPoint1.Text = result1.LevelOnePoint + ">" + result1.LevelTwoPoint;

        }
         
    }

    public string sub(string str)
    {
        return str.Substring(3, str.Length - 7);
    }
    protected void buttonPage_Click(object sender, EventArgs e)
    {
        if (((LinkButton)sender).CommandName == "first")
        {
            currentPageCount.Text = "1";
        }
        if (((LinkButton)sender).CommandName == "prev")
        {
            currentPageCount.Text = Convert.ToString(Convert.ToInt32(currentPageCount.Text) - 1);
        }
        if (((LinkButton)sender).CommandName == "next")
        {
            currentPageCount.Text = Convert.ToString(Convert.ToInt32(currentPageCount.Text) + 1);
        }
        if (((LinkButton)sender).CommandName == "last")
        {
            currentPageCount.Text = pageCount.Text;
        }
        bindFillBlank();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && Convert.ToInt32(TextBox1.Text) <= Convert.ToInt32(pageCount.Text) && Convert.ToInt32(TextBox1.Text) > 0)
        {
            currentPageCount.Text = TextBox1.Text;
            bindFillBlank();
        }
        else 
        {
            Response.Write("<script>alert('请重新输入！')</script>");
        }
    }
}
