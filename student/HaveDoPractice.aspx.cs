using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Studetnt_Practice_HaveDoPractice : System.Web.UI.Page
{
    DataClassesDataContext db = new DataClassesDataContext();

    //    System.Web.UI.WebControls.TextBox ta;
    //System.Web.UI.WebControls.Panel panel2;
    protected void Page_Load(object sender, EventArgs e)
    {
        //stuId=Session["uId"].ToString().Trim();


        if (!IsPostBack)
        {
            if (Request.Cookies["uId"] == null)
                ClientScript.RegisterClientScriptBlock(this.GetType(), "error", "<script>alert('登陆过期，请重新登陆！');window.parent.parent.location='../Login.aspx'</script>");
            else
            {
                bindSingle();//绑定单选题    
                bindFillBlank();//绑定填空题
            }


        }
    }


    protected void bindSingle()//绑定单选题
    {
        // int pointID = Convert.ToInt32(Request.QueryString["PointID"].ToString());
        string stuId = Request.Cookies["uId"].Value.ToString();
        var result = (from c in db.proc_GetHaveDoSingle(stuId)
                      select c).ToList();
        DataList1.DataSource = result;
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


    protected void bindFillBlank()
    {
        string stuId = Request.Cookies["uId"].Value.ToString();
        var result = (from c in db.proc_GetHaveDoFillBlank(stuId)
                      select c).ToList();
        DataList2.DataSource = result;
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
        if (DataList2.Items.Count == 0)
        {
            PanelC2.Visible = false;
            LabelC2.Text = "您还未做作业，请先做作业!";
        }
    }

    public string sub(string str)
    {
        return str.Substring(3, str.Length - 7);
    }
}

