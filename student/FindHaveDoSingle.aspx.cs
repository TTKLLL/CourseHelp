using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_FindHaveDoSingle : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            currentPageCount.Text = "1";
            bindSingle();//绑定单选题    
        }
    }


    protected void bindSingle()//绑定单选题
    {
        PagedDataSource pds = new PagedDataSource();
       
        string stuId = Request.Cookies["uId"].Value.ToString();
        var result = (from c in db.proc_GetHaveDoSingle(stuId)
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
        DataList1.DataSource = pds;
        DataList1.DataBind();
        foreach (DataListItem dl in DataList1.Items)
        {

            System.Web.UI.WebControls.Label lbPoint = (System.Web.UI.WebControls.Label)dl.FindControl("Label8");
            System.Web.UI.WebControls.Label lbSingle = (System.Web.UI.WebControls.Label)dl.FindControl("Label2");
            System.Web.UI.WebControls.Label lbPoint1 = (System.Web.UI.WebControls.Label)dl.FindControl("Label7");
            int lbSingleID = Convert.ToInt32(lbSingle.Text.ToString().Trim());
            var result1 = (from c in db.proc_GetPointByTitleId(lbSingleID)
                           select c).First();
            lbPoint1.Text = result1.LevelOnePoint + ">" + result1.LevelTwoPoint;
            System.Web.UI.WebControls.RadioButtonList radio1 = (System.Web.UI.WebControls.RadioButtonList)dl.FindControl("RadioButtonList1");
            System.Web.UI.WebControls.Label lbAnswer = (System.Web.UI.WebControls.Label)dl.FindControl("titleNote");

            if (lbAnswer.Text.ToString().Trim() == "A")
            {
                radio1.Items[0].Selected = true;
            }
            else if (lbAnswer.Text.ToString().Trim() == "B")
            {
                radio1.Items[1].Selected = true;
            }
            else if (lbAnswer.Text.ToString().Trim() == "C")
            {
                radio1.Items[2].Selected = true;
            }
            else if (lbAnswer.Text.ToString().Trim() == "D")
            {
                radio1.Items[3].Selected = true;
            }
        }
        if (DataList1.Items.Count == 0)
        {
            PanelC1.Visible = false;
            LabelC1.Text = "您还未做作业，请先做作业!";
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
        bindSingle();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && Convert.ToInt32(TextBox1.Text) <= Convert.ToInt32(pageCount.Text) && Convert.ToInt32(TextBox1.Text) > 0)
        {
            currentPageCount.Text = TextBox1.Text;
            bindSingle();
        }
        else
        {
            Response.Write("<script>alert('请重新输入！')</script>");
        }
    }

     
     
}

