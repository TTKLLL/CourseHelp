<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PracticeManage.aspx.cs" Inherits="Studetnt_Practice_PracticeManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet" />
    <style type="text/css">
        * {
            font-family: "宋体";
            font-size: 12px;
        }

        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
        }

        .auto-style1 {
            height: 24px;
            width: 110px;
            background-image: url('../../image/maillistbutton1.jpg');
            background-size: 110px 24px;
            background-repeat: no-repeat;
            background-position: center;
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="Header">
                        <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;作业管理</font>
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="Labels">
                        <a href="PracticeManage.aspx" class="Newbutton"><font>&nbsp;做作业&nbsp;</font></a></td>
                    <td class="Labelf">
                        <a href="HaveDoPractice.aspx" class="Newbutton"><font>&nbsp;已完成作业&nbsp;</font></a></td>
                    <td align="right"></td>
                    <td align="right"></td>
                </tr>
            </table>
            <div>
                <asp:GridView ID="gvPractice" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AutoGenerateColumns="False" Width="100%" DataKeyNames="PointID"
                    OnRowDataBound="gvPractice_RowDataBound"
                    UseAccessibleHeader="False" OnPageIndexChanging="gvPratice_PageIndexChanging"
                    PageSize="18" EnableModelValidation="True">
                    <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#E8F4FF" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lbNo" runat="server" Text='<%#Eval("PointID") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编号">
                            <ItemTemplate>
                                <asp:Label ID="label" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField runat="server" HeaderText="一级知识点" DataField="LevelOnePoint"></asp:BoundField>
                        <asp:HyperLinkField DataTextField="LevelTwoPoint" HeaderText="二级知识点" NavigateUrl="StartDoPractice.aspx" DataNavigateUrlFields="PointID"
                            DataNavigateUrlFormatString="StartDoPractice.aspx?PointID={0}"></asp:HyperLinkField>
                        <asp:TemplateField HeaderText="作业开始时间">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbStartTime" Text='<%#Eval("BegDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作业结束时间">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbEndTime" Text='<%#Eval("EndDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="状态">
                            <ItemTemplate>
                                <font>选择题已完成<font style="color:red;font-weight:bolder;"><asp:Label runat="server" ID="lb0"></asp:Label></font>题&nbsp;&nbsp;
                           填空题已完成<font style="color:red;font-weight:bolder"><asp:Label runat="server" ID="lb1"></asp:Label></font>题</font>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" CssClass="redButtonCss" Text="查询" OnClick="Button2_Click" />

            </div>
        </div>
    </form>
</body>
</html>
