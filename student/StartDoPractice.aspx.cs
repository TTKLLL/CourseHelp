using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


public partial class Studetnt_Practice_StartDoPractice : System.Web.UI.Page
{

    DataClassesDataContext db = new DataClassesDataContext();
    // System.Web.UI.WebControls.TextBox ta;
    //System.Web.UI.WebControls.Panel panel2;
    protected void Page_Load(object sender, EventArgs e)
    {

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

        int pointID = Convert.ToInt32(Request.QueryString["PointID"].ToString());
        string stuId = Request.Cookies["uId"].Value.ToString();
        var coutSingle = db.proc_SelectSingleCount(stuId, pointID);

        var result = (from c in db.proc_GetSingle(stuId, pointID)
                      select c).ToArray();
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
        }

        if (result.Length == 0)
        {
            PanelC1.Visible = false;
            LabelC1.Text = "该知识点相关的单选题已经完成！请继续做题！";
        }
    }


    protected void bindFillBlank()
    {
        string stuId = Request.Cookies["uId"].Value.ToString();
        int pointID = Convert.ToInt32(Request.QueryString["PointID"].ToString());
        var coutFill = db.proc_SelectFillCount(stuId, pointID);
        var result = (from c in db.proc_GetFillBlankByPId(stuId, pointID)
                      select c).ToList();
        DataList2.DataSource = result;
        DataList2.DataBind();
        char[] Array = new char[255];
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
        if (coutFill > 0)
        {
            PanelC2.Visible = false;
            LabelC2.Text = "该知识点相关的填空题已经完成！请继续做题！";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string stuId = Request.Cookies["uId"].Value.ToString();
        DialogResult diaResult = MessageBox.Show("请确认是否要提交选中的记录行?", "信息提示!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2, MessageBoxOptions.ServiceNotification);
        if (diaResult == DialogResult.OK)
        {
            //选择题
            //double tbGare = 5;
            //double grade = 0;
            bool isRight = false;


            foreach (DataListItem dl in DataList1.Items)
            {
                System.Web.UI.WebControls.Label lbSingle = (System.Web.UI.WebControls.Label)dl.FindControl("Label2");
                int lbSingleID = Convert.ToInt32(lbSingle.Text.ToString().Trim());
                RadioButtonList rbList = (RadioButtonList)dl.FindControl("RadioButtonList1");

                string StuAnswer = rbList.SelectedValue.ToString().Trim();
                string anserContentOptionA = ((System.Web.UI.WebControls.Label)dl.FindControl("optionA")).Text.ToString().Trim();
                string anserContentOptionB = ((System.Web.UI.WebControls.Label)dl.FindControl("optionB")).Text.ToString().Trim();
                string anserContentOptionC = ((System.Web.UI.WebControls.Label)dl.FindControl("optionC")).Text.ToString().Trim();
                string anserContextOptionD = ((System.Web.UI.WebControls.Label)dl.FindControl("optionD")).Text.ToString().Trim();
                var result = (from c in db.proc_GetSingleAnswerBySinleID(lbSingleID)
                              select c).First();
                string RelAnswer = result.SAnswer;

                if (StuAnswer == RelAnswer)
                {
                    isRight = true;
                }
                else
                {
                    isRight = false;
                }

                db.proc_InsertRealAnserBySingleID(lbSingleID, isRight, StuAnswer, stuId);
            }

            //填空题
            int nComma = 0;

            char[] Array = new char[255];
            bool right = false;
            foreach (DataListItem dl in DataList2.Items)
            {

                System.Web.UI.WebControls.Label lbPoint = (System.Web.UI.WebControls.Label)dl.FindControl("Label8");
                System.Web.UI.WebControls.Label lbFillBlank = (System.Web.UI.WebControls.Label)dl.FindControl("Label2");
                System.Web.UI.WebControls.Label lbPoint1 = (System.Web.UI.WebControls.Label)dl.FindControl("Label7");
                int lbFillBlankID = Convert.ToInt32(lbFillBlank.Text.ToString().Trim());
                var FAnswer = (from c in db.proc_GetDBFlillBlankAnswer(lbFillBlankID)
                               select c).First();
                string answer = FAnswer.FAnswer;
                string[] answerArray = answer.Split('$');
                nComma = answer.Split('$').Length;
                System.Web.UI.WebControls.TextBox stuAnswer = (System.Web.UI.WebControls.TextBox)dl.FindControl("stuAnswer");
                string stuAnswerStr = stuAnswer.Text.ToString().Trim();
                string[] stuAnswerArray = stuAnswerStr.Split('$');
                int stunComma = stuAnswerStr.Split('$').Length;

                if (nComma != stunComma)
                {

                    db.proc_InsertFillBlankByID(stuId, lbFillBlankID, stuAnswerStr, right);
                }
                else
                {

                    for (int i = 0; i < nComma; i++)
                    {
                        if (answerArray[i] != stuAnswerArray[i])
                        {
                            right = false;
                            break;
                        }
                        else
                        {
                            right = true;
                        }
                    }
                    db.proc_InsertFillBlankByID1(stuId, lbFillBlankID, stuAnswerStr, right);

                }
            }
            btnSubmit.Enabled = false;
            Response.Write("<script>alert('提交成功！')</script>");
            Response.Redirect("PracticeManage.aspx");
        }
        else
        {
            DialogResult.Cancel.Equals("true");
        }

    }

    public string sub(string str)
    {
        return str.Substring(3, str.Length - 7);
    }
}

